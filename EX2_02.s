.data
	msg_um: .asciiz "Digite um valor: "
	msg_dois: .asciiz "Digite outro valor: "
	msg_n1: .asciiz "\n"
.text
main:
	li $v0, 4
	la $a0, msg_um
	syscall
	li $v0, 5
	syscall
	add $t0,$v0, 0
	
	li $v0, 4
	la $a0, msg_dois
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	add $t2, $t0, 0
	add $t0, $t1, 0
	add $t1, $t2, 0
	
	li $v0, 4
	la $a0, msg_um
	syscall
	
	li $v0, 1
	add $a0, $t0, 0
	syscall

	li $v0, 4
	la $a0, msg_n1
	syscall
	
	li $v0, 4
	la $a0, msg_dois
	syscall
	
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	li $v0, 4
	la $a0, msg_n1
	syscall
	
	
	
	
	
	