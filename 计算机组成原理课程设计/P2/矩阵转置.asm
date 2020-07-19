.data
	s0:.space 256
	space:.asciiz " "
	huiche:.asciiz "\n"
.text
	la $s0,s0
	li $v0,5	#读入一个m到s1
	syscall
	move $s1,$v0	#
	li $v0,5	#读入一个n到s2
	syscall
	move $s2,$v0	#
	li $t2,4
	mult $t2,$s1
	mflo $t2
	move $t4,$s0
	li $t4,0
	li $t0,0
for_1:	li $t1,0
for_2:	li $v0,5	#读入一个n到v0
	syscall		#
	add $t3,$s0,$t4
	add $t3,$t3,$t5
	sw $v0,0($t3)
	add $t4,$t4,$t2
	add $t1,$t1,1
blt $t1,$s2,for_2
	li $t4,0
	add $t0,$t0,1
	add $t5,$t5,4
blt $t0,$s1,for_1
	#存矩阵结束
	li $t0,0
	move $t3,$s0
for_3:	li $t1,0
for_4:	lw $a0,0($t3)
	li $v0,1
	syscall
	add $t3,$t3,4
	la $a0,space
	li $v0,4
	syscall
	add $t1,$t1,1
blt $t1,$s1,for_4
	la $a0,huiche
	li $v0,4
	syscall
	add $t0,$t0,1
blt $t0,$s2,for_3
	
	li $v0,10
	syscall
	