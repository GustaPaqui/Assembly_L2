.data
    msg_s:   .asciiz "Salario atual: R$ "
    msg_r:   .asciiz "Novo salario:  R$ "
    msg_nl:  .asciiz "\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_s
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0

    li   $t0, 25
    mult $s0, $t0
    mflo $t1

    li   $t0, 100
    div  $t1, $t0
    mflo $t2

    add  $s1, $s0, $t2

    li   $v0, 4
    la   $a0, msg_r
    syscall
    li   $v0, 1
    move $a0, $s1
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 10
    syscall