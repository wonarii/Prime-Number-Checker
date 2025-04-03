; Group Members
; Jimmy Le ID 40316405
; Arielle Wong ID
; Joaquin
; Josh


; ### INITIALIZE VARIABLES HERE ###
section .data 
	number db 5                       ; ### TEST NUMBER (CHANGE LATER)
	answer db 1                       ; ### ANSWER (1 for prime, 0 for composite number)
	
	prime_msg db  'Number is prime', 0x0a
        not_prime_msg db 'Number is NOT prime', 0x0a


; ### PUT CODE (SUBROUTINES) IN HERE ### 
section .text 
	global _start



; ### GET INPUTS ###
; ### This function will ask the user to input a number and store it in "number"
; ### If the input is invalid, then either ask again or use default number (UP TO YOU)
get_inputs: 










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









; ### EXIT (DO NOT TOUCH) ###

	mov eax, 1
	mov ebx, 0
	int 80h







