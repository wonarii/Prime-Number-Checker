; Group Members
; Jimmy Le ID 40316405
; Arielle Wong 40313593
; Joaquin
; Josh


; ### INITIALIZE VARIABLES HERE ###
section .data 
	number db 18                       ; ### TEST NUMBER (CHANGE LATER)
	answer db 1                       ; ### ANSWER (1 for prime, 0 for composite number)
	
	prime_msg db  'Number is prime', 0x0a
	prime_msg_len equ $ - prime_msg
	not_prime_msg db 'Number is NOT prime', 0x0a
	not_prime_msg_len equ $ - not_prime_msg
	

	odd_number db 3		  ; ### Used in divide_by_odd
	half_number db 9		  ; ### The number halved

; ### PUT CODE (SUBROUTINES) IN HERE ### 
section .text 
	global _start



; ### GET INPUTS ###
; ### This function will ask the user to input a number and store it in "number"
; ### If the input is invalid, then either ask again or use default number (UP TO YOU)
get_inputs: 










; ### DIVIDE BY 2 ###
; ### This function should shift right once and check if the carry flag is 0
; ### Return 0 if it IS divisable by 2
; ### Return 1 if it is NOT divisable by 2
; ### Try to save result* 
divide_by_two: 
	
	

	




; ### DIVIDE BY ODD ###
; ### This function should divide a given number by 2n + 1 and check if the remainder is 0
; ### n should keep incrementing and 2n + 1 should be less than number/2 (LOOP IN _start)  
; ### Return 0 if it IS divisable by 2n + 1
; ### Return 1 if it is NOT divisable by 2n + 1
divide_by_odd: 
	
	mov ecx, number
	mov ebx, odd_number
	
start_loop: 
		mov eax, 18
		mov ebx, 3
		xor edx, edx
		div ebx
				
		
		test edx, edx
		jz found_divisor
		jnz not_found_divisor

		;add ebx, 1
		;cmp ebx, 
		;jle start_loop

		ret

		
not_found_divisor:

		;mov eax, 1
		call display_prime
		ret
		
	
found_divisor:
		mov byte [answer], 0
		call display_not_prime
		ret 
	
		  
			






; ### DISPLAY PRIME ### 
; ### This function displays a message when a number is PRIME
display_prime: 

	mov eax, 4
	mov ebx, 1
	mov ecx, prime_msg
	mov edx, prime_msg_len
	int 80h
	ret
	
	


; ### DISPLAY NOT PRIME ###
; ### This function displays a message when a number is NOT prime
display_not_prime: 

	mov eax, 4
	mov ebx, 1
	mov ecx, not_prime_msg
	mov edx, not_prime_msg_len
	int 80h
	ret






; ### MAIN FUNCTION ###
; ### We will use this to call the subroutines and simple code
_start: 

	

	call divide_by_odd
	cmp byte [answer], 1
	;je display_prime
	
	






; ### EXIT (DO NOT TOUCH) ###

	mov eax, 1
	mov ebx, 0
	int 80h







