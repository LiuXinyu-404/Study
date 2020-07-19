.data 
	s1:.space 1000
	s2:.space 1000
	s3:.space 1000
	space: .asciiz " "
	huiche:.asciiz "\n"
.text
	la $s6,s1
	la $s7,s2
	la $v1,s3
	li $v0,5 #读入m1到$s0
	syscall
	move $s0,$v0
	li $v0,5 #读入n1到$s1
	syscall
	move $s1,$v0
	li $v0,5 #读入m2到$s2
	syscall
	move $s2,$v0
	li $v0,5 #读入n2到$s3
	syscall
	move $s3,$v0
	
	#开始for循环存1号矩阵
	move $t2,$s6 #t2作为地址移动
	li $t0,0 #t0作为i
for_1:  li $t1,0 #t1作为j
for_2: 	li $v0,5
	syscall
	sw $v0,0($t2)
	add $t2,$t2,4
	add $t1,$t1,1
	blt $t1,$s0,for_2
	add $t0,$t0,1
	blt $t0,$s1,for_1
	#for循环结束
	
	#开始for循环存2号矩阵
	move $t2,$s7 #t2作为地址移动
	li $t0,0 #t0作为i
for_3:  li $t1,0 #t1作为j
for_4: 	li $v0,5
	syscall
	sw $v0,0($t2)
	add $t2,$t2,4
	add $t1,$t1,1
	blt $t1,$s2,for_4
	add $t0,$t0,1
	blt $t0,$s3,for_3
	#for循环结束
	
	#计算m1-m2+1到$t8
	sub $t8 $s0,$s2
	add $t8,$t8,1
	#计算n1-n2+1到$t9
	sub $t9 $s1,$s3
	add $t9,$t9,1
	#计算一号矩阵偏移量到$t7
	li $t7,4
	mult $s1,$t7
	mflo $t7
	#计算二号矩阵偏移量到$t6
	li $t6,4
	mult $s3,$t6
	mflo $t6
	#开始for循环计算卷积
	move $t2,$s6 #t2作为地址移动
	move $t3,$s7 #t3作为地址移动
	move $a3,$v1 #a3作为移动变量
	li $s0,0
	li $s1,0
	li $t0,0 #t0作为i
for_5:  li $t1,0 #t1作为j
for_6: 	li $a2,0 #a2为y
for_7: 	li $a1,0 #a1为x
for_8:  lw $t4,0($t2) #把一个乘数取到t4
	lw $t5,0($t3) #把另一个乘数取到t5
	mult $t4,$t5
	mflo $s4
	add $t2,$t2,4
	add $t3,$t3,4
	add $s5,$s5,$s4
	add $a1,$a1,1
	blt $a1,$s3,for_8
		add $a2,$a2,1
		add $t2,$s6,$s0 #s0为纵向偏移量
		add $t2,$t2,$s1 #s1为横向偏移量
		add $a0,$a0,$t7
		add $t2,$t2,$a0
	blt $a2,$s2,for_7
		add $t1,$t1,1
		sw $s5,0($a3)
		add $a3,$a3,4 	#保存地址改变
		li $s5,0 	#清零
		li $a0,0
		add $s1,$s1,4 	#横向偏移量增加
		move $t3,$s7
		add $t2,$s6,$s0 #计算横向偏移量
		add $t2,$t2,$s1 #计算纵向偏移量
	blt $t1,$t9,for_6
		add $t0,$t0,1
		li $s1,0 	#横向偏移量清零
		add $s0,$s0,$t7 #纵向偏移量增加
		add $t2,$s6,$s0 #计算横向偏移量
		add $t2,$t2,$s1 #计算纵向偏移量
		move $t3,$s7
	blt $t0,$t8,for_5
	#for循环结束
	
	#输出矩阵
	li $t0,0
	move $t1,$v1
print_begin:	
	add $t0,$t0,1#for循环
	lw $a0,0($t1)
	li $v0,1
	syscall
	la $a0,space       
 	li $v0,4           
 	syscall
	add $t1,$t1,4
	beq $t0,$t9,huiche_begin
huiche_end:
	blt $t1,$a3,print_begin
	 #跳出程序
 	li $v0,10
 	syscall

huiche_begin: 
	li $t0,0
	la $a0,huiche
	li $v0,4
	syscall
	j huiche_end	
	
	
