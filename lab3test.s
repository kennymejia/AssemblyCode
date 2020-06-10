#Kenny Mejia
#CSC 204
#March 30, 2018

.section	.rodata
command:	.asciz "%d\n"

.data

	var:	.long 1,2,3,4,5
	sum:	.long 0

.text

.global main

.type main

main:	

	pushq	%rbp		#creating a new stack
	subq	$8, %rsp	#aligning the stack to 16 byte boundary
	movq	%rsp, %rbp
	movl	$var, %edx	#the adress of our array is in edx
	movl	$3, %ecx	#moving 3 into ecx - our counter ?

startloop:

	movq	$command, %edi	#the adress of command is moved to edi
	movq	(%edx), %esi	#
	xor	%eax, %eax	#eax = 0
	pushq	$rcx		#pushing onto stack because its not preserved
	pushq	%rdx		#pushing onto stack because its not preserved
	pushq	%rsi		#pushing onto stack beacuse its not preserved
	pushq	%rdi		#pushing onto stack because its not preserved
	call	printf		#calling the function printf
				#restoring registers
	popq	%rdi
	popq	%rsi
	popq	%rdx
	popq	%rcx
	leal	4(%edx), %edx	#increasing the address by four bytes
	loop	startloop	#going back to our label startloop
	addq	$8, %rsp	#cleaning up the alignment
	popq	%rbp		#poping item on stack so we can return
	ret			#calling return

	movq	$60, %rax	#calling exit
	xorq	%rbx, %rbx
	syscall
