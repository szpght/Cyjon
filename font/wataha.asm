; Copyright (C) 2013-2015 Wataha.net
; All Rights Reserved
;
; LICENSE Creative Commons BY-NC-ND 4.0
; See LICENSE.TXT
;
; Main developer:
;	Andrzej (akasei) Adamczyk [e-mail: akasei from wataha.net]
;
; Font by Carramba/Flabra
;-------------------------------------------------------------------------------

; Use:
; nasm - http://www.nasm.us/

variable_font_x_in_pixels	dq	8
variable_font_y_in_pixels	dq	16
variable_font_x_in_bytes	dq	1
variable_font_y_in_bytes	dq	2

; utworzona "od ręki", dlatego taki misz masz

font:
	dq	0x0000000000000000, 0x0000000000000000	; 0x00 - null
	dq	0x0000000000000000, 0x0000000000000000	; 0x01 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x02 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x03 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x04 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x05 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x06 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x07 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x08 - backspace
	dq	0x0000000000000000, 0x0000000000000000	; 0x09 - tab
	dq	0x0000000000000000, 0x0000000000000000	; 0x0A - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x0B - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x0C - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x0D - enter
	dq	0x0000000000000000, 0x0000000000000000	; 0x0E - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x0F - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x10 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x11 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x12 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x13 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x14 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x15 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x16 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x17 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x18 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x19 - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x1A - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x1B - esc 
	dq	0x0000000000000000, 0x0000000000000000	; 0x1C -
	dq	0x0000000000000000, 0x0000000000000000	; 0x1D - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x1E - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x1F - 
	dq	0x0000000000000000, 0x0000000000000000	; 0x20 - space
	dq	0x1010101010000000, 0x0000001010001010	; 0x21 - !
	dq	0x0028282828000000, 0x0000000000000000	; 0x22 - "
	db	0,0,0,0,32+4,32+4,255-129,36,36,255-129,36,36,0,0,0,0	; 0x23 - #
	db	0,0,0,0,16,32+16+8+4,64+16,64+16,32+16+8,16+4,16+4,64+32+16+8,16,0,0,0	; 0x24 - $
	db	0,0,0,32+2,64+16+2,64+16+4,32+8,8,16,16+4,32+8+2,64+8+2,64+4,0,0,0	; 0x25 - %
	db	0,0,0,0,32+16,64+8,64+8,48,48,64+8+2,64+4,64+4,32+16+8+2,0,0,0	; 0x26 - &
	db	0,0,0,16,16,16,16,0,0,0,0,0,0,0,0,0	; 0x27 - ''
	db	0,0,4,8,16,16,32,32,32,32,32,16,16,8,4,0	; 0x28 - (
	db	0,0,32,16,8,8,4,4,4,4,4,8,8,16,32,0	; 0x29 - )
	db	0,0,0,0,0,0,32+4,16+8,255-129,16+8,32+4,0,0,0,0,0	; 0x2A - *
	db	0,0,0,0,0,16,16,16,254,16,16,16,0,0,0,0	; 0x2B - +
	db	0,0,0,0,0,0,0,0,0,0,0,16+8,32+16,32,64,0	; 0x2C - ,
	db	0,0,0,0,0,0,0,0,255-129,0,0,0,0,0,0,0	; 0x2D - -
	db	0,0,0,0,0,0,0,0,0,0,0,16,32+16+8,16,0,0	; 0x2E - .
	db	0,0,2,2,4,4,8,8,16,16,32,32,64,64,0,0	; 0x2F - /
	db	0,0,0,16+8,32+4,64+2,64+2,64+8+2,64+16+2,64+2,64+2,32+4,16+8,0,0,0	; 0x30 - 0
	db	0,0,0,8,16+8,32+8,64+8,8,8,8,8,8,8,0,0,0	; 0x31 - 1
	db	0,0,0,32+16+8+4,64+2,64+2,2,4,8,16,32,64,255-129,0,0,0	; 0x32 - 2
	db	0,0,0,32+16+8+4,64+2,2,2,16+8+4,2,2,64+2,64+2,32+16+8+4,0,0,0	; 0x33 - 3
	db	0,0,0,8+4,16+4,16+4,32+4,32+4,64+4,64+32+16+8+4+2,4,4,4,0,0,0	; 0x34 - 4
	db	0,0,0,255-129,64,64,64+32+16+8+4,64+2,2,2,64+2,64+2,32+16+8+4,0,0,0	; 0x35 - 5
	db	0,0,0,32+16+8+4,64+2,64,64,64+16+8+4,64+32+2,66,66,66,32+16+8+4,0,0,0	; 0x36 - 6
	db	0,0,0,255-129,2,4,4,8,8,16,16,32,32,0,0,0	; 0x37 - 7
	db	0,0,0,32+16+8+4,66,66,66,32+16+8+4,66,66,66,66,32+16+8+4,0,0,0	; 0x38 - 8
	db	0,0,0,32+16+8+4,66,66,66,66+4,32+16+8+2,2,2,66,32+16+8+4,0,0,0	; 0x39 - 9
	db	0,0,0,0,0,16,32+16+8,16,0,0,0,16,32+16+8,16,0,0	; 0x3A - :
	db	0,0,0,0,0,16,32+16+8,16,0,0,0,16+8,32+16,32,64,0	; 0x3B - ;
	db	0,0,0,0,4,8,16,32,64,32,16,8,4,0,0,0	; 0x3C - <
	db	0,0,0,0,0,0,0,255-129,0,0,255-129,0,0,0,0,0	; 0x3D - =
	db	0,0,0,0,64,32,16,8,4,8,16,32,64,0,0,0	; 0x3E - >
	db	0,0,0,64+32+16+8,4,4,8,16,32,32,0,32,32,0,0,0	; 0x3F - ?
	db	0,0,0,16+8+4,32+2,64+2,64+8+4+2,64+16+2,64+16+2,64+16+2,64+8+4,32,16+8+4,0,0,0	; 0x40 - @
	db	0,0,0,32+16+8+4,64+2,66,66,66,255-129,66,66,66,66,0,0,0	; 0x41 - A
	db	0,0,0,64+32+16+8,64+4,64+4,64+4,64+32+16+8+4,66,66,66,66,64+32+16+8+4,0,0,0	; 0x42 - B
	db	0,0,0,32+16+8+4,66,66,64,64,64,64,64,66,32+16+8+4,0,0,0	; 0x43 - C
	db	0,0,0,64+32+16+8,64+4,66,66,66,66,66,66,64+4,64+32+16+8,0,0,0	; 0x44 - D
	db	0,0,0,255-129,64,64,64,64+32+16+8+4,64,64,64,64,255-129,0,0,0	; 0x45 - E
	db	0,0,0,255-129,64,64,64,64+32+16+8+4,64,64,64,64,64,0,0,0	; 0x46 - F
	db	0,0,0,32+16+8+4,66,66,64,64,64+8+4+2,66,66,66,32+16+8+4,0,0,0	; 0x47 - G
	db	0,0,0,66,66,66,66,255-129,66,66,66,66,66,0,0,0	; 0x48 - H
	db	0,0,0,64+32+16+8+4,16,16,16,16,16,16,16,16,64+32+16+8+4,0,0,0	; 0x49 - I
	db	0,0,0,16+8+4+2,2,2,2,2,2,2,66,66,60,0,0,0	; 0x4A - J
	db	0,0,0,66,68,72,64+16,64+32+8,64+8,64+4,64+4,66,66,0,0,0	; 0x4B - K
	db	0,0,0, 64,64,64,64,64,64,64,64,64,64+32+16+8+4+2 ,0,0,0	; 0x4C - L
	db	0,0,0,130,128+64+4+2,128+64+4+2,128+32+8+2,128+32+8+2,128+16+2,128+16+2,130,130,130,0,0,0	; 0x4D - M
	db	0,0,0,66,66+32,66+32,66+16,66+16,66+8,66+8,70,70,66,0,0,0	; 0x4E - N
	db	0,0,0,60,66,66,66,66,66,66,66,66,60,0,0,0	; 0x4F - O
	db	0,0,0,60+64,66,66,66,66,60+64,64,64,64,64,0,0,0	; 0x50 - P
	db	0,0,0,60,66,66,66,66,66,66,66+8,66+8,60,6,0,0	; 0x51 - Q
	db	0,0,0,60+64,66,66,66,66,60+64,64+16,64+8,68,66,0,0,0	; 0x52 - R
	db	0,0,0,60,66,64,64,32+16,8+4,2,2,66,60,0,0,0	; 0x53 - S
	db	0,0,0,254,16,16,16,16,16,16,16,16,16,0,0,0	; 0x54 - T
	db	0,0,0,66,66,66,66,66,66,66,66,66,60,0,0,0	; 0x55 - U
	db	0,0,0,66,66,66,66,66,66,32+4,32+4,24,24,0,0,0	; 0x56 - V
	db	0,0,0,130,130,130,130,130+16,146,130+32+8,130+32+8,68,68,0,0,0	; 0x57 - W
	db	0,0,0,66,66,36,36,24,24,36,36,66,66,0,0,0	; 0x58 - X
	db	0,0,0,66,66,66,66,36,24,8,8,8,8,0,0,0	; 0x59 - Y
	db	0,0,0,255-129,2,4,4,8,16,16,32,64,255-129,0,0,0	; 0x5A - Z
	db	0,0,32+16+8+4,32,32,32,32,32,32,32,32,32,32,32,32+16+8+4,0,	; 0x5B - [
	db	0,0,64,64,32,32,16,16,8,8,4,4,2,2,0,0	; 0x5C - "\"
	db	0,0,32+16+8+4,4,4,4,4,4,4,4,4,4,4,4,32+16+8+4,0	; 0x5D - ]
	db	0,0,0,16+8,32+4,64+2,0,0,0,0,0,0,0,0,0,0	; 0x5E - ^
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,255-129,0	; 0x5F - _
	db	0,0,0,32,32,16,16,0,0,0,0,0,0,0,0,0	; 0x60 - `
	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 00111100b, 00000010b, 00111110b, 01000010b, 01000010b, 01000110b, 00111010b, 0x00, 0x00, 0x00	; 0x61 - a
	db	0x00, 0x00, 0x00, 64, 64, 64, 64+16+8+4, 64+32+2, 66,66,66,64+32+2,64+16+8+4, 0, 0, 0	; 0x62 - b
	db	0, 0, 0, 0, 0, 0, 32+16+8+4, 66, 64,64,64,66,32+16+8+4,0,0,0	; 0x63 - c
	db	0, 0, 0, 2,2,2, 32+16+8+2, 64+4+2, 66,66,66,64+4+2, 32+16+8+2, 0, 0, 0	; 0x64 - d
	db	0,0,0,0,0,0,32+16+8+4,64+2,64+2,64+32+16+8+4+2,64,64,32+16+8+4+2,0,0,0	; 0x65 - e
	db	0,0,0,16+8+4,32+2,32,32,32,64+32+16+8+4,32,32,32,32,0,0,0	; 0x66 - f
	db	0,0,0,0,0,0,32+16+8+2,64+4+2,64+2,64+2,64+4+2,32+16+8+2,2,2,64+2,32+16+8+4	; 0x67 - g
	db	0,0,0,64,64,64,64+16+8+4,64+32+2,66,66,66,66,66,0,0,0	; 0x68 - h
	db	0,0,0,8,8,0,32+16+8,8,8,8,8,8,8,0,0,0	; 0x69 - i
	db	0,0,0,4,4,0,16+8+4,4,4,4,4,4,4,64+4,32+16+8,0	; 0x6A - j
	db	0,0,0,64,64,64+4,64+8,64+16,64+32+16,64+16,64+8,64+4,64+2,0,0,0	; 0x6B - k
	db	0,0,0,32,32,32,32,32,32,32,32,32,16+8+4,0,0,0	; 0x6C - l
	db	0,0,0,0,0,0, 128+64+32+8+4,128+16+2,128+16+2,128+16+2,128+16+2,128+2,128+2,0,0,0	; 0x6D - m
	db	0,0,0,0,0,0,64+16+8+4,64+32+2,66,66,66,66,66,0,0,0	; 0x6E - n
	db	0,0,0,0,0,0,32+16+8+4,66,66,66,66,66,32+16+8+4,0,0,0	; 0x6F - o
	db	0,0,0,0,0,0,64+16+8+4,64+32+2,64+2,64+2,64+2,64+32+2,64+16+8+4,64,64,0	; 0x70 - p
	db	0,0,0,0,0,0,32+16+8+2,64+4+2,64+2,64+2,64+2,64+4+2,32+16+8+2,2,2,0	; 0x71 - q
	db	0,0,0,0,0,0,64+16+8+4,64+32+2,64,64,64,64,64,0,0,0	; 0x72 - r
	db	0,0,0,0,0,0,32+16+8+4,64+2,64,32+16+8+4,2,64+2,32+16+8+4,0,0,0	; 0x73 - s
	db	0,0,0,0,32,32,64+32+16+8,32,32,32,32,32+2,16+8+4,0,0,0	; 0x74 - t
	db	0,0,0,0,0,0,64+2,66,66,66,66,64+2+4,32+16+8+2,0,0,0	; 0x75 - u
	db	0,0,0,0,0,0,64+2,64+2,64+2,32+4,32+4,16+8,16+8,0,0,0	; 0x76 - v
	db	0,0,0,0,0,0,128+2,128+2,128+16+2,128+16+2,128+16+2,128+32+8+2,64+4,0,0,0	; 0x77 - w
	db	0,0,0,0,0,0,64+2,32+4,16+8,0,16+8,32+4,64+2,0,0,0	; 0x78 - x
	db	0,0,0,0,0,0,66,66,66,66,64+4+2,32+16+8+2,2,64+2,32+16+8+4,0	; 0x79 - y
	db	0,0,0,0,0,0,255-129,2,4,8,16,32,255-129,0,0,0	; 0x7A - z
	db	0,8+4,16,16,16,16,16,64+32,16,16,16,16,16,8+4,0,0	; 0x7B - '{'
	db	0,0,16,16,16,16,16,16,16,16,16,16,16,16,0,0	; 0x7C - |
	db	0,32+16,8,8,8,8,8,4+2,8,8,8,8,8,32+16,0,0	; 0x7D - }
	db	0,0,0,0,0,0,0,32,255-129-32-4,4,0,0,0,0,0,0	; 0x7E - ~
	dq	0x0000000000000000, 0x0000000000000000	; 0x7F - delete

	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 00111100b, 00000010b, 00111110b, 01000010b, 01000010b, 01000110b, 00111010b, 4, 2, 0x00	; 0x61 - ą
	db	0,0,0,0,8,0,255-129,2,4,8,16,32,255-129,0,0,0	; 0x7A - ż
	db	0,0,0,4,8,0,32+16+8+4,64+2,64,32+16+8+4,2,64+2,32+16+8+4,0,0,0	; 0x73 - ś
	db	0,0,0,4,8,0,255-129,2,4,8,16,32,255-129,0,0,0	; 0x7A - ź
	db	0,0,0,0,0,0,32+16+8+4,64+2,64+2,64+32+16+8+4+2,64,64,32+16+8+4+2,4,2,0	; 0x65 - ę
	db	0, 0, 0,4,8,0,32+16+8+4, 66, 64,64,64,66,32+16+8+4,0,0,0	; 0x63 - ć
	db	0,0,0,4,8,0,64+16+8+4,64+32+2,66,66,66,66,66,0,0,0	; 0x6E - ń
	db	0,0,0,4,8,0,32+16+8+4,66,66,66,66,66,32+16+8+4,0,0,0	; 0x6F - ó
	db	0,0,0,32,32,32+8,32+16,32,32+64,32,32,32,16+8+4,0,0,0	; 0x6C - ł

	db	0,0,0,32+16+8+4,64+2,66,66,66,255-129,66,66,66,66,4,2,0	; 0x41 - Ą
	db	8,0,0,255-129,2,4,4,8,16,16,32,64,255-129,0,0,0	; 0x5A - Ż
	db	4,8,0,60,66,64,64,32+16,8+4,2,2,66,60,0,0,0	; 0x53 - Ś
	db	4,8,0,255-129,2,4,4,8,16,16,32,64,255-129,0,0,0	; 0x5A - Ź
	db	0,0,0,255-129,64,64,64,64+32+16+8+4,64,64,64,64,255-129,4,2,0	; 0x45 - Ę
	db	4,8,0,32+16+8+4,66,66,64,64,64,64,64,66,32+16+8+4,0,0,0	; 0x43 - Ć
	db	4,8,0,66,66+32,66+32,66+16,66+16,66+8,66+8,70,70,66,0,0,0	; 0x4E - Ń
	db	4,8,0,60,66,66,66,66,66,66,66,66,60,0,0,0	; 0x4F - Ó
	db	0,0,0, 64,64,64+8,64+16,64+32,64,64+128,64,64,64+32+16+8+4+2 ,0,0,0	; 0x4C - Ł
