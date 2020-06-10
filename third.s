#Kenny Mejia
#CSC 204
#March 28, 2018
#Test 2

.Data

	twoDimArray:	.quad	0,0,0,0,0,0,0,0,0,0,		#1234567890	Row 0
				0,0,0,0,0,0,0,0,0,0,		#2345678900	Row 1
				0,0,0,0,0,0,0,0,0,0,		#3456789000	Row 2
				0,0,0,0,0,0,0,0,0,0,		#4567890000	Row 3
				0,0,0,0,0,0,0,0,0,0		#5678900000	Row 4
.global_start

.Text

_Start:

	#Initializing Our "Variables"
	xor %rax, %rax				#moving zero into rax - actual numbers being placed in the array
	movq $72, %rdx				#total size of our array minus 8 so we stay within bounds				
	movq $9, %rcx				#Our Counter For The Loop Instruction
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	
	#Code For The Zero Row - Idea Is To Start At The End And Fill In The Array As We Traverse Backwards

	.Row_Zero_Loop:				#Looping Back To Initialize the zero row
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $0, $80), %rbx		#Location In Our Array - Row 0
	movq %rax, (%rbx)			#Moving rax to our index in rbx - First Time We Do This rax is 0
	movq %rcx, %rax				#This Number Will Be Either 9 8 7 6 5 4 3 2 Or 1
	cmpq $0, %rcx				#Checking To See If Our Counter Has Hit 0
	je .Row_One_Start			#Jump If Equal To Our Next Row			
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	Loop .Row_Zero_Loop			#Looping Back To Row_Zero_Loop

	#Code For The First Row

	.Row_One_Start:				#Starting Our New Row
	movq $9, %rcx				#Our Counter For The Loop Instruction
	xor %rax, %rax				#moving zero into rax - actual numbers being placed in the array
	movq $72, %rdx				#total size of our array minus 8 so we stay within bounds	
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $1, $80), %rbx		#Location In Our Array - Row 1
	movq %rax, (%rbx)			#Moving number in rax to our index in rbx - Rax is 0
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	
	.Row_One_Loop:				#Looping Back To Initialize the First row
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $1, $80), %rbx		#Location In Our Array - Row 1
	movq %rax, (%rbx)			#Moving rax to our index in rbx - First Time We Do This rax is 0
	movq %rcx, %rax				#This Number Will Be Either 9 8 7 6 5 4 3 Or 2
	cmpq $1, %rcx				#Checking To See If Our Counter Has Hit 1
	je .Row_Two_Start			#Jump If Equal To Our Next Row			
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	Loop .Row_One_Loop			#Looping Back To Row_One_Loop

	#Code For The Second Row
	
	.Row_Two_Start				#Starting Our New Row
	movq $9, %rcx				#Our Counter For The Loop Instruction
	xor %rax, %rax				#moving zero into rax - actual numbers being placed in the array
	movq $72, %rdx				#total size of our array minus 8 so we stay within bounds	
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $2, $80), %rbx		#Location In Our Array - Row 2
	movq %rax, (%rbx)			#Moving number in rax to our index in rbx - Rax is 0
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $2, $80), %rbx		#Location In Our Array - Row 2
	movq %rax, (%rbx)			#Moving number in rax to our index in rbx - Rax is 0
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array

	.Row_Two_Loop:				#Looping Back To Initialize the Second row
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $2, $80), %rbx		#Location In Our Array - Row 2
	movq %rax, (%rbx)			#Moving rax to our index in rbx - First Time We Do This rax is 0
	movq %rcx, %rax				#This Number Will Be Either 9 8 7 6 5 4 Or 3
	cmpq $2, %rcx				#Checking To See If Our Counter Has Hit 2
	je .Row_Three_Start			#Jump If Equal To Our Next Row			
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	Loop .Row_Two_Loop			#Looping Back To Row_Two_Loop

	#Code For The Third Row

	.Row_Three_Start			#Starting Our New Row
	movq $9, %rcx				#Our Counter For The Loop Instruction
	xor %rax, %rax				#moving zero into rax - actual numbers being placed in the array
	movq $72, %rdx				#total size of our array minus 8 so we stay within bounds	
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $3, $80), %rbx		#Location In Our Array - Row 3
	movq %rax, (%rbx)			#Moving number in rax to our index in rbx - Rax is 0
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $3, $80), %rbx		#Location In Our Array - Row 3
	movq %rax, (%rbx)			#Moving number in rax to our index in rbx - Rax is 0
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $3, $80), %rbx		#Location In Our Array - Row 3
	movq %rax, (%rbx)			#Moving number in rax to our index in rbx - Rax is 0
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array

	.Row_Three_Loop:			#Looping Back To Initialize the Third row
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $3, $80), %rbx		#Location In Our Array - Row 3
	movq %rax, (%rbx)			#Moving rax to our index in rbx - First Time We Do This rax is 0
	movq %rcx, %rax				#This Number Will Be Either 9 8 7 6 5 Or 4
	cmpq $3, %rcx				#Checking To See If Our Counter Has Hit 3
	je .Row_Four_Start			#Jump If Equal To Our Next Row			
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	Loop .Row_Three_Loop			#Looping Back To Row_Three_Loop

	#Code For The Fourth Row

	.Row_Four_Start				#Starting Our New Row
	movq $9, %rcx				#Our Counter For The Loop Instruction
	xor %rax, %rax				#moving zero into rax - actual numbers being placed in the array
	movq $72, %rdx				#total size of our array minus 8 so we stay within bounds	
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $4, $80), %rbx		#Location In Our Array - Row 4
	movq %rax, (%rbx)			#Moving number in rax to our index in rbx - Rax is 0
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $4, $80), %rbx		#Location In Our Array - Row 4
	movq %rax, (%rbx)			#Moving number in rax to our index in rbx - Rax is 0
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $4, $80), %rbx		#Location In Our Array - Row 4
	movq %rax, (%rbx)			#Moving number in rax to our index in rbx - Rax is 0
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array	
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $4, $80), %rbx		#Location In Our Array - Row 4
	movq %rax, (%rbx)			#Moving number in rax to our index in rbx - Rax is 0
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array

	.Row_Four_Loop:				#Looping Back To Initialize the Fourth row
	movq $twoDimArray, %rbx			#moving the array address to rbx - always starting at the same point
	leaq %rdx(%rbx, $4, $80), %rbx		#Location In Our Array - Row 4
	movq %rax, (%rbx)			#Moving rax to our index in rbx - First Time We Do This rax is 0
	movq %rcx, %rax				#This Number Will Be Either 9 8 7 6 Or 5
	cmpq $4, %rcx				#Checking To See If Our Counter Has Hit 4
	je .Exit				#Jump If Equal To Exit		
	sub $8, %rdx				#Subtracting 8 So we Move Down Our Array
	Loop .Row_Four_Loop			#Looping Back To Row_Four_Loop

	.Exit:
	movq $60,%rax				#calling exit
	xorq %rbx,%rbx
	syscall
