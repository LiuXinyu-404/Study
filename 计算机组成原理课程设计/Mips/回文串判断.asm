.data
	input: .space 80
.text
	li $v0,5
	syscall
	move $s0,$v0 #s0Ϊ�м�����
	#��ʼѭ����������
	#for��i=0;i<n;i++��
	li $t0,0 #t0��Ϊi
	li $t1,0 #t1��Ϊ��ַ
Input_begin:
	li $v0,12
	syscall
	sw $v0,0($t1)
	add $t1,$t1,4
	add $t0,$t0,1
	blt $t0,$s0,Input_begin
	#�������
	#��ʼ�ж��Ƿ����
	#$t0��Ϊͷָ�룬$t1��Ϊβָ��
	#for t0=0,t1=n,t0++,t1--,t0>=t1ʱ����
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
	#��������
	li $v0,10
	syscall
print0_begin:
	li $a0,0
	li $v0,1
	syscall
	#��������
	li $v0,10
	syscall
	
	
	