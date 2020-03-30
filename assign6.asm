#William Schuhmann
#EEE 230 Assignment 6
#3/29/2020
#Class ID: 795


.data
   arr:   .space   20
   sum_value: .space 4
   average_value: .space 4
   num: .word 5
   name: .asciiz "William Schuhmann\n"
   prompt: .asciiz "Enter number "
   sum: .asciiz "\nSum of integers (as integer) = "
   average1: .asciiz "\nAverage of integers (as integer) = "
   average2: .asciiz "\nAverage of integers (as single precision) = "
   new_line: .asciiz "\n\n"

.text
.globl main

main:
   #Print William Schuhmann
   li $v0,4
   la $a0,name
   syscall

   li $t0,3   #Repeat 3 times
  
repeat:
   li $t1,5   #Count 5 numbers
   la $t2,arr
  
again:  
   beqz $t1,next1     #End loop condition

   #Prompt for input
   li $v0,4
   la $a0,prompt
   syscall

   #Reading the input
   li $v0,5
   syscall
   sw $v0,0($t2)
   addi $t2,$t2,4
   addi $t1,$t1,-1
   b again           #Read next integer

next1:
   li $t1,5  
   la $t2,arr
   li $t3,0   #Sum

   #Calculating sum
sum_calc:
   beqz $t1,average1_calc
  
   lw $t4,0($t2)

   add $t3,$t3,$t4

	addi $t5,$zero,5			#stores 5 in $t5 for use in average calculation
  
   addi $t2,$t2,4
   addi $t1,$t1,-1
   b sum_calc

average1_calc:
   #Stores sum
   sw $t3,sum_value
   #Calculating average
	#$t3 contains sum of inputs
   div $t3,$t5										
	mflo $t3										
   #Storing average
   sw $t3,average_value
  
  
   #Output
   li $v0,4
   la $a0,sum
   syscall
   li $v0,1
   lw $a0,sum_value
   syscall

   #Average value of integer
   li $v0,4
   la $a0,average1
   syscall
   li $v0,1
   lw $a0,average_value
   syscall

   #Display average for single precision
   li $v0,4
   la $a0,average2
   syscall

   #Average for single precision
   lwc1 $f0,sum_value
   lwc1 $f1,num
   div.s $f12,$f0,$f1
   li $v0,2
   syscall

   #New line
   li $v0,4
   la $a0,new_line
   syscall

   #Ending loop condition
   addi $t0,$t0,-1
   bnez $t0,repeat
  
   #Clean exit
   li $v0,10
   syscall
