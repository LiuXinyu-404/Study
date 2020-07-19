.data
	input: .space 80
.text
	li $v0,5
	syscall
	move $s0,$v0 #s0为有几个数
	#开始循环读入数据
	#for（i=0;i<n;i++）
	li $t0,0 #t0作为i
	li $t1,0 #t1作为地址
Input_begin:
	li $v0,12
	syscall
	sw $v0,0($t1)
	add $t1,$t1,4
	add $t0,$t0,1
	blt $t0,$s0,Input_begin
	#读入结束
	#开始判断是否回文
	#$t0作为头指针，$t1作为尾指针
	#for t0=0,t1=n,t0++,t1--,t0>=t1时结束
	li $t0,0
	sub $t1,$t1,4
huiwen_begin:
	lw $t2,0($t0)
	lw $t3,0($t1)
	bne $t2,$t3,print0_begin
	add $t0,$t0,4
	sub $t1,$t1,4
	blt $t0,$t1,huiwen_begin
	li $a0,1
	li $v0,1
	syscall
	#结束程序
	li $v0,10
	syscall
print0_begin:
	li $a0,0
	li $v0,1
	syscall
	#结束程序
	li $v0,10
	syscall
	
	
	