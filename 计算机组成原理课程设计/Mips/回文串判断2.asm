	li $v0,5
	syscall
	move $s0,$v0
	li $t0,0
	li $t1,0
for_1:	li $v0,12
	syscall
	sw $v0,0($t1)
	add $t1,$t1,4
	add $t0,$t0,1
blt $t0,$s0,for_1
	#ÕÍ≥…∂¡»Î
	
	sub $t1,$t1,4
	li $t2,0
for_2:	lw $t3,0($t1)
	lw $t4,0($t2)
bne $t3,$t4,print_0
	add $t2,$t2,4
	sub $t1,$t1,4
blt $t2,$t1,for_2
	li $a0,1
	li $v0,1
	syscall
	li $v0,10
	syscall
	
	
print_0: li $a0,0
	 li $v0,1
	 syscall
	 li $v0,10
	 syscall
	
	