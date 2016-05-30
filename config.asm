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

%define	VARIABLE_KERNEL_VERSION			"0.578"
%define	VARIABLE_KERNEL_LOCALE			en_US.ASCII

VARIABLE_SELECTOR_TYPE_PROCESS			equ	0x0003
VARIABLE_KERNEL_CS_SELECTOR			equ	0x0008
VARIABLE_KERNEL_DS_SELECTOR			equ	0x0010
VARIABLE_PROCESS_CS_SELECTOR			equ	0x0018
VARIABLE_PROCESS_DS_SELECTOR			equ	0x0020

VARIABLE_EFLAGS_IF				equ	0x00000200	; przerwania włączone

VARIABLE_MEMORY_PAGE_SIZE			equ	0x1000
VARIABLE_MEMORY_PAGE_RECORD_COUNT		equ	512
VARIABLE_MEMORY_PAGE_ALIGN			equ	0xF000
VARIABLE_MEMORY_HIGH_ADDRESS			equ	0xFFFF000000000000
VARIABLE_MEMORY_HIGH_REAL_ADDRESS		equ	0xFFFF800000000000
VARIABLE_MEMORY_HIGH_VIRTUAL_ADDRESS		equ	VARIABLE_MEMORY_HIGH_REAL_ADDRESS - VARIABLE_MEMORY_HIGH_ADDRESS
VARIABLE_MEMORY_PML4_RECORD_SIZE		equ	VARIABLE_MEMORY_HIGH_VIRTUAL_ADDRESS / 256
; adres umowny, jest to przestrzeń gdzie jądro systemu może operować na
; różnej wielkości fragmentach pamięci logicznej, gdzie pamięć fizyczna
; nie sięga
VARIABLE_MEMORY_FREE_LOGICAL_ADDRESS		equ	0x0000400000000000

VARIABLE_ASCII_CODE_TERMINATOR			equ	0x00
VARIABLE_ASCII_CODE_ENTER			equ	0x0D
VARIABLE_ASCII_CODE_NEWLINE			equ	0x0A
VARIABLE_ASCII_CODE_BACKSPACE			equ	0x08
VARIABLE_ASCII_CODE_TAB				equ	0x09
VARIABLE_ASCII_CODE_ESCAPE			equ	0x1B
VARIABLE_ASCII_CODE_SPACE			equ	0x20
VARIABLE_ASCII_CODE_NUMBER			equ	0x30
VARIABLE_ASCII_CODE_TILDE			equ	0x7E
VARIABLE_ASCII_CODE_DELETE			equ	0x7F
VARIABLE_ASCII_CODE_DASH_HORIZONTAL_BOLD	equ	0xC4
VARIABLE_ASCII_CODE_CROSS_BOLD			equ	0xC5
VARIABLE_ASCII_CODE_DASH_DOUBLE_HORIZONTAL	equ	0xCD
VARIABLE_ASCII_CODE_DASH_VERTICAL_BOLD		equ	0xB3
%define	VARIABLE_ASCII_CODE_RETURN		VARIABLE_ASCII_CODE_ENTER, VARIABLE_ASCII_CODE_NEWLINE, VARIABLE_ASCII_CODE_TERMINATOR

VARIABLE_COLOR_BLACK				equ	0x00	; indeks
VARIABLE_COLOR_BLUE				equ	0x01
VARIABLE_COLOR_GREEN				equ	0x02
VARIABLE_COLOR_CYAN				equ	0x03
VARIABLE_COLOR_RED				equ	0x04
VARIABLE_COLOR_VIOLET				equ	0x05
VARIABLE_COLOR_BROWN				equ	0x06
VARIABLE_COLOR_LIGHT_GRAY			equ	0x07
VARIABLE_COLOR_GRAY				equ	0x08
VARIABLE_COLOR_LIGHT_BLUE			equ	0x09
VARIABLE_COLOR_LIGHT_GREEN			equ	0x0A
VARIABLE_COLOR_LIGHT_CYAN			equ	0x0B
VARIABLE_COLOR_LIGHT_RED			equ	0x0C
VARIABLE_COLOR_LIGHT_VIOLET			equ	0x0D
VARIABLE_COLOR_YELLOW				equ	0x0E
VARIABLE_COLOR_WHITE				equ	0x0F

