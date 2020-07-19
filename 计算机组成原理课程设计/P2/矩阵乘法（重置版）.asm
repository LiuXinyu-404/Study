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
	#输入一个n到s3
 	li $v0,5
 	syscall
 	move $s3,$v0 #s3用于存n
#for循环 for (i=0;i<n;i++)
	move $t2,$s0	#t2作为地址变量
	li $t0,0	# $t0 = i
for_1:
#for循环 for (j=0;j<n;j++)
	li $t1,0	# $t1 = j
 	add $t0,$t0,1
for_2:
 	li $v0,5
 	syscall
#s1~s2存第一个矩阵
 	sw $v0,0($t2)
 	add $t2,$t2,4
 	add $t1,$t1,1
 	blt $t1,$s3,for_2 #if(j<n)跳for_2
 	blt $t0,$t1,for_1 #if(i<n)跳for_1
#结束循环1


#开始循环2
#for循环 for (i=0;i<n;i++)
 	move $t2,$s1	#t2作为地址变量
	li $t0,0	# $t0 = i
for_3:
 	#for循环 for (j=0;j<n;j++)
 	li $t1,0	# $t1 = j
 	add $t0,$t0,1
for_4:
	li $v0,5
 	syscall
#s1~s2为存第二个矩阵
 	sw $v0,0($t2)
 	add $t2,$t2,4
 	add $t1,$t1,1
 	blt $t1,$s3,for_4 #if(j<n)跳for_4
 	blt $t0,$s3,for_3 #if(i<n)跳for_3
#结束循环2
	li $s4 4
	mult $s3,$s4
	mflo $s4 #s4为偏移量
#开始计算矩阵
	move $t3,$s2	#t3作为地址变量
	move $t4,$s0	#t4为一矩阵移动
 	move $t5,$s1	#t5为二矩阵移动
#for循环 for (k=0;k<n;k++)
 	li $t0,0	#t0为算到哪行
for_7:
	#for循环 for (i=0;i<n;i++)
	li $t1,0	# $t1 = i
 	li $t6,0	# t6为矩阵一偏移量
for_5:
 	#for循环 for (j=0;j<n;j++)
	li $t2,0	# $t3 = j
	#li $t7,0	# t7为矩阵二偏移量
for_6:
 	#从内存中读取矩阵的数值到$t0和$t4
  	lw $t8,0($t4)#t4为1矩阵地址移动
  	lw $t9,0($t5)#t5为2矩阵地址移动
  	mult $t8,$t9
  	mflo $s5
  	#从lo读取到$s5
 	add $s6,$s6,$s5
 	#加到$s6
  	add $t4,$t4,4
  	add $t5,$t5,$s4
 	add $t2,$t2,1
 	blt $t2,$s3,for_6 #if(j<n)跳for_6
		add $t1,$t1,1
		sw $s6,0($t3)
		li $s6,0
 		add $t3,$t3,4
 		add $t6,$t6,4#t6为2矩阵地址偏移量
 		add $t5,$s1,$t6
 		add $t4,$s0,$t7	#t4为一矩阵移动
   	blt $t1,$s3,for_5 #if(i<n)跳for_5
  		add $t0,$t0,1
  		add $t7,$t7,$s4#s4为1矩阵地址移动
  		add $t4,$s0,$t7
   		move $t5,$s1
 	blt $t0,$s3,for_7 #if(k<n)跳for_7
#结束计算矩阵
#输出矩阵
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

#跳出程序
 li $v0,10
 syscall
 
 huiche_begin: 
	li $t0,0
	la $a0,huiche
	li $v0,4
	syscall
	j huiche_end
