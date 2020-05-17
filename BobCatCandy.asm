.data
str: .asciiz "Welcome to BobCat Candy, home to the famous BobCat Bars!\n"
str2: .asciiz "Please enter the price of a BobCat Bar:\n"
str3: .asciiz "Please enter the number of wrappers needed to exchange for a new bar:\n"
str4:  .asciiz "How, how much money do you have:\n"
str4.5:  .asciiz "Good! Let me run the number ...\n"
str5:  .asciiz "You have "
str6:  .asciiz "You first buy "
str7:  .asciiz " bars \n"
str8:  .asciiz "With $"
str9:  .asciiz ", you will receive a maximum of "
str10:  .asciiz " BobCat Bars!\n"
.text

.globl main
main:
	#read from the user
	li $v0, 4
	la $a0, str
	syscall
	
	#price
	li $v0, 4
	la $a0, str2
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#wrappers
	li $v0, 4
	la $a0, str3
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	#money	
	li $v0, 4
	la $a0, str4
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	li $v0, 4
	la $a0, str4.5
	syscall
	
	#Call the the recusion function
	jal Candy
	
	move $t3, $v1
	add $v1, $zero, 0
	move $t2, $v0
	
	jal Candy2
	move $t4, $v1
	
       li $v0, 4
       la $a0, str8
       syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
       li $v0, 4
       la $a0, str9
       syscall
      
      	li $v0, 1
	move $a0, $t4
	syscall
	
       li $v0, 4
       la $a0, str10
       syscall
	
	#end of function
	j done
	
	
#---------------------------------------------

	
			
	
.globl Candy	
Candy:
      
      move $t3,$t2
      div $t2, $t2, $t0
      
      li $v0, 4
       la $a0, str6
       syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
       li $v0, 4
       la $a0, str7
       syscall
      
      move $v0, $t2
      move $v1, $t3
      jr $ra

#---------------------------------------------	
		

				
												
.globl Candy2
Candy2:
       
       addi $sp, $sp, -8
       sw $ra, 0($sp)
       sw $t2, 4($sp)
       
       
       addi $v0, $zero, 1
       blt $t2, 1, end
       addi $v0, $zero, 1
       beq $t2, 0, end
       
       li $v0, 4
       la $a0, str5
       syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
       li $v0, 4
       la $a0, str7
       syscall
       
       add $v1, $v1, $t2
       div $t2, $t2, $t1
       jal Candy2
       
       
            
  
end:
     lw $ra 0($sp)
     addi $sp, $sp, 8
     jr $ra


done:
