.data
.text
.globl main

main:
    li $v0, 5 #Aonde o usuário vai colocar seu comando
        syscall
        move $s0, $v0
    j powerBase2

powerBase2:
    li $s1, 1
    sllv $t0, $s1, $s0
    li $v0, 5 #Aonde o usuário vai colocar seu comando
        syscall
        move $s2, $v0
    mul $t1, $s2, $t0
    j print

print:
    li $v0, 1
    la $a0, ($t1)
    syscall