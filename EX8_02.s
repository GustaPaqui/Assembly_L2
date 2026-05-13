.data
    msg_v:   .asciiz "Valor da compra (R$ 1000 a 9999): "
    msg_p:   .asciiz "Valor da parcela (R$ 100 a 500): "
    msg_inv: .asciiz "Valor invalido! Tente novamente.\n"
    msg_r:   .asciiz "Numero de parcelas: "
    msg_nl:  .asciiz "\n"

.text
.globl main

main:
loop_v:
    li   $v0, 4
    la   $a0, msg_v
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0

    blt  $s0, 1000, inv_v
    bgt  $s0, 9999, inv_v
    j    loop_p

inv_v:
    li   $v0, 4
    la   $a0, msg_inv
    syscall
    j    loop_v

loop_p:
    li   $v0, 4
    la   $a0, msg_p
    syscall
    li   $v0, 5
    syscall
    move $s1, $v0

    blt  $s1, 100, inv_p
    bgt  $s1, 500, inv_p
    j    calcular

inv_p:
    li   $v0, 4
    la   $a0, msg_inv
    syscall
    j    loop_p

calcular:
    div  $s0, $s1
    mflo $t0
    mfhi $t1

    beq  $t1, $zero, exibir
    addi $t0, $t0, 1

exibir:
    li   $v0, 4
    la   $a0, msg_r
    syscall
    li   $v0, 1
    move $a0, $t0
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 10
    syscall