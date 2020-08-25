print_hex:
	pusha
	mov si, hex_template

	mov bx, dx
	shr bx, 12
	mov bx, [bx+hexabet]
	mov [hex_template+2], bl

	mov bx, dx
	shr bx, 8
	and bx, 0x000f
	mov bx, [bx+hexabet]
	mov [hex_template+3], bl

	mov bx, dx
	shr bx, 4
	and bx, 0x000f
	mov bx, [bx+hexabet]
	mov [hex_template+4], bl

	mov bx, dx
	and bx, 0x000f
	mov bx, [bx+hexabet]
	mov [hex_template+5], bl

	call print

	popa
	ret

;
;Data
;
hex_template:
	db '0x????', 0 

hexabet:
	db '0123456789abcdef'
