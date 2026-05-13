.data
	msg_dolar: .asciiz "Digite um valor em Dolar(US$): "
	msg_real: .asciiz "Valor em real (R$): "
	msg_n1: .asciiz "\n"
	
.text
.globl main

main:
	li $v0, 4
	la $a0, msg_dolar
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, 0
	
	li $t0, 5
	mult $s0, $t0
	mflo $s1
	
	li $v0, 4
	la $a0, msg_real
	syscall
	li $v0, 1
	add $a0, $s1, 0
	syscall
	li $v0, 4
	la $a0, msg_n1
	syscall
	
	