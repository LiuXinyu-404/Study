.data
	zfc1:.space 512
	zfc2:.space 512
	zfc3:.space 512
	zfc4:.space 512
	space:.asciiz " "
	huiche:.asciiz "\n"
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
	#读入一号串
	li $t0,0	#i
	li $t1,0	#偏移量
for_1:	
	li $v0,12
	syscall
	sw $v0,zfc1($t1)
	add $t1,$t1,4
	add $t0,$t0,1
blt $t0,$s0,for_1
	#读完一号串
	#读入二号串
	li $t0,0	#i
	li $t1,0	#偏移量
for_2:	
	li $v0,12
	syscall
	sw $v0,zfc2($t1)
	add $t1,$t1,4
	add $t0,$t0,1
blt $t0,$s1,for_2
	#读完二号串
	#读入三号串
	li $t0,0	#i
	li $t1,0	#偏移量
for_3:	
	li $v0,12
	syscall
	sw $v0,zfc3($t1)
	add $t1,$t1,4
	add $t0,$t0,1
blt $t0,$s2,for_3
	#读完三号串
	#开始替换字符串
	li $t0,0
	li $t1,0
for_4:	li $t2,0
	li $t5,0
beq $t0,$s0,print
for_5:	
	add $t3,$t1,$t2
	lw $t8,zfc1($t3)
	lw $t9,zfc2($t2)
	add $t0,$t0,1
	add $t2,$t2,4
	add $t5,$t5,1
	bne $t8,$t9,save_begin
	beq $t5,$s1,tihuan_begin
beq $t8,$t9,for_5

save_begin:
	li $t4,0
for_6:	
	lw $t8,zfc1($t1)
	sw $t8,zfc4($s3)
	add $t4,$t4,4
	add $s3,$s3,4
	add $t1,$t1,4
blt $t4,$t2,for_6
	j for_4
	
tihuan_begin:
	li $t4,0
	li $t6,0
	add $t1,$t1,$t2
for_7:
	lw $t8,zfc3($t4)
	sw $t8,zfc4($s3)
	add $s3,$s3,4
	add $t4,$t4,4
	add $t6,$t6,1
blt $t6,$s2,for_7
	j for_4
	
print:	li $t0,0
for_8:
	lw $a0,zfc4($t0)
	li $v0,11
	syscall
	add $t0,$t0,4
blt $t0,$s3,for_8
	li $v0,10
	syscall