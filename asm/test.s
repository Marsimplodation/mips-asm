.section .text
# all syscall numbers are for the linux kernel
# https://syscalls.w3challs.com/?arch=mips_o32
.global __start
__start:
	li $v0, 4004 # write syscall
	li $a0, 1 # stdout file descriptor
	la $a1, hello 
	li $a2, 12 #string length
	syscall
#loop over the buffer and build the sum
__adding:
__adding_init:
	move $t0, $zero # sum
	move $t3, $zero # counter
	la $t1, buffer
	lw $t2, buffer_len # max
__adding_loop:
	lw $t4, ($t1)
	add $t0, $t0, $t4
	addi $t1, $t1, 4
	addi $t3, $t3, 1
	bge $t3, $t2, __adding_final
	j __adding_loop
__adding_final:
	move $v0, $t0

__exit:
	move $a0, $v0 # copy the return code of the last function to a0 
	li $v0, 4001 # exit syscal
	syscall

.section .data

hello:
	.ascii "Hello Mips\n"
buffer: .word 1, 2, 3, 70, 5
buffer_len: .word 5
