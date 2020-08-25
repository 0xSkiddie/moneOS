find_string:
	pusha
	call calc_len
	mov bx, 0
	search_loop:
		mov dx, bx
		call print_hex
		call print_nl

;search for string:

		second_loop:
			cmp cx, 0
			je end_search
			mov ax, [si]	
			cmp [bx], ax
			jne cont_search

			check_next_char:
				inc bx
				inc si
				jmp second_loop

		cont_search:
			inc bx
			jmp search_loop

		end_search:
			popa
			ret
