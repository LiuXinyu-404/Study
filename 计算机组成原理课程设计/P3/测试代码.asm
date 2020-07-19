lui $t1,1
lui $t2,2
addu $t3,$t1,$t2
subu $t3,$t2,$t1
s0:
ori $t5,$t1,100
sw $t5,0($t6)
lw $t7,0($t6)
beq $t8,$t9,s0
