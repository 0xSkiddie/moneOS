[org 0x7c00]

mov bp, 0xffff
mov sp, bp
mov ax, 0x0000
mov ss, ax

call read_disk

mov si, my_string
call print

jmp $

read_disk:
	mov ah, 0x02
	mov al, 0x01
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	mov bx, 0
	mov es, bx
	mov bx, 0x7c00+512

	int 0x13

	jc disk_error

	;mov si, my_string
	;call print

	ret

disk_error:
	mov si, error_msg
	call print
	jmp $
;
;Functions
;
%include "functions/print.asm"
%include "functions/print_hex.asm"
%include "functions/print_nl.asm"
%include "functions/calc_len.asm"
%include "functions/find_string.asm"
%include "functions/find_bios_string.asm"

;
;Data
;
error_msg:
	db 'Error reading disk', 0

times 510-($-$$) db 0
dw 0xaa55

;
;SECOND SECTOR
;

;
;Data
;
my_string:
	db 'My string', 0

times 512 db 0
