#Kenny Mejia
#CSC 204
#Lab 6

.global main

.Data
	#Outputs Being Printed To The Screen

	myArray:	.quad	0,0,0,0,0,0,0,0,0,0
	scanfparam:	.asciz	"%d"
	prompt:		.asciz	"Type In A Number And Press Enter "
	commandBefore:	.ascii	"The Numbers You Entered Unsorted: %d,\0"
	commandMid:	.asciz	"%d,"
	commandAfter:	.ascii	"\nThe Numbers You Entered Sorted: %d,\0"
	
.Text

main:

	movq	$10, %rcx		#Counter For Our Loops
	movq	$myArray, %rbx		#Address Of Our Array into rbx
	
arrayCreation:
	
	movq	$prompt, %rdi		#print out the user prompt
	xorq	%rax, %rax		#no parameters on stack
	push	%rcx			#pushing rcx so we dont lose it
	push	%rbx			#pushing rbx so we dont lose it
	call	printf			#calling printf
	xorq	%rax, %rax		#clearing out rax
	movq	$scanfparam, %rdi	#parameter for scanf
	movq	$x, %rsi		#address of x	
	call	scanf			#calling scanf
	pop	%rbx			#popping rbx off the stack
	pop	%rcx			#popping rcx off the stack
	movq	x, %r8			#moving user input to r8
	movq	%r8, (%rbx)		#moving our user input into the array
	addq	$8, %rbx		#adding 8 so we move down the array
	subq	$1, %rcx		#subtracting one from rcx
	cmpq	$0, %rcx		#comparing rcx conter to 0
	je	exitLoop		#exit the loop if we filled the array
	jmp	arrayCreation		#jump to arrayCreation if array is not full

	#Now We Broke Out Of Loop Time To Create The Unsorted Array

exitLoop:
	
	movq	$10, %rcx		#creating our outerloop counter
	movq	$myArray, %rax		#loading our array into rax
	movq	$commandBefore, %rdi	#loading our output into rdi
	
printUnsorted:

	movq	%rax, %rsi		#moving the adress of our numbers into rsi
	movq	(%rsi), %rsi		#moving the actual number to rsi
	addq	$8, %rax		#adding 8 so we move down the array
	push	%rax			#pushing where we left off
	push	%rcx			#pushing our counter
	xorq	%rax, %rax		#zeroing out rax
	call	printf			#calling printf
	pop	%rcx			#popping our counter
	pop	%rax			#popping our last used index
	movq	$commandMid, %rdi	#loading our output to rdi
	loop	printUnsorted		#looping back to print the array

	#Finished Printing Out The Unsorted Array

	xorq	%rcx, %rcx		#Loop Counter - zeroing out rcx
	
outerLoop:
	
	movq	$myArray, %rdx		#moving array memory location to rdx
	xorq	%r8, %r8		#zeroing out r8
	addq	$1, %rcx		#adding 1 everytime we loop back to outerLoop
	cmpq	$11, %rcx		#comparing 11 to current iteration
	jl	innerLoop		#jump to innerLoop if rcx is less than 11
	jmp	exit			#jumping to exit if outerLoop is complete

innerLoop:
	
	addq	$1, %r8			#adding 1 to r8 everytime we loop
	movq	(%rdx), %rax		#location of our first number
	addq	$8, %rdx		#moving down the array
	movq	(%rdx), %rbx		#location of our second number
	cmpq	%rbx, %rax		#comparing rax to rbx
	jg	ifStatement		#if rax is bigger then we need to swap
	cmpq	$10, %r8		#after 9 iterations we go back to our outerLoop
	jl	innerLoop		#jump back to innerLoop until we go through all
	jmp	outerLoop		#jumping back to our outerLoop

ifStatement:

	subq	$8, %rdx		#moving back to where rax was
	movq	%rbx, (%rdx)		#rbx is smaller so we put it where rax was
	addq	$8, %rdx		#moving back to where rbx was
	movq	%rax, (%rdx)		#rax is bigger so we put it where rbx was
	jmp	innerLoop		#jumping back to our innerLoop

exit:

	movq	$10, %rcx		#creating our counter in rcx
	movq	$myArray, %rax		#loading adress of the array into rax
	movq	$commandAfter, %rdi	#loading our output to rdi
	
printSorted:

	movq	%rax, %rsi		#moving rax to rsi
	movq	(%rsi), %rsi		#getting our actual number and putting it in rsi
	addq	$8, %rax		#moving down our array
	push	%rax			#pushing our location in the array
	push	%rcx			#pushing our counter
	xorq	%rax, %rax		#zeroing out rax
	call	printf			#calling printf
	pop	%rcx			#popping our counter
	pop	%rax			#popping our location
	movq	$commandMid, %rdi	#loading our output to rdi
	loop	printSorted		#looping back to printSorted

	#Finished Printing Out The Sorted Array

ret

.bss	#allocate memory at run time but dont save it in file as init value

	x:	.quad	


