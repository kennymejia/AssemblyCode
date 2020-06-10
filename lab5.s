#Kenny Mejia
#CSC 204
#Lab 5

.global main

.data

	command: .ascii "The Sum Of The Numbers You Entered Is \n%d \n\0"
	scanfparam: .asciz "%d"
	prompt: .asciz "Type In A Number And Press Enter "

.text

main:

	movq	$10, %rcx		#counter for our loop
	xorq	%rbx, %rbx		#accumulator

startloop:
	
	movq	$prompt, %rdi		#print out the user prompt
	xorq	%rax, %rax		#no parameters on stack
	push	%rcx			#pushing rcx so we dont lose it
	push	%rbx			#pushing rbx so we dont lose it
	call	printf			#calling printf
	xorq	%rax, %rax		#clearing out rax
	movq 	$scanfparam, %rdi	#parameter for scanf
	movq	$x , %rsi		#address of x
	call 	scanf			#getting the user input
	pop	%rbx			#popping the stack to retrieve the counter
	pop	%rcx			#popping the stack to retrieve the accumulator
	addq	x, %rbx 		#moving user input to accumulator
	cmpq	$0, %rcx		#comparing counter to 0
	je	endloop			#if counter is 0 we exit to get answer
	loop	startloop		#looping back to start loop

endloop:

	movq	$command, %rdi		#printing out the answer
	movq	%rbx, %rsi		#moving our accumulator to rsi
	xorq	%rax, %rax		#zeroing out rax
	call 	printf			#calling printf

ret

.bss	#allocate memory at run time but dont save it in file as init value

	x:	.quad
