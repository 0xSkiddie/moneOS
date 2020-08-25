print_nl:
	pusha
	mov si, nl_bytes
	call print
	popa
	ret

;
;Data
;
nl_bytes:
	db 0xD, 0xA, 0
