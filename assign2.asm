#William Schuhmann 1215016803
#EEE230 11217 
#Assignment 2

.data
.global main
.text
main:

#Initialize $s0 to 15
addi $s0, $zero, 15

#Initialize $s1 to -4
addi $s1, $zero, -4

#Read an int and place answer into $s2
addi $v0, $zero, 5
syscall						#Keyboard Input
add $s2, $zero, $v0

#Set $s3 to $s1-$s0+$s2
add $s3, $s1, $s2			#Add s1 and s2, store in s3
sub $s3, $s3, $s0			#Subtract s3 and s0, store in s3

#Set $s4 to $s3+$s2-7
addi $s4, $zero, -7			#Add Immediate zero and -7, store in s4
add $s4, $s4, $s2			#Add s4 and s2, store in s4
add $s4, $s4, $s3			#Add s4 and s3, store in s4

#Set $s5 to 20+$s1-$s2
addi $s5, $zero, 20			#Add Immediate zero and 20, store in s5
add $s5, $s5, $s1			#Add s5 and s1, store in s5
sub $s5, $s5, $s2			#Subtract s5 and s2, store in s5

#Swap values in $s0 and $s1
add $t0, $zero, $s1				#Add zero and s1, store in t0
add $s1, $zero, $s0				#Add zero and s0, store in s1
add $s0, $zero, $t0				#Add zero and t0, store in s0

#Set $s2 to -$s2
add $t1, $zero, $s2				#Add zero and s2, store in t1
sub $s2, $s2, $t1				#Subtract s2 and t1, store in s2
sub $s2, $s2, $t1				#Subtract s2 and t1, store in s2

#Print the values for $s0, $s1, $s2, $s3, $s4 and $s5
addi $v0, $zero, 1
add $a0, $s0, $zero
syscall
add $a0, $s1, $zero
syscall
add $a0, $s2, $zero
syscall
add $a0, $s3, $zero
syscall
add $a0, $s4, $zero
syscall
add $a0, $s5, $zero
syscall

#Clean End
addi $v0, $zero, 10
syscall
