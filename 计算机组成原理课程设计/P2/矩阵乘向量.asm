.data
	s0:.space 512
	s1:.space 512
	s2:.space 512
	space:.asciiz " "
.text
		la $s0,s0
		la $s1,s1
		la $s5,s2
		li $v0,5		#����һ��m��s2
		syscall
		move $s2,$v0		#
		li $v0,5		#����һ��n��s3
		syscall
		move $s3,$v0		#
		li $t0,0		#ѭ���������
		move $t3,$s0
for_1:		li $t1,0
for_2:		li $v0,5		#��������
		syscall
		move $t2,$v0		#
		sw $t2,0($t3)		#��
		add $t3,$t3,4		#t3����
		add $t1,$t1,1		#t1����
	blt $t1,$s2,for_2
		add $t0,$t0,1		#t0����
	blt $t0,$s3,for_1
	
	
		li $t0,0		#ѭ�������о���
		move $t3,$s1
for_3:		li $v0,5		#��������
		syscall
		move $t2,$v0		#
		sw $t2,0($t3)		#��
		add $t3,$t3,4		#t3����
		add $t0,$t0,1		#t0����
	blt $t0,$s2,for_3
		move $t3,$s0
		move $t4,$s1
		move $t6,$s5
		li $t0,0
for_4:		li $t1,0
for_5:		lw $t2,0($t3)		#ȡ������
		lw $t5,0($t4)		#ȡ������
		mult $t2,$t5		#�˷�����
		mflo $t2
		add $s4,$s4,$t2		#����
		add $t1,$t1,1		#t1����
		add $t3,$t3,4		#t3����
		add $t4,$t4,4		#t4����
		blt $t1,$s2,for_5
		move $t4,$s1		#t4����
		sw $s4,0($t6)		#��
		li $s4,0
		add $t0,$t0,1		#t0����
		add $t6,$t6,4
		blt $t0,$s3,for_4
		
		move $t6,$s5
		li $t0,0
for_6:		lw $a0,0($t6)
		li $v0,1
		syscall
		la $a0,space
		li $v0,4
		syscall
		add $t0,$t0,1
		add $t6,$t6,4
		blt $t0,$s3,for_6
		
	
		li $v0,10	#��������
		syscall
	
	
	
