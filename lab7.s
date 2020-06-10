#Kenny Mejia
#CSC 204
#Lab 7

.global main

.data
	
	myArray:	.quad	0,0,0,0,0,0,0,0,0,0
	command: 	.ascii "You Have Entered \n%d \n\0"
	scanfparam: 	.asciz "%d"
	prompt: 	.asciz "Type In A Number And Press Enter "
	promptA:	.asciz	"The Sum Of The Numbers You Entered Is: %d\n"

.text

main:

	movq	$10, %rcx		#counter for our loop
	movq	$myArray, %rbx		#loading address of our array into rbx

startloop:

	movq	$prompt, %rdi		#print out the user prompt
	xorq	%rax, %rax		#no parameters on stack
	push	%rcx			#pushing rcx so we dont lose it
	push	%rbx			#pushing rbx so we dont lose it
	call	printf			#calling printf
	xorq	%rax, %rax		#clearing out rax
	movq 	$scanfparam, %rdi	#parameter for scanf
	movq	$x, %rsi		#address of x
	call 	scanf			#getting the user input
	pop	%rbx			#popping the stack to retrieve the counter
	pop	%rcx			#popping the stack to retrieve the array
	movq	x, %rax			#moving user input to rax
	movq	%rax, (%rbx)		#moving rax into our array
	addq	$8, %rbx 		#moving down the array for our next index
	cmpq	$0, %rcx		#comparing counter to 0
	je	endloop			#if counter is 0 we exit to get answer
	loop	startloop		#looping back to start loop

endloop:

	movq	$myArray, %rax		#loading our array into rax	
	xorq	%rbx, %rbx		#zeroing out our sum accumulator
	xorq	%rcx, %rcx		#zeroing out our counter

sumUp:

	addq	(%rax), %rbx		#adding our numbers to the accumulator
	addq	$8, %rax		#moving down the array
	addq	$1, %rcx		#adding 1 to our accumulator
	cmpq	$10, %rcx		#calling sumUp until we hit 10
	jl	sumUp			#jumping to sumUp if less than 10

	movq	$promptA, %rdi		#moving our output to rdi
	movq	%rbx, %rsi		#moving our sum to rsi
	xorq	%rax, %rax		#zeroing out rax
	call	printf			#calling printf

ret

.bss					#allocate memory at run time

	x:	.quad
