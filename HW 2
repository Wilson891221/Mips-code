.data 

space:  .ascii " "

n:      .word 0

a1:   .word 1

a2:   .word 1
.text 
main:
	#compute the first two 1
	li $v0, 5 #input number
	syscall
	sw $v0, n
	lw $t0,n
	la $t1, a1 #loads address of a1
	la $t2, a2 #loads address of a2
	lw $t3, 0($t1) #loads the actual value into t3 
	lw $t4, 0($t2) #loads the actual value into t4 
	move $a0, $t3  
	li $v0, 1
	syscall #show 0 
	la $a0,space 
	li $v0, 4
	syscall #show space
	move $a0,$t4 
	li $v0, 1
	syscall #show 1
	la $a0,space #show space
	li $v0,4
	syscall #show space
	li $t5,2 #counter

loopfib: #start loop
	bge $t5,$t0,endloop #if counter = input number then endloop
	addi $t5,$t5,1 #counter++
	addi,$t2,$t2,4 #now t2 changes to the next address
	add $t6,$t3,$t4 ##add the sum of t3,t4 in to t6
	sw $t6,0($t2) #stores the sum in t2
	move $a0,$t6  
	li $v0, 1
	syscall#show sum
	la $a0,space 
	li $v0,4
	syscall #show space
	move $t3,$t4
	move $t4,$t6
	j loopfib
endloop:
	li $v0,10
	syscall
