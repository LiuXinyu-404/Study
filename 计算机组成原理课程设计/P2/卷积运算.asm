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
	li $v0,5 #����m1��$s0
	syscall
	move $s0,$v0
	li $v0,5 #����n1��$s1
	syscall
	move $s1,$v0
	li $v0,5 #����m2��$s2
	syscall
	move $s2,$v0
	li $v0,5 #����n2��$s3
	syscall
	move $s3,$v0
	
	#��ʼforѭ����1�ž���
	move $t2,$s6 #t2��Ϊ��ַ�ƶ�
	li $t0,0 #t0��Ϊi
for_1:  li $t1,0 #t1��Ϊj
for_2: 	li $v0,5
	syscall
	sw $v0,0($t2)
	add $t2,$t2,4
	add $t1,$t1,1
	blt $t1,$s0,for_2
	add $t0,$t0,1
	blt $t0,$s1,for_1
	#forѭ������
	
	#��ʼforѭ����2�ž���
	move $t2,$s7 #t2��Ϊ��ַ�ƶ�
	li $t0,0 #t0��Ϊi
for_3:  li $t1,0 #t1��Ϊj
for_4: 	li $v0,5
	syscall
	sw $v0,0($t2)
	add $t2,$t2,4
	add $t1,$t1,1
	blt $t1,$s2,for_4
	add $t0,$t0,1
	blt $t0,$s3,for_3
	#forѭ������
	
	#����m1-m2+1��$t8
	sub $t8 $s0,$s2
	add $t8,$t8,1
	#����n1-n2+1��$t9
	sub $t9 $s1,$s3
	add $t9,$t9,1
	#����һ�ž���ƫ������$t7
	li $t7,4
	mult $s1,$t7
	mflo $t7
	#������ž���ƫ������$t6
	li $t6,4
	mult $s3,$t6
	mflo $t6
	#��ʼforѭ��������
	move $t2,$s6 #t2��Ϊ��ַ�ƶ�
	move $t3,$s7 #t3��Ϊ��ַ�ƶ�
	move $a3,$v1 #a3��Ϊ�ƶ�����
	li $s0,0
	li $s1,0
	li $t0,0 #t0��Ϊi
for_5:  li $t1,0 #t1��Ϊj
for_6: 	li $a2,0 #a2Ϊy
for_7: 	li $a1,0 #a1Ϊx
for_8:  lw $t4,0($t2) #��һ������ȡ��t4
	lw $t5,0($t3) #����һ������ȡ��t5
	mult $t4,$t5
	mflo $s4
	add $t2,$t2,4
	add $t3,$t3,4
	add $s5,$s5,$s4
	add $a1,$a1,1
	blt $a1,$s3,for_8
		add $a2,$a2,1
		add $t2,$s6,$s0 #s0Ϊ����ƫ����
		add $t2,$t2,$s1 #s1Ϊ����ƫ����
		add $a0,$a0,$t7
		add $t2,$t2,$a0
	blt $a2,$s2,for_7
		add $t1,$t1,1
		sw $s5,0($a3)
		add $a3,$a3,4 	#�����ַ�ı�
		li $s5,0 	#����
		li $a0,0
		add $s1,$s1,4 	#����ƫ��������
		move $t3,$s7
		add $t2,$s6,$s0 #�������ƫ����
		add $t2,$t2,$s1 #��������ƫ����
	blt $t1,$t9,for_6
		add $t0,$t0,1
		li $s1,0 	#����ƫ��������
		add $s0,$s0,$t7 #����ƫ��������
		add $t2,$s6,$s0 #�������ƫ����
		add $t2,$t2,$s1 #��������ƫ����
		move $t3,$s7
	blt $t0,$t8,for_5
	#forѭ������
	
	#�������
	li $t0,0
	move $t1,$v1
print_begin:	
	add $t0,$t0,1#forѭ��
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
	 #��������
 	li $v0,10
 	syscall

huiche_begin: 
	li $t0,0
	la $a0,huiche
	li $v0,4
	syscall
	j huiche_end	
	
	
