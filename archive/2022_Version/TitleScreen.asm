;------------------------------------------------------------------------------
; Variables
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------

Title_Screen:

.main_title_loop
	P_Draw_Background_Constant MPG_TSBG ;Title_Screen
	P_Blit_Screen
	call	Get_Input
	mov		#Button_A, acc
	call	Check_Button_Pressed
	bz		.not_B
	;call	Get_Input
	;mov		#Button_B, acc
	;call	Check_Button_Pressed
	;bz		.not_B
	ret
.not_B
	jmp .main_title_loop
	