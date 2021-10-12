#using exchange sort
# code of c++
#______resursive______
#sort(int arr[],int n){
#    if(n==1)
#	break;
#    for(int i=0; i<n-1; i++){
#	if( arr[i] > arr[i+1])
#	    swap(arr[i],arr[i+1])
#    }
#    sort(arr,n-1)
#}

.data
array: 	.space 100   
space: 	.asciiz " "

.text
	li $s6, 0
main:
	li $v0, 5        
	syscall

	addi $t3, $v0 ,0                    
	add $t1, $zero, $zero #t1 as 0                
	sll $t1, $t0, 2                       

	sw $t3, array ( $t1 )#store in to array
	addi $s6, $s6, 1#count++          
	addi $t0, $t0, 1                          
	bne $t3, $zero, main #if input !=0, then keep input                
	
	la $a0, array  #load address of array                      
	subi $a1, $s6, 1
	subi $s6, $s6, 2                    

	jal temp                            

	la $t0, array #array address                      
	li $t1, 0 
	
printoutarray:
	lw $a0, 0($t0) #print                      
	li $v0, 1
	syscall
	la $a0, space
    	li $v0, 4
   	syscall #show space
	addi $t0, $t0, 4                      
	addi $t1, $t1, 1                      
	slt $t2, $s6, $t1                     
	beq $t2, $zero, printoutarray  #not 0 , keep printing                

	li $v0, 10 #end the code                          
	syscall		                                       

temp:
	li $t0, 0                            

check:
	addi $t0, $t0, 1                      
	bgt $t0, $a1 ,end #if (n==1) then break;             
	add $t1, $a1, $zero                   

sortrecursive:
	bge $t0, $t1,check           
	subi $t1, $t1,1                      
	sll $t4, $t1, 2                     
	subi $t3, $t4, 4                    
	add $t4, $t4,$a0                     
	add $t3, $t3,$a0 
	lw $t5, 0($t4)
	lw $t6, 0($t3)
	addi $sp, $sp, -8#push 2 item into stack
	sw $t5, 4($sp) 
	sw $t6,0($sp)
	  

change:
	lw  $t6, 0($sp)
	lw $t5, 4($sp) 
	bgt $t5,  $t6, sortrecursive
	sw $t5, 0($t3)
	sw $t6, 0($t4) 
	addi $sp, $sp, 8#pop 2 item from stack
	j sortrecursive#finsih swap, recursive
	
end:
	jr $ra

