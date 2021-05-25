.data 

space:  .ascii " "

.text 
main:
	#compute the first two 1
	li $v0, 5 #input number
	syscall
	move $t0, $v0
	li $t1, 1
	li $t2, 1 
	move $a0, $t1  #show 1
	li $v0, 1
	syscall
	la $a0,space #show apce
	li $v0, 4
	syscall
	move $a0,$t2 #show 1
	li $v0, 1
	syscall
	la $a0,space #show space
	li $v0,4
	li $t3,2 #counter
	syscall
loop: 
	bge $t3,$t0,endloop #if counter = input number then endloop
	addi $t3,$t3,1 #counter++
	add $t4,$t1,$t2 #add the sum of t1,t2 in to t4
	move $a0,$t4 #displays sum to console
	li $v0, 1
	syscall #show sum
	la $a0,space 
	li $v0,4
	syscall #show space
	move $t1,$t2
	move $t2,$t4
	j loop
endloop:
	li $v0,10
	syscall
