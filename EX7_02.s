.data
    msg_n:   .asciiz "Digite um numero (100-999): "
    msg_inv: .asciiz "Numero invalido! Digite entre 100 e 999.\n"
    msg_c:   .asciiz "CENTENA = "
    msg_d:   .asciiz "DEZENA = "
    msg_u:   .asciiz "UNIDADE = "
    msg_nl:  .asciiz "\n"

.text
.globl main
main:
loop:
    li   $v0, 4
    la   $a0, msg_n
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0

    blt  $s0, 100, invalido
    bgt  $s0, 999, invalido
    j    calcular

invalido:
    li   $v0, 4
    la   $a0, msg_inv
    syscall
    j    loop

calcular:
    li   $t0, 100
    div  $s0, $t0
    mflo $s1
    mfhi $t1

    li   $t0, 10
    div  $t1, $t0
    mflo $s2
    mfhi $s3

    li   $v0, 4
    la   $a0, msg_c
    syscall
    li   $v0, 1
    move $a0, $s1
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 4
    la   $a0, msg_d
    syscall
    li   $v0, 1
    move $a0, $s2
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 4
    la   $a0, msg_u
    syscall
    li   $v0, 1
    move $a0, $s3
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 10
    syscall