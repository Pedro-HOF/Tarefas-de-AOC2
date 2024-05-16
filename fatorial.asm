    .data
format_str: .asciiz "%d\n"
    .text
    .globl main

main:
    # Configura o valor de n para 10
    li $a0, 10

    # Chama a função fatorial
    jal fatorial

    # Imprime o resultado
    move $a0, $v0
    li $v0, 1
    syscall

    # Termina o programa
    li $v0, 10
    syscall

# Código da função fatorial
fatorial:
    # Salvando o endereço de retorno e o valor de n no stack
    addi $sp, $sp, -8       # faz espaço no stack para 2 palavras
    sw $ra, 4($sp)          # salva o endereço de retorno
    sw $a0, 0($sp)          # salva o valor de n
    
    # Verifica se n <= 1
    ble $a0, 1, n_menor_igual_um   # se n <= 1, retorna 1
    
    # Chamada recursiva para calcular fatorial(n-1)
    addi $a0, $a0, -1       # decrementa n em 1
    jal fatorial            # chama fatorial(n-1)
    
    # Retorna n * fatorial(n-1)
    lw $t0, 0($sp)          # carrega o valor de n do stack
    lw $ra, 4($sp)          # carrega o endereço de retorno
    mul $v0, $t0, $v0      # calcula n * fatorial(n-1)
    addi $sp, $sp, 8        # restaura o stack
    jr $ra                  # retorna

n_menor_igual_um:
    # Se n <= 1, retorna 1
    li $v0, 1               # coloca 1 no registrador de retorno
    lw $ra, 4($sp)          # carrega o endereço de retorno
    addi $sp, $sp, 8        # restaura o stack
    jr $ra                  # retorna
