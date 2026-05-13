.data
    msg_a:   .asciiz "Digite A: "
    msg_b:   .asciiz "Digite B: "
    msg_ig:  .asciiz "Sao iguais\n"
    msg_mai: .asciiz "Maior: "
    msg_men: .asciiz "Menor: "
    msg_nl:  .asciiz "\n"

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

    beq  $s0, $s1, iguais

    bgt  $s0, $s1, a_maior

    li   $v0, 4
    la   $a0, msg_mai
    syscall
    li   $v0, 1
    move $a0, $s1
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall
    li   $v0, 4
    la   $a0, msg_men
    syscall
    li   $v0, 1
    move $a0, $s0
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall
    j    fim

a_maior:
    li   $v0, 4
    la   $a0, msg_mai
    syscall
    li   $v0, 1
    move $a0, $s0
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall
    li   $v0, 4
    la   $a0, msg_men
    syscall
    li   $v0, 1
    move $a0, $s1
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall
    j    fim

iguais:
    li   $v0, 4
    la   $a0, msg_ig
    syscall

fim:
    li   $v0, 10
    syscall