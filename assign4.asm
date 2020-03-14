#William Schuhmann
#EEE 230 Assignment 4
#3/3/2020
#Class ID: 795

#Part 1 and 2 seperated by the dashed line

.data
# add any strings at this point as needed
str1:.asciiz"Enter Number:"
str2:.asciiz"Value in $v0:"
str3:.asciiz"Value is Odd\n"
str4:.asciiz"Value is Even\n"
str5:.asciiz"Sum of Even Values:"
str6:.asciiz"Find Even or Odd Value\n"
str7:.asciiz"Enter values for sum of even numbers\n"

.text
.globl main
main:

li $v0,4 		
la $a0,str6		#stores address of str6 in $a0
syscall

li $v0,4
la $a0,str1 #copy address of msg1 to $a0
syscall

#Read user input
li $v0,5 #read integer syscall is v0 = 5
syscall

move $a0,$v0 #store enter value to $a0, $a0 stores user input

#isodd call
jal isodd

#v0 = 1 -------> odd
#v0 = 0 -------> even
#copy value of $vo to $s0
move $s0,$v0
beq $v0,1,odd

#prints str variable, NOT A DATA STRING
li $v0,4 #print string syscall is v0 = 4
la $a0,str2 #copy address of msg2 to $a0
syscall

#output $s0
move $a0,$s0 #store $v0 into $a0
li $v0,1
syscall

#print the string in variable in str
li $v0,4 
la $a0,str4 #store address of str4 to $a0
syscall

j down	#jump to label down

odd:

#output str
li $v0,4
la $a0,str2 #store address of str2 into $a0
syscall

#print value
move $a0,$s0 #store value 0f $v0 into $a0
li $v0,1
syscall

#output str
li $v0,4 #print string syscall is v0 = 4
la $a0,str3 #copy address of msg3 to $a0
syscall

#-----------------------------------------------------------------------------------------------------------------------------

down:
#output variable in str1
li $v0,4
la $a0,str7 #store address of str7 into $a0
syscall
  
li $t0,0

#call getsum
jal getsum

#print str
li $v0,4
la $a0,str5
syscall

#Print sum
li $v0,1
move $a0,$t0 #$to stores the sum of all even numbers
syscall

#end 
exit:
li $v0,10 #end when $v0 == 10
syscall


#isodd function
isodd:

li $t1,1 #load immediate 1 into $v0

#odd and 1 ------> 1.
#even and 1 ------>0.
and $v0,$a0,$t1

#back to main
jr $ra

#getsum function
getsum:

#store return address of getsum into $ra
move $t3,$ra

loop:

#print variable in str1
li $v0,4 #print string syscall is v0 = 4
la $a0,str1 #store address of str1 into $a0
syscall

#Read user input
li $v0,5
syscall

move $a0,$v0

#if $a0 is less than 0, jump to label stop.
blt $a0,$zero,stop

jal isodd

#if $v0 equal to 0, jump to label even.
beq $v0,$zero,even
j loop #jump to loop

even:  
add $t0,$t0,$a0
j loop
stop:

#stores $t3 in $ra
move $ra,$t3

#back to main
jr $ra

#Given Code Below
jal getsum
ori $a0, $v0, 0 
ori $v0, $0, 1 
syscall

#ends program
end: ori $v0, $0, 10 
syscall
