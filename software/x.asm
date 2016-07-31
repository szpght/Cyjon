; Copyright (C) 2013-2016 Wataha.net
; All Rights Reserved
;
; LICENSE Creative Commons BY-NC-ND 4.0
; See LICENSE.TXT
;
; Main developer:
;	Andrzej (akasei) Adamczyk [e-mail: akasei from wataha.net]
;-------------------------------------------------------------------------------

; Use:
; nasm - http://www.nasm.us/

; zestaw imiennych wartości stałych jądra systemu
%include	'config.asm'

%define	VARIABLE_PROGRAM_NAME			x
%define	VARIABLE_PROGRAM_VERSION		"v0.1"

VARIABLE_X_COLOR_WHITE			equ	0x00FFFFFF
VARIABLE_X_COLOR_BACKGROUND_DEFAULT	equ	0x003A6EA5

; 64 Bitowy kod programu
[BITS 64]

; adresowanie względne (skoki, etykiety)
[DEFAULT REL]

; adres kodu programu w przestrzeni logicznej
[ORG VARIABLE_MEMORY_HIGH_REAL_ADDRESS]

start:
	; uzyskaj dostęp na wyłączność do przestrzeni pamięci ekranu
	mov	ax,	VARIABLE_KERNEL_SERVICE_VIDEO_ACCESS
	int	STATIC_KERNEL_SERVICE

	; pobierz podstawowe informacje o ekranie
	mov	ax,	VARIABLE_KERNEL_SERVICE_VIDEO_INFO
	int	STATIC_KERNEL_SERVICE

	; zapisz
	mov	qword [variable_x_video_base_address],	rbx	; wskaźnik adresu początku przestrzeni pamięci ekranu
	mov	qword [variable_x_video_width],	r8		; szerokość w pikselach
	mov	qword [variable_x_video_height],	r9	; wysokość w pikselach
	mov	qword [variable_x_video_size],	rcx		; rozmiar przestrzeni pamięci ekranu w Bajtach
	mov	qword [variable_x_video_scanline],	rdx	; prawdziwa szerokość ekranu w Bajtach

	; wyczyść ekran na domyślny kolor
	mov	rax,	VARIABLE_X_COLOR_BACKGROUND_DEFAULT
	call	x_video_clear

	; wyświetl linię :D
	mov	rbx,	VARIABLE_X_COLOR_WHITE
	mov	r8,	50
	mov	r9,	50
	mov	r10,	qword [variable_x_video_width]
	sub	r10,	50
	mov	r11,	100
	call	x_video_draw_line

	; koniec procesu
	xor	ax,	ax
	int	STATIC_KERNEL_SERVICE

; rax - 32 bitowy kolor
x_video_clear:
	; zachowaj oryginalne rejestry
	push	rax
	push	rcx
	push	rdi

	; wyczyść ekran na rządany kolor
	mov	rcx,	qword [variable_x_video_size]
	shr	rcx,	VARIABLE_DIVIDE_BY_4
	mov	rdi,	qword [variable_x_video_base_address]
	rep	stosd

	; przywróć oryginalne rejestry
	pop	rdi
	pop	rcx
	pop	rax

	; powrót z procedury
	ret

; rbx - kolor 24 bitowy
; r8 - x
; r9 - y
x_video_set_pixel:
	; zachowaj oryginalne rejestry
	push	rax
	push	rdx
	push	rdi
	push	r8

	; oblicz przesunięcie do linii Y
	mov	rax,	qword [variable_x_video_scanline]
	xor	rdx,	rdx
	mul	r9

	; oblicz przesunięcie do kolumny X
	shl	r8,	VARIABLE_MULTIPLE_BY_4

	; ustaw wskaźnik na pozycję
	mov	rdi,	qword [variable_x_video_base_address]
	add	rdi,	rax
	add	rdi,	r8

	; ustaw kolor
	mov	rax,	rbx

	; wyświetl
	stosq

	; przywróć oryginalne rejestry
	pop	r8
	pop	rdi
	pop	rdx
	pop	rax

	; powrót z procedury
	ret

