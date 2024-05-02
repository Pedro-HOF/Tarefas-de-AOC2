.data
operand1: .word 0
operand2: .word 0
operation: .word 0
result_str: .asciiz "Resultado: "
newline: .asciiz "\n"

# Mensagens
msg_operand1: .asciiz "Digite o primeiro operando: "
msg_operand2: .asciiz "Digite o segundo operando: "
msg_operation: .asciiz "Digite a operacao (0 - adicao, 1 - subtracao, 2 - multiplicacao, 3 - divisao): "
msg_invalid_operation: .asciiz "Operacao invalida! Por favor, tente novamente."
msg_divide_by_zero: .asciiz "Erro: Divisao por zero!"

.text
.globl main

main:
    li $v0, 4
    la $a0, msg_operand1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    sw $t0, operand1
    
    li $v0, 4
    la $a0, msg_operand2
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    sw $t1, operand2
    
    li $v0, 4
    la $a0, msg_operation
    syscall
    
    li $v0, 5
    syscall
    move $t2, $v0
    sw $t2, operation
    
    lw $t2, operation
    beq $t2, 0, add
    beq $t2, 1, subtract
    beq $t2, 2, multiply
    beq $t2, 3, divide
    
    li $v0, 4
    la $a0, msg_invalid_operation
    syscall
    j end

add:
    lw $t0, operand1
    lw $t1, operand2
    add $t3, $t0, $t1
    j print_result

subtract:
    lw $t0, operand1
    lw $t1, operand2
    sub $t3, $t0, $t1
    j print_result

multiply:
    lw $t0, operand1      
    lw $t1, operand2      
    mult $t0, $t1         
    mflo $t3              
    j print_result        

divide:
    lw $t0, operand1      
    lw $t1, operand2      
    beq $t1, $zero, division_error 
    div $t0, $t1          
    mflo $t3              
    j print_result        
division_error:
    li $v0, 4
    la $a0, msg_divide_by_zero
    syscall
    j end


print_result:
    
    li $v0, 4
    la $a0, result_str
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 10
    syscall

end:
    jr $ra
