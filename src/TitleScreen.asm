Title_Screen:

B_Button_Presses = $9 ; 1 Byte
mov #0, B_Button_Presses

.main_title_loop
	call	Get_Input
	mov #Button_B, acc
	callf Check_Button_Pressed
	bn acc, 5, .Check_A
	inc B_Button_Presses
.Check_A	
	ld p3
	bn acc, T_BTN_A1, .Check_B
	jmpf .Not_B
.Check_B		
	; ld p3
	bp acc, T_BTN_B1, .Not_B
	ret
.Not_B
	ld B_Button_Presses
	sub #23
	bz .draw_old_title_screen
	add #23
	sub #96
	bz .draw_old_title_screen
	P_Draw_Background_Constant Title_Screen_Graphic
	P_Blit_Screen
	jmp .main_title_loop
.draw_old_title_screen
	P_Draw_Background_Constant MPG_TSBG ; Show The Original + Place-Holder Title Screen, As An Easter Egg. :-)
	P_Blit_Screen
	jmp .main_title_loop
	