; rbx - kolor 24 bitowy
; r8 - x1
; r9 - y1
; r10 - x2
; r11 - y2
x_video_draw_line:
	; zachowaj oryginalne rejestry
	push	rax
	push	rdx
	push	rsi
	push	rdi
	push	r8
	push	r9
	push	r12
	push	r13
	push	r14
	push	r15

	; sprawdź oś x
	; x1 > x2
	cmp	r8,	r10
	ja	.reverse_x

	; kierunek osi x rosnąco
	mov	r12,	1	; xi =	1
	mov	r14,	r10	; dx =	x2
	sub	r14,	r8	; dx -=	x1

	; sprawdź oś y
	jmp	.check_y

.reverse_x:
	; kierunek osi x malejąco
	mov	r12,	-1	; xi =	-1
	mov	r14,	r8	; dx =	x1
	sub	r14,	r10	; dx -=	x2

.check_y:
	; sprawdź oś y
	; y1 > y2
	cmp	r9,	r11
	ja	.reverse_y

	; kierunek osi y rosnąco
	mov	r13,	1	; yi =	1
	mov	r15,	r11	; dy =	y2
	sub	r15,	r9	; dy -=	y1

	; kontynuuj
	jmp	.done

.reverse_y:
	; kierunek osi y malejąco
	mov	r13,	-1	; yi =	-1
	mov	r15,	r9	; dy =	y1
	sub	r15,	r11	; dy -=	y2

.done:
	; względem której osi rysować linię?
	; dy > dx
	cmp	r15,	r14
	ja	.osY

	; rysuj linię względem osi X
	mov	rsi,	r15	; ai =	dy
	sub	rsi,	r14	; ai -=	dx
	shl	rsi,	VARIABLE_MULTIPLE_BY_2
	mov	rdx,	r15	; d =	dy
	shl	rdx,	VARIABLE_MULTIPLE_BY_2
	mov	rdi,	rdx	; bi =	d
	sub	rdx,	r14	; d -=	dx

.loop_x:
	; wyświetl piksel o zdefiniowanym kolorze
	call	x_video_set_pixel

	; jeśli wyświetlony piksel znajduje się w punkcie końca linii, koniec
	; x1 == x2
	cmp	r8,	r10
	je	.end

	; współczynnik ujemny?
	; d
	bt	rdx,	VARIABLE_QWORD_SIGN
	jc	.loop_x_minus

	; oblicz pozycję następnego piksela w linii
	add	r8,	r12	; x +=	xi
	add	r9,	r13	; y +=	yi
	add	rdx,	rsi	; d +=	ai

	; rysuj linię
	jmp	.loop_x

.loop_x_minus:
	; oblicz pozycję następnego piksela w linii
	add	rdx,	rdi	; d +=	bi
	add	r8,	r12	; x +=	xi

	; rysuj linię
	jmp	.loop_x

.osY:
	; rysuj linię względem osi Y
	mov	rsi,	r14	; ai =	dx
	sub	rsi,	r15	; ai -=	dy
	shl	rsi,	VARIABLE_MULTIPLE_BY_2
	mov	rdx,	r14	; d =	dx
	shl	rdx,	VARIABLE_MULTIPLE_BY_2
	mov	rdi,	rdx	; bi =	d
	sub	rdx,	r15	; d -=	dy
	
.loop_y:
	; wyświetl piksel o zdefiniowanym kolorze
	call	x_video_set_pixel

	; jeśli wyświetlony piksel znajduje się w punkcie końca linii, koniec
	; y1 == y2
	cmp	r9,	r11
	je	.end

	; współczynnik ujemny?
	; d
	bt	rdx,	VARIABLE_QWORD_SIGN
	jc	.loop_y_minus

	; oblicz pozycję następnego piksela w linii
	add	r8,	r12	; x +=	xi
	add	r9,	r13	; y +=	yi
	add	rdx,	rsi	; d +=	ai

	; rysuj linię
	jmp	.loop_y

.loop_y_minus:
	; oblicz pozycję następnego piksela w linii
	add	rdx,	rdi	; d +=	bi
	add	r9,	r13	; y +=	yi

	; rysuj linię
	jmp	.loop_y

.end:
	; przywtóć oryginalne rejestry
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	r9
	pop	r8
	pop	rdi
	pop	rsi
	pop	rdx
	pop	rax

	; powrót z procedury
	ret

variable_x_video_base_address		dq	VARIABLE_EMPTY
variable_x_video_width			dq	VARIABLE_EMPTY
variable_x_video_height			dq	VARIABLE_EMPTY
variable_x_video_size			dq	VARIABLE_EMPTY
variable_x_video_scanline		dq	VARIABLE_EMPTY
