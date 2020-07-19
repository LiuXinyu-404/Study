.data
	s0:.space 256
	s1:.space 256
	s2:.space 256
.macro scanf($d)
	li $v0,5
	syscall
	move $d,$v0
	.end_macro
#.macro for(%reg, %from, %to, %body)
#	li %reg,%from
#loop:	
#	%body
#	blt %reg,%to,loop
#	.end_macro
#.macro jisua($)
#	
#	.end_macro	
	
.text
	scanf($s0)
	
	