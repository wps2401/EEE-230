#William Schuhmann Class ID: 795
#EEE 230 Assignment 3

.data 

.word 0 
.word 0 
.word 0 
.word 0 
.globl main 
.text

main:


#Prompt the user to enter a number, read the number and then store it into memory at address 0x10010000

	#prompt
	addi $v0,$0,4							#add immediate $0 and 4, store in $v0
	addi $a0,$0,0x00000016					#add immediate $0 and 0x00000016, store in $a0
	syscall									#system call

	#read			
	addi $v0,$0,5							#add immediate $0m and 5, store in $v0
	syscall									#system call

	#save
	addi $t0,$0,0x00000000					#add immediate 0x00000000 and $0, store in $t0
	sw $v0,($t0)							#store word, $v0 is source and $t0 is memory address


#Prompt the user to enter a number, read the number and then store it into memory at address 0x10010004

	#prompt
	addi $v0,$0,4							#add immediate $0 and 4, store in $v0
	addi $a0,$0,0x00000016					#add immediate $0 and 0x00000016, store in $a0
	syscall									#system call

	#read
	addi $v0,$0,5							#add immediate $0m and 5, store in $v0
	syscall									#system call

	#save
	addi $t0,$0,0x00000004					#add immediate $0 and 0x00000004, store in $t0
	sw $v0,($t0)							#store word, $v0 is source and $t0 is memory address


#Compare the two numbers. Place the larger value into memory at address 0x10010008. 
#Place the smaller value into memory at address 0x1001000C.

	#first num in 3rd word
	FirstSave:								#Symbol FirstSave
	addi $t2,$0,0x00000008					#add immediate $0 and 0x00000008, store in $t2
    sw $t0,($t2)							#store word, $t0 is source and $t2 is memory address

	#second num in 3rd word
	SecondSave:								#symbol SecondSave
	addi $t2,$0,0x00000008					#add immediate $0 and 0x00000008, store in $t2
    sw $t0,($t2)							#store word, $t0 is source and $t2 is memory address

	#First Num
	addi $a0,$0,0x00000000					#add immediate $0 and 0x00000000, store in $a0
	lw $t0,($a0)							#load word, $t0 is register destination and $a0 is source

	#compare
	bgt $t0,$v0,FirstSave					#branch if greater than, $t0 is first source register, $v0 is second source register
	addi $t2,$0,0x00000008					#add immediate $0 and 0x00000008, store in $t2

	#compare again if second less than first
	bgt $v0,$t0,SecondSave					#branch if greater than, $v0 is first source register, $t0 is second source register
	addi $t2,$0,0x00000003 					# add immediate $0 and 0x00000003, store in $t2

	




