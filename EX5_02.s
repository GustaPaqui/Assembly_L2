.data
    msg_a:   .asciiz "Coeficiente A: "
    msg_b:   .asciiz "Coeficiente B: "
    msg_c:   .asciiz "Coeficiente C: "
    msg_d2:  .asciiz "DUAS RAIZES REAIS\n"
    msg_d1:  .asciiz "UMA RAIZ REAL\n"
    msg_d0:  .asciiz "NAO EXISTEM RAIZES REAIS\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_a
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0

    li   $v0, 4
    la   $a0, msg_b
    syscall
    li   $v0, 5
    syscall
    move $s1, $v0

    li   $v0, 4
    la   $a0, msg_c
    syscall
    li   $v0, 5
    syscall
    move $s2, $v0

    mult $s1, $s1
    mflo $t0

    li   $t1, 4
    mult $s0, $s2
    mflo $t2
    mult $t2, $t1
    mflo $t2

    sub  $s3, $t0, $t2

    bgtz $s3, duas
    beq  $s3, $zero, uma

    li   $v0, 4
    la   $a0, msg_d0
    syscall
    j    fim

duas:
    li   $v0, 4
    la   $a0, msg_d2
    syscall
    j    fim

uma:
    li   $v0, 4
    la   $a0, msg_d1
    syscall

fim:
    li   $v0, 10
    syscall