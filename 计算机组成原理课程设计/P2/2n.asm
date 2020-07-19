.macro	jisuan(%i,%j)
li $s4,0
mult %i,$s2
mflo $s3
add $s4,$s4,$s3
li $t4,4
mult %j,$t4
mflo $s3
add $s4,$s4,$s3
.end_macro
	
.data
	temp:.space 512
	result:.space 512
	space:.asciiz " "
	huiche:.asciiz "\n"
.text
main:
	li $t0,0
	li $t1,0
	li $v0,5	#输入m
	syscall
	move $s0,$v0
	li $v0,5	#输入n
	syscall
	move $s1,$v0
	li $s2,4
	mult $s2,$s0
	mflo $s2
	li $t0,0
for_7:
for_8:
	jisuan($t0,$t1)
	li $v0,5	#输入数字
	syscall
	sw $v0,temp($s4)
	add $t1,$t1,1
blt $t1,$s0,for_8
	li $t1,0
	add $t0,$t0,1
blt $t0,$s0,for_7
	addi $sp,$sp,-4
	sw $ra,0($sp)
	jal power
	lw $ra,0($sp)
	addi $sp,$sp,4
	li $t0,0
	li $t1,0
for_9:
for_10:
	jisuan($t0,$t1)
	lw $a0,result($s4)
	li $v0,1	#输出数字
	syscall
	la $a0,space
	li $v0,4
	syscall
	add $t1,$t1,1
blt $t1,$s0,for_10
	li $t1,0
	add $t0,$t0,1
	la $a0,huiche
	li $v0,4
	syscall
blt $t0,$s0,for_9
	li $v0,10
	syscall
sqrt:
	li $t0,0
	li $t1,0
	li $t2,0
for_1:
for_2:	
	jisuan($t0,$t1)
	li $t3,0
	sw $t3,result($s4)
for_3:
	jisuan($t0,$t2)
	lw $t8,temp($s4)
	jisuan($t2,$t1)
	lw $t9,temp($s4)
	mult $t8,$t9
	mflo $t3
	jisuan($t0,$t1)
	lw $t9,result($s4)
	add $t3,$t3,$t9
	sw $t3,result($s4)
	add $t2,$t2,1
blt $t2,$s0,for_3
	add $t1,$t1,1
	li $t2,0
blt $t1,$s0,for_2
	li $t1,0
	add $t0,$t0,1
blt $t0,$s0,for_1
	jr $ra

replace:
	li $t0,0
	li $t1,0
for_4:
for_5:
	jisuan($t0,$t1)
	lw $t8,result($s4)
	sw $t8 temp($s4)
	add $t1,$t1,1
blt $t1,$s0,for_5
	li $t1,0
	add $t0,$t0,1
blt $t0,$s0,for_4
	jr $ra

power:
	li $t0,0
for_6:
	addi $sp,$sp,-8
	sw $t0,0($sp)
	sw $ra,4($sp)
	jal sqrt
	lw $t0,0($sp)
	lw $ra,4($sp)
	sw $t0,0($sp)
	sw $ra,4($sp)
	jal replace
	lw $t0,0($sp)
	lw $ra,4($sp)
	addi $sp,$sp,8
	add $t0,$t0,1
blt $t0,$s1,for_6
	jr $ra
	
