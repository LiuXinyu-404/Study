.data 
	s0:.space 28
	s1:.space 28
	space:.asciiz" "
	huiche:.asciiz"\n"
.text
		la $s0,s0	#Ϊarray����ռ�
		la $s1,s1	#Ϊsymbol����ռ�
main:	
		li $v0,5 	#����һ��n��s2�żĴ���
		syscall
		move $s2,$v0	#
		li $s3,0	#s3��Ϊindex
	jal FullArray
		li $v0,10
		syscall
FullArray:
		li $t0,0	#t0Ϊi
	bge $s3,$s2,if_1begin
if_1end:
		li $t0,0
for_2:	
		li $t2,4	#����symbolƫ����
		mult $t2,$t0	
		mflo $t2
		add $t2,$s1,$t2	#
		lw $t3,0($t2)	#ȡ��symbol��i��
	beq $t3,0,if_2begin
if_2end:
		add $t0,$t0,1
	blt $t0,$s2,for_2
		jr $ra
if_1begin:
		li $t0,0
for_1:	
		li $t1,4	#����arrayƫ����
		mult $t1,$t0
		mflo $t1	
		add $t1,$s0,$t1 #
		lw $a0,0($t1)	#ȡ��array��i�������
		li $v0,1
		syscall		#
		la $a0,space
		li $v0,4
		syscall
		add $t0,$t0,1	#i++
	blt $t0,$s2,for_1
		la $a0,huiche
		li $v0,4
		syscall
	jr $ra
if_2begin:
		li $t1,4	#����arrayƫ����
		mult $t1,$s3
		mflo $t1	
		add $t1,$s0,$t1 #
		add $t3,$t0,1	
		sw $t3,0($t1)
		li $t2,4	#����symbolƫ����
		mult $t2,$t0	
		mflo $t2
		add $t2,$s1,$t2	#
		li $t3,1
		sw $t3,0($t2)
	
		addi $sp,$sp,-12#��ջ
		sw $t0,0($sp)
		sw $s3,4($sp)
		sw $ra,8($sp)	#
		add $s3,$s3,1	
	jal FullArray
		lw $t0,0($sp)	#��ջ
		lw $s3,4($sp)
		lw $ra,8($sp)	#
		addi $sp,$sp,12
		li $t2,4
		mult $t2,$t0
		mflo $t2
		add $t2,$s1,$t2
		li $t3,0
		sw $t3,0($t2)
	add $t0,$t0,1
	blt $t0,$s2,for_2
	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
