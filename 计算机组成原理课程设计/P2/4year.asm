	#����
	li $v0,5
	syscall
	sw $v0,0($t1)
	lw $t1 0($t1)
	#�ж��Ƿ��ܳ�400
	li $t2,400
	div $t1,$t2 
	mfhi $t2
	beq $t2,$zero,if_400
	#�ж��Ƿ��ܳ�100
	li $t3,100
	div $t1 $t3
	mfhi $t3
	beq $t3,$zero,if_100
	#�ж��Ƿ��ܳ�4
	li $t4,4
	div $t1 $t4
	mfhi $t4
	beq $t4,$zero,if_4
	li $a0 0
	li $v0 1
	syscall
	li $v0 10
	syscall
if_400:li $a0 1
	li $v0 1
	syscall
	li $v0 10
	syscall
if_100: li $a0 0
	li $v0 1
	syscall
	li $v0 10
	syscall
if_4:	li $a0 1
	li $v0 1
	syscall
	li $v0 10
	syscall