VARIABLE_COLOR_BACKGROUND_BLACK			equ	0x00	; indeks
VARIABLE_COLOR_BACKGROUND_BLUE			equ	0x10
VARIABLE_COLOR_BACKGROUND_GREEN			equ	0x20
VARIABLE_COLOR_BACKGROUND_CYAN			equ	0x30
VARIABLE_COLOR_BACKGROUND_RED			equ	0x40
VARIABLE_COLOR_BACKGROUND_VIOLET		equ	0x50
VARIABLE_COLOR_BACKGROUND_BROWN			equ	0x60
VARIABLE_COLOR_BACKGROUND_LIGHT_GRAY		equ	0x70
; w trybie graficznym nie ma migającego tekstu, dlatego poniższe wykorzystywać z rozwagą
; to samo tyczy się oprogramowania Qemu (nawet w trybie tekstowym)
VARIABLE_COLOR_BACKGROUND_GRAY			equ	0x80	; VARIABLE_COLOR_BACKGROUND_BLACK
VARIABLE_COLOR_BACKGROUND_LIGHT_BLUE		equ	0x90	; VARIABLE_COLOR_BACKGROUND_BLUE
VARIABLE_COLOR_BACKGROUND_LIGHT_GREEN		equ	0xA0	; VARIABLE_COLOR_BACKGROUND_GREEN
VARIABLE_COLOR_BACKGROUND_LIGHT_CYAN		equ	0xB0	; VARIABLE_COLOR_BACKGROUND_CYAN
VARIABLE_COLOR_BACKGROUND_LIGHT_RED		equ	0xC0	; VARIABLE_COLOR_BACKGROUND_RED
VARIABLE_COLOR_BACKGROUND_LIGHT_VIOLET		equ	0xD0	; VARIABLE_COLOR_BACKGROUND_VIOLET
VARIABLE_COLOR_BACKGROUND_YELLOW		equ	0xE0	; VARIABLE_COLOR_BACKGROUND_BROWN
VARIABLE_COLOR_BACKGROUND_WHITE			equ	0xF0	; VARIABLE_COLOR_BACKGROUND_LIGHT_GRAY

VARIABLE_COLOR_DEFAULT				equ	VARIABLE_COLOR_LIGHT_GRAY
VARIABLE_COLOR_BACKGROUND_DEFAULT		equ	VARIABLE_COLOR_BACKGROUND_BLACK

VARIABLE_QWORD_SIZE				equ	8
VARIABLE_DWORD_SIZE				equ	4
VARIABLE_WORD_SIZE				equ	2
VARIABLE_BYTE_SIZE				equ	1

VARIABLE_QWORD_HIGH				equ	0x04
VARIABLE_DWORD_HIGH				equ	0x02
VARIABLE_WORD_HIGH				equ	0x01

VARIABLE_DIVIDE_BY_2				equ	1
VARIABLE_DIVIDE_BY_4				equ	2
VARIABLE_DIVIDE_BY_8				equ	3
VARIABLE_DIVIDE_BY_16				equ	4
VARIABLE_DIVIDE_BY_64				equ	6
VARIABLE_DIVIDE_BY_4096				equ	12

VARIABLE_MULTIPLE_BY_2				equ	1
VARIABLE_MULTIPLE_BY_4				equ	2
VARIABLE_MULTIPLE_BY_8				equ	3
VARIABLE_MULTIPLE_BY_4096			equ	12

VARIABLE_MOVE_HIGH_EAX_TO_AX			equ	16
VARIABLE_MOVE_HIGH_RAX_TO_EAX			equ	32

