#Kenny Mejia
#CSC 204
#Lab 3
#March 30, 2018

.global main

.data
	
	#statements to print out for each register

	command:	.ascii "Register RAX has %d\n\0"
	commandA:	.ascii "Register RBX has %d\n\0"
	commandB:	.ascii "Register RCX has %d\n\0"
	commandC:	.ascii "Register RDX has %d\n\0"
	commandD:	.ascii "Register RBP has %d\n\0"
	commandE:	.ascii "Register RSP has %d\n\0"
	commandF:	.ascii "Register RDI has %d\n\0"
	commandG:	.ascii "Register RSI has %d\n\0"


.text

main:
	
	movq	$5, %rax	#moving 5 to rax
	movq	%rax, %rsi	#moving rax to rsi
	xorq	%rax, %rax	#zeroing out rax
	movq	$command, %rdi	#moving the address of command into rdi
	call	printf		#calling printf
	
	movq	$10, %rbx	#moving 10 to rbx
	movq	%rbx, %rsi	#moving rbx into rsi
	xorq	%rax, %rax	#zeoing out rax
	movq	$commandA, %rdi	#moving the address of commandA into rdi
	call	printf		#calling printf

	movq	$15, %rcx	#moving 15 to rcx
	movq	%rcx, %rsi	#moving rcx to rsi
	xorq	%rax, %rax	#zeroing out rax
	movq	$commandB, %rdi	#moving the address of CommandB into rdi
	call	printf		#calling printf

	movq	$20, %rdx	#moving 20 to rdx
	movq	%rdx, %rsi	#moving rdx to rsi
	xorq	%rax, %rax	#zeroing out rax
	movq	$commandC, %rdi	#moving the address of CommandC into rdi
	call	printf		#calling printf

	movq	%rbp, %rsi	#moving rbp into rsi
	xorq	%rax, %rax	#zeroing out rax
	movq	$commandD, %rdi	#moving the address of CommandD into rdi
	call	printf		#calling printf

	movq	%rsp, %rsi	#moving rsp into rsi
	xorq	%rax, %rax	#zeroing out rax
	movq	$commandE, %rdi	#moving the address of CommandE into rdi
	call 	printf		#calling printf

	movq	%rdi, %rsi	#moving rdi into rsi
	xorq	%rax, %rax	#zeroing out rax
	movq	$commandF, %rdi	#moving the address of CommandF into rdi
	call 	printf		#calling printf

	movq	%rsi, %rsi	#moving rsi into rsi
	xorq 	%rax, %rax	#zeroing out rax
	movq	$commandG, %rdi	#moving the address of CommandG into rdi
	call	printf		#calling printf

ret				#calling ret
