	.data
format_str: .asciiz "%d\n"
	.text
	.globl main

main:
	li $a0, 10

	jal fatorial

	move $a0, $v0
	li $v0, 1
	syscall

	li $v0, 10
	syscall

fatorial:
	addi $sp, $sp, -8       
	sw $ra, 4($sp)         
	sw $a0, 0($sp)          
    
	ble $a0, 1, n_menor_igual_um   
    
	addi $a0, $a0, -1      
	jal fatorial            
    
	lw $t0, 0($sp)          
	lw $ra, 4($sp)          
	mul $v0, $t0, $v0      
	addi $sp, $sp, 8        
	jr $ra                  

n_menor_igual_um:

	li $v0, 1               
	lw $ra, 4($sp)          
	addi $sp, $sp, 8        
	jr $ra                  
