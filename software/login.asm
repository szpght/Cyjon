; Copyright (C) 2013-2015 Wataha.net
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

; kolory, stałe
%include	'config.asm'

; 64 Bitowy kod programu
[BITS 64]

; adresowanie względne (skoki, etykiety)
[DEFAULT REL]

; adres kodu programu w przestrzeni logicznej
[ORG REAL_HIGH_MEMORY_ADDRESS]

start:
	; wyświetl nawe jednostki i prośbę o nazwe konta
	mov	rax,	0x0101	; procedura - wyświetl ciąg znaków na ekranie w miejscu kursora
	mov	rbx,	COLOR_DEFAULT
	mov	rcx,	-1	; wszystkie znaki z ciągu
	mov	rdx,	BACKGROUND_COLOR_DEFAULT
	mov	rsi,	text_login	; wskaźnik do ciągu znaków zakończony terminatorem lub licznikiem
	int	0x40	; wykonaj

	; pobierz od użytkownika ciąg znaków
	mov	rbx,	COLOR_WHITE
	mov	rcx,	16	; ilość pobieranych znaków
	mov	rdi,	text_login_cache	; gdzie przechować pobrane znaki
	call	library_input	; wykonaj

	; wyświetl prośbę o podanie hasła
	mov	rbx,	COLOR_DEFAULT
	mov	rcx,	-1	; wszystkie znaki z ciągu
	mov	rsi,	text_password	; wskaźnik do ciągu znaków zakończony terminatorem lub licznikiem
	int	0x40	; wykonaj

	; pobierz od użytkownika ciąg znaków
	mov	rbx,	BACKGROUND_COLOR_DEFAULT
	mov	rcx,	16	; ilość pobieranych znaków
	mov	rdi,	text_password_cache	; gdzie przechować pobrane znaki
	call	library_input	; wykonaj

	; przesuń kursor na początek linii
	mov	rcx,	-1	; wszystkie znaki z ciągu
	mov	rsi,	text_space	; wskaźnik do ciągu znaków zakończony terminatorem lub licznikiem
	int	0x40	; wykonaj

	; zakończ działanie procesu/programu
	xor	rax,	rax
	int	0x40	; wykonaj

%include	'library/input.asm'
%include	'library/compare_string.asm'

text_login				db	'localhost login: ', ASCII_CODE_TERMINATOR
text_login_cache	times	16	db	0x00
text_password				db	ASCII_CODE_ENTER, ASCII_CODE_NEWLINE, 'Password: ', ASCII_CODE_TERMINATOR
text_password_cache	times	16	db	0x00
text_space				db	ASCII_CODE_ENTER, ASCII_CODE_NEWLINE, ASCII_CODE_NEWLINE, ASCII_CODE_TERMINATOR