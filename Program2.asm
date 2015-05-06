#	s/my name/censorbar/
#	Calculates 10 Fibonacci Numbers
#	Program2.asm
.data
NewLine: .asciiz "\n"
.text
#	$t0	Number1		#	$t3	Counter
#	$t1	Number2		#	$t4	10
#	$t2	Add		#	$t5	1
li $t0, 0			# 0 is the first number
li $t1, 1			# 1 is the second number
li $t3, 1			# but don't print 0
li $t4, 10			# max count of 10
li $t5, 1			# value to increment count by
loop:
	bgt $t3, $t4, end	# branch if count > 10
	li $t2, 0		# temporary value resets to 0
	
	li $v0, 1
	move  $a0, $t1
	syscall			# print the Fibonacci number
	
	move $t1, $a0		# put the value back (if needed)
	
	li $v0, 4
	la $a0, NewLine
	syscall			# print newline
	
	add $t2, $t0, $t1	# add $t0 and $t1
	add $t3, $t3, $t5	# invrement counter
	move $t0, $t1		# move the higher number to lower
	move $t1, $t2		# move the sum to the higher number
	j loop			# repeat	
end:
	li $v0, 10		# exit the program
	syscall
#Output
#	1
#	1
#	2
#	3
#	5
#	8
#	13
#	21
#	34
#	55
#	
#	-- program is finished running --
