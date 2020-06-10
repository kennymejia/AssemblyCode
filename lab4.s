#Kenny Mejia
#CSC 204
#Lab 4
#March 30, 2018

.global main

.data

	command:	.ascii "Register RCX has %d\n\0"

.text

main:
	
	xorq	%rax, %rax	#moving 0 to rax
	movq	$1, %rbx
	addq 	%rbx, %rax 	#adding 1 to rax
	movq	$2, %rbx
	addq	%rbx, %rax	#adding 2 to rax
	movq	$3, %rbx
	addq	%rbx, %rax	#adding 3 to rax
	movq	$4, %rbx
	addq	%rbx, %rax	#adding 4 to rax
	movq	$5, %rbx
	addq	%rbx, %rax	#adding 5 to rax
	movq	$6, %rbx	
	addq	%rbx, %rax	#adding 6 to rax
	movq	$7, %rbx
	addq	%rbx, %rax	#adding 7 to rax
	movq	$8, %rbx
	addq	%rbx, %rax	#adding 8 to rax
	movq	$9, %rbx
	addq	%rbx, %rax	#adding 9 to rax
	movq	$10, %rbx
	addq	%rbx, %rax	#adding 10 to rax

	movq 	%rax, %rcx	#moving total in rax to rcx
	push	%rcx		#preserving rcx since it gets deleted after a call
	push	%rcx		#aligning the stack to 16 bytes
	movq	%rcx, %rsi	#moving rcx to rsi
	xorq	%rax, %rax	#zeroing out rax
	movq	$command, %rdi	#moving the address of command to rdi
	call 	printf 		#calling printf
	popq	%rcx		#popping the stack
	popq	%rcx		#popping the stack again

	movq	$65,%rdx	#moving 65 to rdx
	cmpq 	%rcx,%rdx	#compare rcx and rdx
	jb 	.lessThan	#jump to lessThan if less than
	ja 	.greaterThan	#jump to greaterThan if greater than
	jz 	.equals		#jump to equals if equal or zero flag set

.lessThan:
	
	movq 	$1,%rax		#if rax is 1 then rdx is less than rcx
	jmp 	.exit		#jumps to exit

.greaterThan:
	
	movq 	$2,%rax		#if rax is 2 then rdx is greater than rcx
	jmp 	.exit		#jumps to exit

.equals:
	
	movq 	$3,%rax		#if rax is 3 then rdx equals rcx
	jmp 	.exit		#jumps to exit

.exit:

ret

