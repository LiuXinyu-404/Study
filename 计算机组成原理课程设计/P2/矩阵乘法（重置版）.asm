.data
	s1: .space   256
	s2: .space   256
	s3: .space   256
	space: .asciiz " "
	huiche:.asciiz "\n"
.text
	la $s0,s1
 	la $s1,s2
 	la $s2,s3
	#����һ��n��s3
 	li $v0,5
 	syscall
 	move $s3,$v0 #s3���ڴ�n
#forѭ�� for (i=0;i<n;i++)
	move $t2,$s0	#t2��Ϊ��ַ����
	li $t0,0	# $t0 = i
for_1:
#forѭ�� for (j=0;j<n;j++)
	li $t1,0	# $t1 = j
 	add $t0,$t0,1
for_2:
 	li $v0,5
 	syscall
#s1~s2���һ������
 	sw $v0,0($t2)
 	add $t2,$t2,4
 	add $t1,$t1,1
 	blt $t1,$s3,for_2 #if(j<n)��for_2
 	blt $t0,$t1,for_1 #if(i<n)��for_1
#����ѭ��1


#��ʼѭ��2
#forѭ�� for (i=0;i<n;i++)
 	move $t2,$s1	#t2��Ϊ��ַ����
	li $t0,0	# $t0 = i
for_3:
 	#forѭ�� for (j=0;j<n;j++)
 	li $t1,0	# $t1 = j
 	add $t0,$t0,1
for_4:
	li $v0,5
 	syscall
#s1~s2Ϊ��ڶ�������
 	sw $v0,0($t2)
 	add $t2,$t2,4
 	add $t1,$t1,1
 	blt $t1,$s3,for_4 #if(j<n)��for_4
 	blt $t0,$s3,for_3 #if(i<n)��for_3
#����ѭ��2
	li $s4 4
	mult $s3,$s4
	mflo $s4 #s4Ϊƫ����
#��ʼ�������
	move $t3,$s2	#t3��Ϊ��ַ����
	move $t4,$s0	#t4Ϊһ�����ƶ�
 	move $t5,$s1	#t5Ϊ�������ƶ�
#forѭ�� for (k=0;k<n;k++)
 	li $t0,0	#t0Ϊ�㵽����
for_7:
	#forѭ�� for (i=0;i<n;i++)
	li $t1,0	# $t1 = i
 	li $t6,0	# t6Ϊ����һƫ����
for_5:
 	#forѭ�� for (j=0;j<n;j++)
	li $t2,0	# $t3 = j
	#li $t7,0	# t7Ϊ�����ƫ����
for_6:
 	#���ڴ��ж�ȡ�������ֵ��$t0��$t4
  	lw $t8,0($t4)#t4Ϊ1�����ַ�ƶ�
  	lw $t9,0($t5)#t5Ϊ2�����ַ�ƶ�
  	mult $t8,$t9
  	mflo $s5
  	#��lo��ȡ��$s5
 	add $s6,$s6,$s5
 	#�ӵ�$s6
  	add $t4,$t4,4
  	add $t5,$t5,$s4
 	add $t2,$t2,1
 	blt $t2,$s3,for_6 #if(j<n)��for_6
		add $t1,$t1,1
		sw $s6,0($t3)
		li $s6,0
 		add $t3,$t3,4
 		add $t6,$t6,4#t6Ϊ2�����ַƫ����
 		add $t5,$s1,$t6
 		add $t4,$s0,$t7	#t4Ϊһ�����ƶ�
   	blt $t1,$s3,for_5 #if(i<n)��for_5
  		add $t0,$t0,1
  		add $t7,$t7,$s4#s4Ϊ1�����ַ�ƶ�
  		add $t4,$s0,$t7
   		move $t5,$s1
 	blt $t0,$s3,for_7 #if(k<n)��for_7
#�����������
#�������
 	li $t0,0
 	move $t1,$s2
print: 
 	lw $a0,0($t1)
	add $t1,$t1,4
	li $v0,1
 	syscall
	la $a0,space       
 	li $v0,4           
 	syscall
 	add $t0,$t0,1
 	beq $t0,$s3,huiche_begin      
huiche_end: 
	blt $t1,$t3,print

#��������
 li $v0,10
 syscall
 
 huiche_begin: 
	li $t0,0
	la $a0,huiche
	li $v0,4
	syscall
	j huiche_end
