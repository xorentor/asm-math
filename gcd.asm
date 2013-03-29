;
;	gcd - euclidean algorithm
;
;	author: github.com/xorentor
;	2011
;
	extern printf
	
segment .data
	a:	dd	97
	b:	dd	41
	fmt:	db	"gcd: %d", 10, 0
	
segment .bss

segment .text

   	global main
main:
	push   	ebp
	mov	ebp, esp

	mov   	ebx, [a]
	mov   	ecx, [b]

	cmp   	ebx, ecx
	je   	.found

	jg   	.calc
	xchg   	ebx, ecx
   
.calc:
	mov  	eax, ebx
	xor  	edx, edx
	div   	ecx
	test   	edx, edx
	jz   	.found
   
	mul   	ecx
	sub   	ebx, eax
	xchg   	ebx, ecx
	jmp   	.calc

.found:
	push	ecx
	push	fmt
	call	printf
	add	esp, 8

	mov  	esp, ebp
	pop   	ebp

	ret
