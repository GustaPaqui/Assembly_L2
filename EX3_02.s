.data
    msg_mn:  .asciiz "Mes de nascimento: "
    msg_an:  .asciiz "Ano de nascimento: "
    msg_ma:  .asciiz "Mes atual: "
    msg_aa:  .asciiz "Ano atual: "
    msg_r:   .asciiz "Idade em meses: "
    msg_nl:  .asciiz "\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_mn
    syscall
    li   $v0, 5
    syscall
    add $s0, $v0, 0

    li   $v0, 4
    la   $a0, msg_an
    syscall
    li   $v0, 5
    syscall
    add $s1, $v0, 0

    li   $v0, 4
    la   $a0, msg_ma
    syscall
    li   $v0, 5
    syscall
    add $s2, $v0, 0

    li   $v0, 4
    la   $a0, msg_aa
    syscall
    li   $v0, 5
    syscall
    add $s3, $v0, 0

    sub  $t0, $s3, $s1
    li   $t1, 12
    mult $t0, $t1
    mflo $t0

    sub  $t1, $s2, $s0
    add  $s4, $t0, $t1

    li   $v0, 4
    la   $a0, msg_r
    syscall
    li   $v0, 1
    add $a0, $s4, 0
    syscall
    li   $v0, 4
    la   $a0, msg_nl
    syscall

    li   $v0, 10
    syscall