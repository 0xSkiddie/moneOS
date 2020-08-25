print:
	print_loop:
		lodsb
		cmp al, 0    ;if al 0,
		je end_print ;end the print function
		mov ah, 0x0e ;BIOS TTY
		int 0x10     ;syscall
		jmp print    ;loop until string ends

	end_print:
		ret
