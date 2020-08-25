mov cx, 0
calc_len:
	cmp byte [bx], 0
	je end_calc
	inc bx
	inc cx
	jmp calc_len

end_calc:
	ret
