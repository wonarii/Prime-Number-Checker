; Group Members
; Jimmy Le ID 40316405
; Arielle Wong 40313593
; Joaquin
; Josh


; ### INITIALIZE VARIABLES HERE ###
section .data 
	number db 5                       ; ### TEST NUMBER (CHANGE LATER)
	answer db 1                       ; ### ANSWER (1 for prime, 0 for composite number)
	
	prime_msg db  'Number is prime', 0x0a
        not_prime_msg db 'Number is NOT prime', 0x0a

	;variables for gettting inputs
	ask_number_msg db 'Please enter a number between 0 and 255', 0x0a ; asking user for a number
	minNumber db '0', 0x0a			; 
	maxNumber db '255', 0x0a		;
	error_msg db 'Incorrect input, try again', 0x0a 		; if the input is invalid

	

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
; ### This function should divide a given number by 2 and check if the remainder is 0
; ### Return 1 if it IS divisable by 2
; ### Return 0 if it is NOT divisable by 2
; ### Try to save result* 
divide_by_two: 
	
	






; ### DIVIDE BY ODD ###
; ### This function should divide a given number by 2n + 1 and check if the remainder is 0
; ### n should keep incrementing and 2n + 1 should be less than number/2 (LOOP IN _start)  
; ### Return 1 if it IS divisable by 2n + 1
; ### Return 0 if it is NOT divisable by 2n + 1
divide_by_odd: 







; ### DISPLAY PRIME ### 
; ### This function displays a message when a number is PRIME
display_prime: 







; ### DISPLAY NOT PRIME ###
; ### This function displays a message when a number is NOT prime
display_not_prime: 








; ### MAIN FUNCTION ###
; ### We will use this to call the subroutines and simple code
_start: 
	call get_inputs		;jumps to get inputs








; ### EXIT (DO NOT TOUCH) ###

	mov eax, 1
	mov ebx, 0
	int 80h







