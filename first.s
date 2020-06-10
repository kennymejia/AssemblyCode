#Kenny Mejia
#CSC 204
#Lab 1
#March 1, 2018

.global _start

.data

.text
	
_start:

	xorq	%rax,%rax	#moving 0 to rax
	movq	$1, %rbx
	addq 	%rbx,%rax 	#adding 1 to rax
	movq	$2, %rbx
	addq	%rbx,%rax	#adding 2 to rax
	movq	$3, %rbx
	addq	%rbx,%rax	#adding 3 to rax
	movq	$4, %rbx
	addq	%rbx,%rax	#adding 4 to rax
	movq	$5, %rbx
	addq	%rbx,%rax	#adding 5 to rax
	movq	$6, %rbx	
	addq	%rbx,%rax	#adding 6 to rax
	movq	$7, %rbx
	addq	%rbx,%rax	#adding 7 to rax
	movq	$8, %rbx
	addq	%rbx,%rax	#adding 8 to rax
	movq	$9, %rbx
	addq	%rbx,%rax	#adding 9 to rax
	movq	$10, %rbx
	addq	%rbx,%rax	#adding 10 to rax

	
	movq $60,%rax		#calling exit
	xorq %rbx,%rbx
	syscall
