;
;	quadratic equation
;
;	author: github.com/xorentor
;	2011
;
	extern printf

        SECTION .data		

	a:	dd	5
	b:	dd	14
	c:	dd	-40
	four:	dd	4
	two:	dd	2
	x1:	dq	0
	x2:	dq	0
fmt:    db "x2=%f x1=%f", 10, 0 

        SECTION .text                   

        global main		
main:				
        push    ebp		
        mov     ebp, esp
	
	fild	dword [four]
	fild	dword [a]
	fmulp	
	fild	dword [c]
	fmulp	
	fild	dword [b]
	fild	dword [b]
	fmulp	
	fsubrp	
	fsqrt
	; if st0 <= 0 no real or complex roots
	fst	qword [x2]
	fild	dword [b]
	fldz
	fsubrp
	faddp
	fild	dword [a]
	fild	dword [two]
	fmulp
	fdivp
	fstp	qword [x1]
	fld	qword [x2]
	fild	dword [b]
	fldz
	fsubrp
	fsubrp
	fild	dword [a]
	fild	dword [two]
	fmulp
	fdivp
	fstp	qword [x2]

	push	dword [x2 + 4]
	push	dword [x2]	
	push	dword [x1 + 4]
	push	dword [x1]
        push    dword fmt	
        call    printf		
        add     esp, 14h	

        mov     esp, ebp	
        pop     ebp		

	mov	eax, 0		
	ret			

