.data
	s0:.space 512
	s1:.space 512
	s2:.space 512
.text	
	li $v0,5	#����m1��s0
	syscall
	move $s0,$v0	#
	li $v0,5	#����n1��s1
	syscall
	move $s1,$v0	#
	li $v0,5	#����m2��s2
	syscall
	move $s2,$v0	#
	li $v0,5	#����n2��s3
	syscall
	move $s3,$v0	#
	
	li $t0,0
	#����һ�ž���
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
	#��ɶ���һ�ž���
	
	li $t0,0
	#������ž���
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
	#��ɶ�����ž���