VARIABLE_PCI_CONFIG_ADDRESS			equ	0x0CF8
VARIABLE_PCI_CONFIG_DATA			equ	0x0CFC
VARIABLE_PIC_COMMAND_PORT0			equ	0x20
VARIABLE_PIC_COMMAND_PORT1			equ	0xA0
VARIABLE_PIC_DATA_PORT0				equ	0x21
VARIABLE_PIC_DATA_PORT1				equ	0xA1

VARIABLE_PIT_CLOCK_HZ				equ	1000	; Hz

VARIABLE_KEYBOARD_CACHE_SIZE			equ	16	; / 2 = 8 znaków

VARIABLE_PROCESS_LIMIT				equ	256

VARIABLE_EMPTY					equ	0
VARIABLE_FULL					equ	-1
VARIABLE_LAST_ITEM				equ	1

VARIABLE_TRUE					equ	1
VARIABLE_FALSE					equ	0

VARIABLE_INCREMENT				equ	1
VARIABLE_DECREMENT				equ	1

VARIABLE_DISK_SECTOR_SIZE			equ	9	; przesunięcie logiczne w lewo wartości 2
VARIABLE_DISK_SECTOR_SIZE_IN_BYTES		equ	0x0200

VARIABLE_CMOS_PORT_IN				equ	0x71
VARIABLE_CMOS_PORT_OUT				equ	0x70

VARIABLE_KERNEL_PHYSICAL_ADDRESS		equ	0x0000000000100000
VARIABLE_KERNEL_STACK_ADDRESS			equ	VARIABLE_MEMORY_HIGH_VIRTUAL_ADDRESS - 0x1000

STATIC_KERNEL_SERVICE				equ	0x40

VARIABLE_KERNEL_SERVICE_PROCESS			equ	0x00
VARIABLE_KERNEL_SERVICE_PROCESS_END		equ	0x0000
VARIABLE_KERNEL_SERVICE_PROCESS_NEW		equ	0x0001
VARIABLE_KERNEL_SERVICE_PROCESS_CHECK		equ	0x0002
VARIABLE_KERNEL_SERVICE_PROCESS_MEMORY_ALLOCATE	equ	0x0003
VARIABLE_KERNEL_SERVICE_PROCESS_LIST		equ	0x0004
VARIABLE_KERNEL_SERVICE_PROCESS_ARGS		equ	0x0005
VARIABLE_KERNEL_SERVICE_PROCESS_PID		equ	0x0006
VARIABLE_KERNEL_SERVICE_PROCESS_KILL		equ	0x0007

VARIABLE_KERNEL_SERVICE_SCREEN			equ	0x01
VARIABLE_KERNEL_SERVICE_SCREEN_CLEAN		equ	0x0100
VARIABLE_KERNEL_SERVICE_SCREEN_PRINT_STRING	equ	0x0101
VARIABLE_KERNEL_SERVICE_SCREEN_PRINT_CHAR	equ	0x0102
VARIABLE_KERNEL_SERVICE_SCREEN_PRINT_NUMBER	equ	0x0103
VARIABLE_KERNEL_SERVICE_SCREEN_CURSOR_GET	equ	0x0104
VARIABLE_KERNEL_SERVICE_SCREEN_CURSOR_SET	equ	0x0105
VARIABLE_KERNEL_SERVICE_SCREEN_SIZE		equ	0x0106
VARIABLE_KERNEL_SERVICE_SCREEN_CURSOR_HIDE	equ	0x0107
VARIABLE_KERNEL_SERVICE_SCREEN_CURSOR_SHOW	equ	0x0108
VARIABLE_KERNEL_SERVICE_SCREEN_SCROLL		equ	0x0109
VARIABLE_KERNEL_SERVICE_SCREEN_SHADOW		equ	0x010A

VARIABLE_KERNEL_SERVICE_KEYBOARD		equ	0x02
VARIABLE_KERNEL_SERVICE_KEYBOARD_GET_KEY	equ	0x0200

VARIABLE_KERNEL_SERVICE_SYSTEM			equ	0x03
VARIABLE_KERNEL_SERVICE_SYSTEM_UPTIME		equ	0x0300
VARIABLE_KERNEL_SERVICE_SYSTEM_DATE		equ	0x0301
VARIABLE_KERNEL_SERVICE_SYSTEM_MEMORY		equ	0x0302

