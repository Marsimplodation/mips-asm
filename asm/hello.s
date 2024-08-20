.section .text

# all syscall numbers are for the linux kernel
# https://syscalls.w3challs.com/?arch=mips_o32
.global __start
__start:
	li $v0, 4004 # write syscall
	li $a0, 1 # stdout file descriptor
	la $a1, hello 
	li $a2, 15 #string length
	syscall
__exit:
	li $v0, 4001 # exit syscal
	move $a0, $zero
	syscall

.section .data

hello:
	.ascii "Hello World!\n"
