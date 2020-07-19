.data 
	s0:.space 256	#一号矩阵首地址
	s1:.space 256	#二号矩阵首地址
	s2:.space 256	#新矩阵首地址
	space:.asciiz " "
	huiche:.asciiz "\n"
.text
	li $v0,5	#读入方阵阶数n
	syscall
	move $s0,$v0	#
	#开始读入一号矩阵
	li $t2,0
	li $t0,0
for_1:	li $t1,0
for_2:	li $v0,5
	syscall
	sw $v0,s0($t2)
	add $t2,$t2,4
	add $t1,$t1,1
blt $t1,$s0,for_2
	add $t0,$t0,1
blt $t0,$s0,for_1
	#完成读入一号矩阵
	
	#开始读入二号矩阵
	li $t2,0
	li $t0,0
for_3:	li $t1,0
for_4:	li $v0,5
	syscall
	sw $v0,s1($t2)
	add $t2,$t2,4
	add $t1,$t1,1
blt $t1,$s0,for_4
	add $t0,$t0,1
blt $t0,$s0,for_3
	#完成读入二号矩阵
	#计算矩阵偏移量
	li $s1,4
	mult $s1,$s0
	mflo $s1
	li $s2,4
	mult $s2,$s0
	mflo $s2
	#
	#开始计算新矩阵
	li $t2,0
	li $t7,0
for_5:	li $t0,0
for_6:	li $t1,0
for_7:	add $t2,$t3,$t4
	lw $t8,s0($t2)
	add $t2,$t5,$t6
	lw $t9,s1($t2)
	mult $t8,$t9
	mflo $s3
	add $s4,$s4,$s3
	add $t3,$t3,4	#一号矩阵纵向偏移量增加
	add $t6,$t6,$s2	#二号矩阵纵向偏移量增加
	add $t1,$t1,1
blt $t1,$s0,for_7
	sw $s4,s2($s5)
	li $s4,0
	add $s5,$s5,4
	li $t3,0
	add $t5,$t5,4
	li $t6,0
	add $t0,$t0,1
blt $t0,$s0,for_6
	li $t3,0
	add $t4,$t4,$s1
	li $t5,0
	li $t6,0
	add $t7,$t7,1
blt $t7,$s0,for_5
	#开始输出矩阵
	li $t2,0
	li $t0,0
for_8:	li $t1,0
for_9:	lw $a0,s2($t2)
	li $v0,1
	syscall
	la $a0,space
	li $v0,4
	syscall
	add $t2,$t2,4
	add $t1,$t1,1
blt $t1,$s0,for_9
	la $a0,huiche
	li $v0,4
	syscall
	add $t0,$t0,1
blt $t0,$s0,for_8
	li $v0,10
	syscall
	
	