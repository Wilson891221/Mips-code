#using exchange sort
# code of c++
#for(i=0;  i<n; i++){
#     for(j=i+1; j<n; j++){
#	if(arr[i] > arr[j])
#	     swap(arr[i],arr[j])
#      }
# }

.data
array: 	.space 100   
space: 	.asciiz " "

.text
	li $s6, 0
main:
	li $v0, 5        
	syscall

	move $t3, $v0                     
	add $t1, $zero, $zero #t1 as 0                
	sll $t1, $t0, 2                       

	sw $t3, array ( $t1 )#store in to array
	addi $s6, $s6, 1                
	addi $t0, $t0, 1                          
	bne $t3, $zero, main #if input !=0, then keep input                

	la $a0, array  #load address of array                      
	subi $a1, $s6, 1
	subi $s6, $s6, 2                    

	jal temp                            

	la $t0, array                        
	li $t1, 0 
	
print:
	lw $a0, 0($t0) #print                      
	li $v0, 1
	syscall
	la $a0, space
    	li $v0, 4
   	syscall #show space
	addi $t0, $t0, 4                      
	addi $t1, $t1, 1                      
	slt $t2, $s6, $t1                     
	beq $t2, $zero, print  #not 0 , keep printing                

	li $v0, 10                           
	syscall		                                       

temp:
	li $t0, 0                            

sort:
	addi $t0, $t0, 1                      
	bgt $t0, $a1 ,end #check                 
	add $t1, $a1, $zero                   

loop2:
	bge $t0, $t1,sort                
	subi $t1, $t1,1                      
	sll $t4, $t1, 2                     
	subi $t3, $t4, 4                    
	add $t4, $t4,$a0                     
	add $t3, $t3,$a0                     
	lw $t5, 0($t4)
	lw $t6, 0($t3)

swap:
	bgt $t5, $t6,loop2                   
	sw $t5, 0($t3) #swap two value                      
	sw $t6, 0($t4)
	j loop2
	
end:
	jr $ra

