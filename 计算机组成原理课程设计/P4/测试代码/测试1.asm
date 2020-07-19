ori $t5,$t1,100
sw $t5,4($t6)
lw $t7,8($t6)
sw $t5,-4($t5)
sw $fp,4($t6)
lw $fp,8($t6)
sw $fp,-4($t5)
beq $t8,$t9,s1
addu $t2,$t1,$t2
subu $t3,$t2,$t1
s1:
ori $t5,$t1,100
sw $t5,4($t6)
lw $t7,8($t6)
sw $t5,-4($t5)
sw $fp,4($t6)
lw $fp,8($t6)
sw $fp,-4($t5)
