; Group Members
; Jimmy Le ID 40316405
; Arielle Wong 40313593
; Joaquin Nahman 40270510
; Josh
;

; ### INITIALIZE VARIABLES HERE ###
section .data 

	number dd 21                       				; ### TEST NUMBER (CHANGE LATER)
	answer dd 1                       				; ### ANSWER (1 for prime, 0 for composite number)
	
	prime_msg db  'Number is prime', 0x0a
	not_prime_msg db 'Number is NOT prime', 0x0a
	ending_msg db 'Thank you for using prime checker!', 0x0a
	

	;variables for gettting inputs
	ask_number_msg db 'Please enter a number between 0 and 255', 0x0a ; asking user for a number
	minNumber db '0', 0x0a			; 
	maxNumber db '255', 0x0a		;
	error_msg db 'Incorrect input, try again', 0x0a 		; if the input is invalid

	
	odd_number dd 3		 					; ### Used in divide_by_odd
	half_number dd 10		  				; ### The number halved                   UPDATE THIS WHEN CHANGING NUMBER OR IN DIVIDE_BY_2 

; ### PUT CODE (SUBROUTINES) IN HERE ### 
section .text 
	global _start



; ### GET INPUTS ###
; ### This function will ask the user to input a number and store it in "number"
; ### If the input is invalid, then either ask again or use default number (UP TO YOU)
get_inputs: 
				;ASK FOR NUMBER
	mov eax, 4		;
	mov ebx, 1		;
	mov ecx,ask_number_msg	;
	mov edx, 39		;length of message
	int 80h		;displays the message

				;COLLECT NUMBER
	mov eax, 3		;
	mov ebx, 1		;
	mov ecx, number		;will put collected input into number
	mov edx, 3		;the length of the input should not exceed 3 characters (0-255)
	int 80h			;collect the message

				;TRANSFORM STRING TO INT
	mov ecx, number
	sub ecx, '0'		;to un-ascii
	mov [number], ecx	;puts un-ascii number in number
	

				;CHECK min
	;mov eax, number		; puts number in eax
	;mov ebx, minNumber	;puts minNumber in ebx
	;cmp eax, ebx		;comparing number with 0
	;jl ASKAGAIN 		; number < 0, jumps back to asking

				;CHECK max
	;mov eax, number		; puts number in eax
	;mov ebx, maxNumber	; puts max number in ebx
	;cmp eax, ebx		;comparing number with 255 
	;jg ASKAGAIN		; number > 255, jumps to ask again

	;IF THE NUMBER IS VALID
	ret	;GOING TO NEXT STEP 
	
ASKAGAIN:
	mov eax, 4		;
	mov ebx, 1		;
	mov ecx,error_msg	;
	mov edx, 26		;length of message
	int 0x80		;displays the message
	jmp get_inputs		;goes back to get_inputs to ask again


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
		mov eax, [number]
		mov ebx, [odd_number]
		xor edx, edx
		div ebx
				
		
		test edx, edx
		jz .found_divisor
		

		mov eax, [half_number]
		cmp [odd_number], eax
		jge .not_found_divisor
		add byte [odd_number], 2

		jmp .start_loop


		
.not_found_divisor:

		mov eax, 1
		;call display_prime
		ret
		
	
.found_divisor:
		mov eax, 0
		;call display_not_prime
		ret 
	
		  
			






; ### DISPLAY PRIME ### 
; ### This function displays a message when a number is PRIME
display_prime: 
mov eax, 4 ;
mov ebx, 1 ; 
mov ecx, prime_msg ;
mov edx, 16 ; 
int 80h ;
ret ;
	


; ### DISPLAY NOT PRIME ###
; ### This function displays a message when a number is NOT prime
display_not_prime:
mov eax, 4 ;
mov ebx, 1 ;
mov ecx, not_prime_msg ; 
mov edx, 20 ;
int 80h ;
ret ;



; ### DISPLAY END MESSAGE ###
; ### This function displays the program ending message
display_ending_msg:
mov eax, 4 ;
mov ebx, 1 ;
mov ecx, ending_msg ;
mov edx, 36 ;
int 80h ;
ret ;


; ### MAIN FUNCTION ###
; ### We will use this to call the subroutines and simple code
_start: 

	;call get_inputs		;jumps to get inputs

	call divide_by_odd		;divides the number by every odd number, updates eax with either 1 or 0,

	; ### WIP
	;cmp eax, 1 ;
	;je prime_t ;
	;call display_not_prime ;
	;jmp end_t ;
	;prime_t:
	;call display_prime ;
	;end_t:
	;call display_ending_msg ;




; ### EXIT (DO NOT TOUCH) ###
exit:
	mov eax, 1
	mov ebx, 0
	int 80h








