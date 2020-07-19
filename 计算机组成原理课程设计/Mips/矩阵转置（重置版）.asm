.data
	s0:.space 512
	s1:.space 512
	s2:.space 512
.text	
	li $v0,5	#输入m1到s0
	syscall
	move $s0,$v0	#
	li $v0,5	#输入n1到s1
	syscall
	move $s1,$v0	#
	li $v0,5	#输入m2到s2
	syscall
	move $s2,$v0	#
	li $v0,5	#输入n2到s3
	syscall
	move $s3,$v0	#
	
	li $t0,0
	#读入一号矩阵
for_1:	li $t1,0
for_2:	
	li $v0,5	
	syscall
	sw $v0,s0($t2)
	add $t2,$t2,4
	add $t1,$t1,1
blt $t1,$s1,for_2
	add $t0,$t0,1
blt $t0,$s0,for_1
	#完成读入一号矩阵
	
	li $t0,0
	#读入二号矩阵
for_3: li $t1,0
for_4:	
	li $v0,5	
	syscall
	sw $v0,s1($t2)
	add $t2,$t2,4
	add $t1,$t1,1
blt $t1,$s3,for_4
	add $t0,$t0,1
blt $t0,$s2,for_3
	#完成读入二号矩阵