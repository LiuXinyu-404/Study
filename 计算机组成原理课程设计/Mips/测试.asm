.macro printf(%d)
sw $a0,-4($sp)
sw $v0,-8($sp)
move $a0,%d
	li $v0,1
syscall
lw $v0,-8($sp)
lw $v0,-4($sp)
.end_macro

.macro scanf(%d)
sw $v0,-4($sp)
li $v0,5
	syscall
	move %d,$v0
lw $v0,-4($sp)
.end_macro

.macro printfstring(%d)
la $a0,%d
	li $v0,4
syscall
.end_macro
.text
	scanf(%d)
	printf(%d)