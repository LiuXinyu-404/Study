.data
	input: .space   12000           
	size: .word  60            
	space:.asciiz  " "
	huiche:.asciiz "\n"
 .text
 	#����n��m���浽$t1��$t2
 	la $t0,input
 	la $t5,size
	li $v0,5
	syscall
	sw $v0,0($t0)
	lw $t1 0($t0)	#t1 = n
	li $v0,5
	syscall
	sw $v0,4($t0)
	lw $t2,4($t0)	#t2 = m
	#��������������ʼ��Ϊ1������$t3��$t4
	li $t3,1	#t3 -> n
	li $t4,1	#t4 -> m
loop:
	#����1����
	bgt $t3,$t1,print
	li $v0,5
	syscall
	#��������С��д����ڴ�
	sw $v0,0($t0)
	sw $t4,4($t0)
	sw $t3,8($t0)
	#���мӣ��ж��Ƿ��м�
	addi $t4,$t4,1
	bgt $t4,$t2,t4_begin
	#�ж��Ƿ�Ϊ0��Ϊ0��loop����0����
t4_end:beq $v0,$zero,loop
	addi $t0,$t0,12
	j loop
print:
	#���
	addi $t0,$t0,-4
	lw $a0,0($t0)
	li $v0,1
	syscall
	la $a0,space
	li $v0,4
	syscall
	addi $t6,$t6,1
	beq $t6,3,huiche_begin
huiche_end:
	bgtz $t0,print
	li $v0,10
	syscall
	
	
t4_begin:addi $t3,$t3,1
	 li $t4,1
	 j t4_end
	 
huiche_begin: 
	li $t6,0
	la $a0,huiche
	li $v0,4
	syscall
	j huiche_end
	
	
	
