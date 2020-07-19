sw $t1,4($t2)
sw $t1,8($t2)
lw $t1,0($t2)
lw $t1,4($t2)
lw $t1,8($t2)
s0:
sw $t1,16($t2)
lw $t2,20($t2)
sw $t1,0($t2)
beq  $t9,$t8,s0
subu $t4,$t2,$t1
ori  $t5,$t1,3
and  $t6,$t1,$t2
and  $t7,$t5,$t2
lui  $t1,7
beq  $t9,$t8,s0
