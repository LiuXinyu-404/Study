.data
	zfc1:.space 1024
	zfc2:.space 1024
	zfc3:.space 1024
	zfc4:.space 1024
.text	
	li $v0,5	#读入m
	syscall
	move $s0,$v0	#
	li $v0,5	#读入p
	syscall
	move $s1,$v0	#
	li $v0,5	#读入q
	syscall
	move $s2,$v0	#
	#读入一号字符串
	li $t0,0
	li $t2,0
for_1:
	li $v0,12
	syscall
	sw $v0,zfc1($t2)
	add $t2,$t2,4
	add $t0,$t0,1
blt $t0,$s0,for_1
	#完成读入一号字符串
	#读入二号字符串
	li $t0,0
	li $t2,0
for_2:
	li $v0,12
	syscall
	sw $v0,zfc2($t2)
	add $t2,$t2,4
	add $t0,$t0,1
blt $t0,$s1,for_2
	#完成读入二号字符串
	#读入三号字符串
	li $t0,0
	li $t2,0
for_3:
	li $v0,12
	syscall
	sw $v0,zfc3($t2)
	add $t2,$t2,4
	add $t0,$t0,1
blt $t0,$s2,for_3
	#完成读入三号字符串
	li $t0,0
	li $t1,-4
	#开始存新字符串
for_4:	
	li $t2,0
	li $t5,0
	add $t0,$t0,1
	add $t1,$t1,4
	beq $t0,$s0,print
for_5:	
	add $t3,$t1,$t2
	lw $t8,zfc1($t3)
	lw $t9,zfc2($t2)
bne $t8,$t9,cun
	add $t5,$t5,1 
	add $t2,$t2,4
blt $t5,$s1,for_5
	li $t6,0
	li $t4,0
for_6:	
	lw $t7,zfc3($t4)
	sw $t7,zfc4($s3)
	add $s3,$s3,4
	add $t4,$t4,4
	add $t6,$t6,1
blt $t6,$s2,for_6
	add $t1,$t1,$t2
	sub $t1,$t1,4
	j for_4
	
print:	li $t2,0	
for_7:	lw $a0,zfc4($t2)
	li $v0,11
	syscall
	add $t2,$t2,4
	blt $t2,$s3,for_7
	li $v0,10
	syscall

cun:	add $t1,$t1,$t2
	li $t7,0
for_8:
	sw $t8,zfc4($s3)
	add $s3,$s3,4
	add $t7,$t7,4
	blt  $t7,$t2,for_8
	j for_4
		
	