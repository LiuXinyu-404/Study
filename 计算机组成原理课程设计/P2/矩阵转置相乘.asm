.data
	s0:.space 256
	s7:.space 256
	t5:.space 256
	space:.asciiz " "
	huiche:.asciiz "\n"
.text
	la $s0,s0
	la $s7,s7
	la $t5,t5
	li $v0,5	#读入一个m1到s1
	syscall
	move $s1,$v0	#
	li $v0,5	#读入一个n1到s2
	syscall		
	move $s2,$v0	#
	li $v0,5	#读入一个m2到s3
	syscall
	move $s3,$v0	#
	li $v0,5	#读入一个n2到s4
	syscall		
	move $s4,$v0	#
	#计算矩阵1一次偏移量
	li $s5,4
	mult $s5,$s1
	mflo $s5
	#开始读入一号矩阵
	#move $t2,$s0
	li $t0,0	#i
for_1:	li $t1,0	#j
for_2:	li $v0,5	#读入一个数到内存
	syscall		
	add $t2,$s0,$t3
	add $t2,$t2,$t4
	sw $v0,0($t2)
	add $t3,$t3,$s5
	add $t1,$t1,1	#t1自增
blt $t1,$s2,for_2
	add $t0,$t0,1	#t0自增
	li $t3,0
	add $t4,$t4,4
blt $t0,$s1,for_1
	#计算矩阵2一次偏移量
	li $s6,4
	mult $s6,$s3
	mflo $s6
	#开始读入二号矩阵
	#move $t2,$s7
	li $t4,0
	li $t0,0	#i
for_3:	li $t1,0	#j
for_4:	li $v0,5	#读入一个数到内存
	syscall		
	add $t2,$s7,$t3
	add $t2,$t2,$t4
	sw $v0,0($t2)
	add $t3,$t3,$s6
	add $t1,$t1,1	#t1自增
blt $t1,$s4,for_4
	add $t0,$t0,1	#t0自增
	li $t3,0
	add $t4,$t4,4
blt $t0,$s3,for_3
	#重新计算矩阵1一次偏移量
	#li $s5,4
	#mult $s5,$s2
	#mflo $s5
	#重新计算矩阵2一次偏移量
	#li $s6,4
	#mult $s6,$s4
	#mflo $s6
	#开始计算并读入矩阵
	move $t2,$t5
	move $t6,$s0
	move $t7,$s7
	li $t3,0
	li $t4,0
	li $s4,0
for_7:	li $t0,0
for_5:	li $t1,0
for_6:	
	add $t6,$s0,$t3
	add $t6,$t6,$t4
	add $t7,$s7,$a2
	add $t7,$t7,$a3
	lw $t8,0($t6)
	lw $t9,0($t7)
	mult $t8,$t9
	mflo $a0
	add $a1,$a1,$a0
	add $t1,$t1,1
	add $t4,$t4,4
	add $a2,$a2,$s6
blt $t1,$s1,for_6
	sw $a1,0($t2)
	add $t2,$t2,4
	add $t0,$t0,1
	add $a3,$a3,4
	li $a1,0
	li $a2,0
	li $t4,0
blt $t0,$s3,for_5
	add $t3,$t3,$s5
	li $a1,0
	li $a3,0
	li $a2,0
	li $t4,0
	add $s4,$s4,1
blt $s4,$s2,for_7
	#循环输出
	move $t2,$t5
	li $t0,0
for_9:	li $t1,0
for_8:	lw $a0,0($t2)
	li $v0,1
	syscall
	la $a0,space
	li $v0,4
	syscall
	add $t1,$t1,1
	add $t2,$t2,4
blt $t1,$s2,for_8
	la $a0,huiche
	li $v0,4
	syscall
	add $t0,$t0,1
blt $t0,$s2,for_9
	li $v0,10	#退出程序
	syscall
	
	
	
	
	
	



	
	
	