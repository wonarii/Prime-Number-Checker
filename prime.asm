
; Group Members
; Jimmy Le ID 40316405
; Arielle Wong 40313593
; Joaquin Nahman 40270510
; Josh
;

; ### INITIALIZE VARIABLES HERE ###
section .data 
	 
	number dd 19                       						; ### TEST NUMBER (CHANGE LATER)
	answer dd 1                       						; ### ANSWER (1 for prime, 0 for composite number)
	half_number dd 10		  						; ### The number halved                   UPDATE THIS WHEN CHANGING NUMBER OR IN DIVIDE_BY_2 
		
		
	
	prime_msg db  'Number is prime', 0x0a
	not_prime_msg db 'Number is NOT prime', 0x0a
	ending_msg db 'Thank you for using prime checker!', 0x0a
	

											; ### Variables for getting inputs ###
	ask_number_msg db 'Please enter a number', 0x0a 				; ### Asking user for a number		
	error_msg db 'Incorrect input, try again', 0x0a 				; ### If the input is invalid

	
	odd_number dd 3		 							; ### Used in divide_by_odd


; ### UNINITIALIZED VARIABLES HERE ###
section .bss
	user_input resb 32								; ### USER INPUT 



; ### PUT CODE (SUBROUTINES) IN HERE ### 
section .text 
	global _start

; ### GET INPUTS ###
; ### This function will ask the user to input a number and store it in "number"
; ### If the input is invalid, then either ask again or use default number (UP TO YOU)
get_inputs: 
					;ASK FOR NUMBER
	mov eax, 4			;
	mov ebx, 1			;
	mov ecx, ask_number_msg		;
	mov edx, 22			;length of message
	int 80h				;displays the message

					;COLLECT NUMBER
	mov eax, 3			;
	mov ebx, 1			;
	mov ecx, user_input		;will put collected input into number
	mov edx, 32			;the length of the input should not exceed 3 characters (0-255)
	int 80h				;collect the message
	
		
	call convert_to_number 		;CONVERT STRING TO NUMBER
	cmp ebx, 1			;check if there was an invalid character
	je ASKAGAIN			;
	mov [number], eax 		;
	

	;IF THE NUMBER IS VALID
	ret 
	
ASKAGAIN:
	mov eax, 4			;
	mov ebx, 1			;
	mov ecx, error_msg		;
	mov edx, 27			;length of message
	int 0x80			;displays the message
	jmp get_inputs			;goes back to get_inputs to ask again



; ### CONVERT TO NUMBER ###
; ### This function should loop through each character of a user input (ASCII) and convert it into a number
; ### Return the converted number in eax 
convert_to_number:
	mov esi, user_input
	xor eax, eax
	xor ebx, ebx
	
	
.start_convert:
	movzx edx, byte [esi]				; ### Load the char at esi position into edx
	
	cmp esi, user_input
	je .check_empty					; ### Check if the first character is empty (no input) 

.continue_convert:
	
	inc esi
	
	cmp dl, 0xA					; ### Check to see if we are done reading through the characters
	je .end_of_line
	
	cmp dl, '0'					; ### Check to see if the character is a between 0 and 9
	jb .invalid_input

	cmp dl, '9'
	ja .invalid_input

	sub edx, '0'					; ### Subtract the character from '0' to get a numerical value
	imul eax, 10					; ### Multiply the previous result by 10 to move on to next digit

	add eax, edx					; ### Add the previous result with the current character number
	jmp .start_convert				; ### Loop 
	 


.end_of_line: 						; ### We looped through the entire number without issues, return 0 in ebx
	mov ebx, 0
	ret

.invalid_input: 					; ### An invalid character was found, return 1 in ebx
	mov ebx, 1
	ret

.check_empty:						; ### Check if the first character is empty and jump to .invalid_input, otherwise continue the loop
	cmp dl, 0xA
	je .invalid_input

	jmp .continue_convert	



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
	
		
	
.start_loop: 
		mov eax, [number]			; ### Dividing the number by an odd number (starting with 3)
		mov ebx, [odd_number]
		xor edx, edx
		div ebx
				
		
		test edx, edx				; ### If the remainder is 0, then it is not a prime number
		jz .found_divisor
		

		mov eax, [half_number]
		cmp [odd_number], eax			; ### Check to see if the odd number is less than half of the number 
		jge .not_found_divisor			; ### If no, then there shouldn't be any divisor left
		
		add byte [odd_number], 2		; ### Increment the odd number by 2 and continue the loop
		jmp .start_loop


		
.not_found_divisor:					; ### Return 1 if there were no divisors found

		mov eax, 1
		;call display_prime
		ret
		
	
.found_divisor:						; ### Return 0 if the number was divisable
		mov eax, 0
		;call display_not_prime
		ret 
	
		  
; ### DISPLAY PRIME ### 
; ### This function displays a message when a number is PRIME
display_prime: 
	mov eax, 4 
	mov ebx, 1  
	mov ecx, prime_msg 
	mov edx, 16  
	int 80h 
	ret 
	


; ### DISPLAY NOT PRIME ###
; ### This function displays a message when a number is NOT prime
display_not_prime:
	mov eax, 4 
	mov ebx, 1
	mov ecx, not_prime_msg  
	mov edx, 20 
	int 80h 
	ret 



; ### DISPLAY END MESSAGE ###
; ### This function displays the program ending message
display_ending_msg:
	mov eax, 4
	mov ebx, 1 
	mov ecx, ending_msg 
	mov edx, 35 
	int 80h 
	ret 


; ### MAIN FUNCTION ###
; ### We will use this to call the subroutines and simple code
; ### 0 = NOT prime
; ### 1 = PRIME
_start: 


	call get_inputs			; ### Get user input for the number
	
	mov eax, [number]		; ### Check if the number is 1, 2 or 3
	cmp eax, 1			
	je not_prime_condition
	cmp eax, 2		
	je prime_condition 
	cmp eax, 3
	je prime_condition



	;call divide_by_two		; ### Check if the number is even (NOT prime)	
	;cmp eax 1
	;je prime_condition 

	

	call divide_by_odd		; ### Check if the number is divisable by odd numbers (starting from 3 until half of the number)
	cmp eax, 1 
	je prime_condition
	cmp eax, 0		
	je not_prime_condition
	 
	
prime_condition: 			; ### Actions to take if PRIME
	call display_prime
	jmp exit

not_prime_condition:			; ### Actions to take if NOT prime
	call display_not_prime
	jmp exit


; ### EXIT (DO NOT TOUCH) ###
exit:
	call display_ending_msg

	mov eax, 1
	mov ebx, 0
	int 80h