VARIABLE_KERNEL_SERVICE_NETWORK			equ	0x04
VARIABLE_KERNEL_SERVICE_NETWORK_IP_SET		equ	0x0400
VARIABLE_KERNEL_SERVICE_NETWORK_IP_GET		equ	0x0401
VARIABLE_KERNEL_SERVICE_NETWORK_PORT_ASSIGN	equ	0x0402
VARIABLE_KERNEL_SERVICE_NETWORK_PORT_RELEASE	equ	0x0403

VARIABLE_KERNEL_SERVICE_FILESYSTEM_READ_FILE	equ	0x0500
VARIABLE_KERNEL_SERVICE_FILESYSTEM_FILE_SIZE	equ	0x0501
VARIABLE_KERNEL_SERVICE_FILESYSTEM_TOUCH	equ	0x0502
VARIABLE_KERNEL_SERVICE_FILESYSTEM_ROOT_DIR	equ	0x0503
VARIABLE_KERNEL_SERVICE_FILESYSTEM_SAVE_FILE	equ	0x0504
VARIABLE_KERNEL_SERVICE_FILESYSTEM_DELETE	equ	0x0505

VARIABLE_FILESYSTEM_TYPE_FILE			equ	0x8000
VARIABLE_FILESYSTEM_TYPE_DIRECTORY		equ	0x4000

VARIABLE_SCREEN_TEXT_MODE_BASE_ADDRESS		equ	0x000B8000
VARIABLE_SCREEN_TEXT_MODE_WIDTH			equ	80
VARIABLE_SCREEN_TEXT_MODE_HEIGHT		equ	25
VARIABLE_SCREEN_TEXT_MODE_CHAR_SIZE		equ	2	; kod ASCII + atrybut
VARIABLE_SCREEN_TEXT_MODE_LINE_SIZE		equ	VARIABLE_SCREEN_TEXT_MODE_WIDTH * VARIABLE_SCREEN_TEXT_MODE_CHAR_SIZE
VARIABLE_SCREEN_TEXT_MODE_SIZE			equ	VARIABLE_SCREEN_TEXT_MODE_WIDTH * VARIABLE_SCREEN_TEXT_MODE_HEIGHT
VARIABLE_SCREEN_TEXT_MODE_SIZE_IN_BYTES		equ	VARIABLE_SCREEN_TEXT_MODE_SIZE * VARIABLE_SCREEN_TEXT_MODE_CHAR_SIZE

VARIABLE_NIC					equ	0x0200
VARIABLE_NIC_INTEL_82540EM_PCI			equ	0x100E8086

VARIABLE_IDT_RECORD_TYPE_CPU			equ	0xEF00
VARIABLE_IDT_RECORD_TYPE_HARDWARE		equ	0x8F00
VARIABLE_IDT_RECORD_TYPE_SOFTWARE		equ	0xEF00

struc VARIABLE_TABLE_SERPENTINE_RECORD
	.PID	resq	1
	.CR3	resq	1
	.RSP	resq	1
	.FLAGS	resq	1
	.NAME	resb	32
	.ARGS	resq	1
	.SIZE	resb	1
endstruc

STATIC_SERPENTINE_RECORD_BIT_USED		equ	0
STATIC_SERPENTINE_RECORD_BIT_ACTIVE		equ	1
STATIC_SERPENTINE_RECORD_BIT_CLOSED		equ	2
STATIC_SERPENTINE_RECORD_BIT_DAEMON		equ	3
STATIC_SERPENTINE_RECORD_FLAG_USED		equ	00000001b	; rekord w serpentynie jest zajęty przez uruchomiony proces
STATIC_SERPENTINE_RECORD_FLAG_ACTIVE		equ	00000010b	; proces bierze czynny udział w pracy systemu
STATIC_SERPENTINE_RECORD_FLAG_CLOSED		equ	00000100b
STATIC_SERPENTINE_RECORD_FLAG_DAEMON		equ	00001000b
