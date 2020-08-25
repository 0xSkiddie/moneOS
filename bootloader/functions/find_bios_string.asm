find_bios_string:
	mov bx, 0
	mov es, bx

	bios_search_loop:
		mov al, [es:bx]
		cmp al, 'B'
		jne cont_bios_search

		mov al, [es:bx+1]
		cmp al, 'I'
		jne cont_bios_search

		mov al, [es:bx+2]
		cmp al, 'O'
		jne cont_bios_search

		mov al, [es:bx+3]
		cmp al, 'S'
		jne cont_bios_search

		mov dx, bx
		call print_hex

		call print_nl

		mov dx, es
		call print_hex
		ret

	cont_bios_search:
		inc bx
		cmp bx, 0
		je inc_segment
		jmp bios_search_loop

	inc_segment:
		mov cx, es
		add cx, 0x1000
		mov es, cx
		jmp bios_search_loop
