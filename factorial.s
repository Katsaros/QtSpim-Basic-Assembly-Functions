				.text
				.globl main
main:		
				la		$a0, message
				jal		printStr
				
				la 		$s0, num
				lw      $a0, 0($s0)
				jal		printInt
				
				la		$a0, message2
				jal		printStr
				
				lw      $a0, 0($s0)
				move	$t0, $a0
				addi 	$t0, $t0, -1
L1:
				mul		$a0, $a0, $t0	
				addi 	$t0, $t0, -1
				bne		$t0, $zero, L1
				jal		printInt
				
exit:
				li		$v0, 10
				syscall				
				
printStr:
				li		$v0, 4
				syscall
				jr		$ra
printInt:		
				addi	$sp, $sp, -4
				sw		$ra, 0($sp)
				li		$v0, 1
				syscall
				addi	$sp, $sp, -4 	#extra code for the stack
				sw		$ra, 0($sp)  	#to keep the value of ra
				jal		printEndl	   	#for printing new line
				lw		$ra, 0($sp)
				addi	$sp, $sp, 4
				jr		$ra
printEndl:
				li		$v0, 4
				move	$t0, $a0   		#usually a0 contains some value
				la		$a0, endl
				syscall
				move	$a0, $t0   		#restore a0 original value
				jr		$ra
	
				.data
num:			.word	6
message:		.asciiz "Factorial of "
message2:		.asciiz	"is "
endl:			.asciiz "\n"