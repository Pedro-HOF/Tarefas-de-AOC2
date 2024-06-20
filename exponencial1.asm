.data
.text
.globl main

main:
    li $s0, 2
    li $s1, 3
    j power

power:
    li $t0, 0
    li $t1, 1
    loop:
        addi $t0, $t0, 1
        mul $t1, $t1, $s0
        bne $t0, $s1, loop
        j print

print:
    li $v0, 1
    la $a0, ($t1)
    syscall