 ;------------------------------------------------------------------------------
; Variables
;------------------------------------------------------------------------------
; driving_bg_address		=		$7		; 2 Byte
driving_anim_counter	=		$9		; 1 Byte
player_car_x			=		$a		; 1 Byte
player_car_y			=		$b		; 1 Byte
player_car_speed		=		$c		; 1 Byte
player_car_spr_addr_b	=		$d		; 2 Bytes
player_car_spr_addr_w	=		$f		; 2 Bytes
frame_flags				=		$11		; 1 Byte
speed_temp				=		$12		; 1 Byte
player_gear				=		$13		; 1 Byte	; Consider using a Collision_Flags Bit For This. Make "Player_Flags"
gear_icon_y				=		$14		; 1 Byte ; Change Back To 47 For Funny.	; Consider Using B? JK, This Can Be Yeeted; P_Draw_HUD Probably Handles It Now, Or Something. ; Rename It To Icy_Flags, or Use It As Part Of Puddle_Flags.

enemy_car_spr_addr_b	=		$15		; 2 bytes
enemy_car_x				=		$17		; 1 byte
enemy_car_y				=		$18		; 1 byte
enemy_car_speed			=		$19		; 1 byte
enemy_car_spr_addr_w	=		$1a		; 2 bytes
enemy_car_flags			=		$1c		; 1 Byte -> 01010101
enemy_speed_temp		=		$1d		; 1 Byte
random_seed				=		$1e		; 1 Byte
accel					=		$1f		; 1 Byte
speed_remainder			=		$20		; 1 Byte
speed_sign				=		$21		; 1 Byte
temp_zeroes				=		$22		; 1 Byte

enemy_car2_spr_addr_b	=		$23		; 2 Bytes
enemy_car2_spr_addr_w	=		$25		; 2 Bytes
enemy_car2_x			=		$27		; 1 Byte
enemy_car2_y			=		$28		; 1 Byte
twocars_enabled			=		$29		; 1 Byte
enemy_car2_speed		=		$2a		; 1 Byte
enemy_car2_speed_temp	=		$2b		; 1 Byte
track_pos_marker		=		$2c		; 1 Byte
score					=		$2d		; 1 Byte
collision_debugging_flags	=	$2e		; 1 Byte
score_tracker			=		$2f ; $157	; 1 Byte		; What Is This? It's Used, But Check.
collision_frame			=		$30		; 1 Byte
road_rightboundary_ypos	=		$31		; 1 Bytes
road_leftboundary_ypos	=		$32		; 1 Bytes
score_ten_thousands_digit =		$33		; 1 Byte
score_thousands_digit	=		$34		; 1 Byte
score_hundreds_digit	=		$35		; 1 Byte
score_tens_digit		=		$36		; 1 Byte
score_ones_digit		=		$37		; 1 Byte
score_low				=		$38		; 1 Byte	; You Actually Gotta Rename "Score" To This.
score_high				=		$39		; 1 Byte
score_low_over_127_bool	=		$3a		; 1 Byte
timer	=	$3b
timer_frame_flags	=	$3c
RoadLeftVarCounter = $6d
RoadLeftVarNum = $3d
RoadRightVarCounter = $3e
RoadRightVarNum	= $3f
puddle_flags	=	$40 ; 0: On/Off (Input.). 1: On/Off (-Screen.). 2: Static/Splash. 3: Left/Right. ; 0913/0914: Consider Using 4 As Center, And The Last Three Of The Four As The Counter. Once It Reaches Four (Or Seven, Even), -- The Puddle Timer Is Done.
puddle_x		=	$41
puddle_y		=	$42
puddle_spr_addr	=	$43
puddle_timer	=	$45
road_leftboundary	=	$46
road_rightboundary	=	$47
swerve_flags		=	$48
swerve_timer		=	$49
Environment_Flags_Old	=	$4a		;	7: Lives Or Timer. 6: 5: 4: 3: 2: Bridge. 1: Icy. 0: Regular Road. Consider Using 3 Of The Flags For The 3 Lives.
Environment_Timer	=	$4b	;		Normal, Icy, Bridge, Normal To Icy, Normal To Bridge, Icy To Normal, Bridge To Normal
Environment_Flags	=	$4c	;		0: Normal.	1: (Transition: Normal To Icy.).	2: (Transition: Normal To Bridge; Prep.).	3: (Transition: Normal To Bridge; Ready.).	 4: Icy. 5: (Transition: Icy To Normal.).	6: Bridge.	7: (Transition: Bridge To Normal.).
Ambulance_X		=	$4d	; ^ Prep: Means That The Enemy Cars Are Moving To Bridge Positions. Ready: Means That They Are In Place.
Ambulance_Y		=	$4e
Ambulance_Sprite_Address	=	$4f ;, $4c
Lives_Flag		=	$51
Ambulance_Timer	=	$52
score_digit_temp =	$53	; Was After Score_High
Puddle_Left_Splash_Sprite_Address	=	$54 ;, $55. 2 Bytes
Puddle_Right_Splash_Sprite_Address	=	$56 ;, $57. 2 Bytes
Cars_In_Place_Bool	=	$58	; 1 Byte					4:	All In Place. 3:	Right Road Boundary. 2:	Left Road Boundary. 1: Car 2. 0: Car 1
Invincibility_Flag	=	$59	; 1 Byte
Invincibility_Timer	=	$60	; 1 Byte
HUD_Banner_Number	=	$61	; 1 Byte
HUD_Banner_Timer			=	$62	; 1 Byte
FTestTimer	=	$63	;	1 Byte
StickFigure_X	=	$64	;	1 Byte
StickFigure_Y	=	$65	;	1 Byte
StickFigure_Sprite_Address	=	$66	;	2 Bytes
StickFigure_Frame	=	$68	; 1 Byte
StickFigure_Bool	=	$69	; 1 Byte
Ambulance_Frame		=	$6a	; 1 Byte
Game_Over_Timer		=	$6b ; 1 Byte
Game_Over_Bool		=	$6c ; 1 Byte
Game_Over_Text_Sprite_Address = $6d	; 2 Bytes
;------------------------------------------------------------------------------

;-----------
; Constants
;-----------
T_BTN_B1				 equ	 5
T_BTN_A1				 equ	 4
T_BTN_RIGHT1             equ     3
T_BTN_LEFT1              equ     2
T_BTN_DOWN1              equ     1
T_BTN_UP1                equ     0
;-----------

Driving_Test:

; Initialize Variables
	mov	#40, player_car_x
	mov	#12, player_car_y
	mov #0, player_car_speed
	mov	#<Player_Car_B_Mask, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Player_Car_B_Mask, acc
	st	trh
	st	player_car_spr_addr_b+1
	mov	#<Player_Car_W_Mask, acc
	st	trl
	st	player_car_spr_addr_w
	mov	#>Player_Car_W_Mask, acc
	st	trh
	st	player_car_spr_addr_w+1
	mov #%00000000, frame_flags
	mov #0, player_car_speed ; #30, player_car_speed ; #0, player_car_speed
	mov #0, speed_temp
	mov	#0, player_gear
	mov	#24, gear_icon_y
	mov	#3, Gear_Icon_Y ; #0, gear_icon_y	; Rename This.

	mov #%00000000, enemy_car_flags
	mov #0, enemy_car_x
	mov #10, enemy_car_y
	mov	#<Player_Car_B_Mask, acc
	st	trl
	st	enemy_car_spr_addr_b
	mov	#>Player_Car_B_Mask, acc
	st	trh
	st	enemy_car_spr_addr_b+1
	mov	#<Player_Car_W_Mask, acc
	st	trl
	st	enemy_car_spr_addr_w
	mov	#>Player_Car_W_Mask, acc
	st	trh
	st	enemy_car_spr_addr_w+1
	mov #30, enemy_car_speed ; #22, #16, #17, #19
	mov #%00000000, speed_sign
	mov #%00000000, temp_zeroes

	mov #0, enemy_car2_x
	mov #10, enemy_car2_y
	mov	#<Player_Car_B_Mask, acc
	st	trl
	st	enemy_car2_spr_addr_b
	mov	#>Player_Car_B_Mask, acc
	st	trh
	st	enemy_car2_spr_addr_b+1
	mov	#<Player_Car_W_Mask, acc
	st	trl
	st	enemy_car2_spr_addr_w
	mov	#>Player_Car_W_Mask, acc
	st	trh
	st	enemy_car2_spr_addr_w+1
	mov	#%00000001, twocars_enabled
	mov #24, enemy_car2_speed

	mov	#0, track_pos_marker
	mov	#0, score
	mov	#0, collision_debugging_flags	;	7,6,5,4,Above,Below,Left,Right
	mov	#0, score_tracker
	mov #0, enemy_speed_temp
	mov	#0, collision_frame
	mov	#0, score_low
	mov	#0, score_high
	mov	#0, score_ten_thousands_digit
	mov	#0, score_thousands_digit
	mov	#0, score_hundreds_digit
	mov	#0, score_tens_digit
	mov	#0, score_ones_digit
	mov	#0, score_low_over_127_bool

	;mov	#<Test_Track_0, acc
	;st	trl
	;st	driving_bg_address ; BG_Frame
	;mov	#>Test_Track_0, acc
	;st	trh
	;st	driving_bg_address+1 ; BG_Frame+1

	clr1 psw,1		; Get random seed from current minute and
	ld $1c			; second system variables
	xor $1d
	set1 psw,1
	st random_seed

	mov	#18, road_rightboundary_ypos
	mov	#144, road_leftboundary_ypos ; mov	#174, road_leftboundary_ypos

	mov	#5, timer
	mov	#0, timer_frame_flags

	mov	#7, RoadLeftVarCounter
	mov	#0, RoadLeftVarNum
	mov	#7, RoadRightVarCounter
	mov	#0, RoadRightVarNum

	mov	#%01000000, puddle_flags
	mov	#20, puddle_x
	mov	#10, puddle_y
	mov	#<Puddle, acc
	st	puddle_spr_addr
	mov	#0, puddle_timer
	mov	#24, road_leftboundary
	mov	#3, road_rightboundary; bountboundary
	mov	#<Puddle_Mask, acc
	st	trl
	st	puddle_spr_addr
	mov	#>Puddle_Mask, acc
	st	trh
	st	puddle_spr_addr+1
	mov	#0, swerve_flags
	mov	#0, swerve_timer
	mov	#30, Environment_Timer
	mov	#9, Environment_Flags
	mov	#126, Ambulance_X
	mov	#12, Ambulance_Y
	mov	#<Ambulance_Mask, acc
	st	trl
	st	Ambulance_Sprite_Address
	mov	#>Ambulance_Mask, acc
	st	trh
	st	Ambulance_Sprite_Address+1
	mov	#0, Lives_Flag ; 1
	mov	#0, Puddle_Timer
	mov	#5, Ambulance_Timer ; #20
	
	mov	#<Puddle_Splash_Left_Mask, acc
	st	trl
	st	Puddle_Left_Splash_Sprite_Address
	mov	#>Puddle_Splash_Left_Mask, acc
	st	trh
	st	Puddle_Left_Splash_Sprite_Address+1	; Consider Animating This. If Not, Move It To "Initialize Variables."
	
	mov	#<Puddle_Splash_Right_Mask, acc
	st	trl
	st	Puddle_Right_Splash_Sprite_Address
	mov	#>Puddle_Splash_Right_Mask, acc
	st	trh
	st	Puddle_Right_Splash_Sprite_Address+1

	mov	#0, HUD_Banner_Number
	mov	#0, HUD_Banner_Timer
	mov	#0, Cars_In_Place_Bool
	mov	#12, FTestTimer
	mov	#28, StickFigure_X
	mov	#18, StickFigure_Y
	mov	#<StickFigure_0_Mask, acc
	st	trl
	st	StickFigure_Sprite_Address
	mov	#>StickFigure_0_Mask, acc
	st	trh
	st	StickFigure_Sprite_Address+1
	mov	#0, StickFigure_Frame
	mov	#0, StickFigure_Bool
	mov	#0, Ambulance_Frame
	mov	#100, Game_Over_Timer
	mov	#0, Game_Over_Bool
	mov	#<Game_Over_Text, acc
	st	trl
	st	Game_Over_Text_Sprite_Address
	mov	#>Game_Over_Text, acc
	st	trh
	st	Game_Over_Text_Sprite_Address+1
;------------------------------------------------------------------------------
; Main Loop
;------------------------------------------------------------------------------
.driving_test_loop
;------------------------------------------------------------------------------
; Handle Input														28 Cycles
;------------------------------------------------------------------------------
	;	clr1	ocr, 5	; This Makes GamePlay/FrameRate Faster (?)
.Get_Player_Input
	ld	Game_Over_Bool
	bz	.Continue_Playing
	jmpf	.Player_Car_Y_Done
.Continue_Playing
	callf	Get_Input	; 16 (Plus Sleep .Calls?).
	mov		#Button_A, acc ; 2
	callf	Check_Button_Pressed ; 2
	bz		.not_a ; 2
	not1	player_gear, 7 ; 1
.not_a
.not_b
	ld		p3 ; 1
	bp		acc, T_BTN_B1, .not_accel ; 2
	bp		player_gear, 7, .high_gear ; 2

;------------------------------------------------------------------------------
; Handle Acceleration/Speed
;------------------------------------------------------------------------------
.low_gear
	bp	collision_debugging_flags, 4, .speednotmax
.low_decelerate
	bn		player_car_speed, 4, .low_accelerate
	ld		player_car_speed
	sub		#16
	bz		.xbound
	dec		player_car_speed
	dec		player_car_speed
	jmp		.xbound
.low_accelerate
	inc		player_car_speed
	inc		player_car_speed
	; dec		player_car_x
	; dec		player_car_x
	jmp		.xbound
.high_gear
.high_decelerate
	bp		player_car_speed, 4, .high_accelerate
	inc		player_car_speed
	jmp		.xbound
.high_accelerate
	inc		player_car_speed
	inc		player_car_speed
	jmp		.xbound
.not_accel
	; ld		player_car_x
	; sub		#40
	; bz		.xbound
	ld		player_car_speed
	bz		.xbound
	dec		player_car_speed
.xbound
	bn	player_car_speed, 5, .speednotmax; 00111111
	mov	#32, player_car_speed
.speednotmax
;------------------------------------------------------------------------------
; Position Player Sprite (Vertical/Speed)
;------------------------------------------------------------------------------
; Set X Position
	ld		player_car_speed
	sub		#32
	bnz		.skip_xset_1
	mov		#3, speed_temp ; 32
	;ret
	jmp		.xset_done
.skip_xset_1
	ld		player_car_speed
	sub		#16
	bnz		.skip_xset_2
	mov		#2, speed_temp ; 16
	jmp		.xset_done
.skip_xset_2
	ld		player_car_speed
	sub		#8
	bnz		.skip_xset_3
	mov		#1, speed_temp ; 8
	jmp		.xset_done
.skip_xset_3
	ld		player_car_speed
	bnz		.xset_done
	mov		#0, speed_temp
.xset_done
	bn	collision_debugging_flags, 4, .skip_collision_xpos
	mov		#0, speed_temp
	mov		#0, player_car_speed
.skip_collision_xpos

ld	speed_temp
sub	#3
bnz	.itaint3
ld	enemy_car_x
sub #55
bnz	.itaint3
;ret
.itaint3

; ld	home_position ; Commented 5/29. ; Commented 6/22
ld	temp_zeroes
add	#40	;Was A Dollar Sign
sub	speed_temp
st player_car_x
;------------------------------------------------------------------------------
; Position Player (Left/Right)
;------------------------------------------------------------------------------
; Ambulance Collision, Find Out Where To Move This To..;

.Handle_Ambulance_Collision
	ld	Ambulance_Timer
	bnz	.Skip_Ambulance_Collision
	ld	Ambulance_X
	sub	#43 ; #32
	bn	acc, 7, .Skip_Ambulance_Collision
	add	#43 ; #32
	sub	#24 ; #16
	bp	acc, 7, .Skip_Ambulance_Collision
.Ambulance_Collision_Top
	ld	Ambulance_Y
	sub	Player_Car_Y
	; -3 And + 7.
	sub	#3
	bp	acc, 7, .Ambulance_Collision_Bottom
	jmpf	.Skip_Ambulance_Collision
.Ambulance_Collision_Bottom
	ld	Ambulance_Y
	sub	Player_Car_Y
	add	#7
	bp	acc, 7, .Skip_Ambulance_Collision
	;add	#6
	;bz	.Ambulance_Hit_Player
	;sub	#1
	;bz	.Ambulance_Hit_Player
	;sub	#1
	;bz	.Ambulance_Hit_Player
	;sub	#1
	;bz	.Ambulance_Hit_Player
	;sub	#1
	;bz	.Ambulance_Hit_Player
	;sub	#1
	;bz	.Ambulance_Hit_Player
	;sub	#1
	;bz	.Ambulance_Hit_Player
	;jmpf	.Skip_Ambulance_Collision
.Ambulance_Hit_Player
	set1	collision_debugging_flags, 4
.Skip_Ambulance_Collision


; If There's A Collision
	bp	collision_debugging_flags, 4, .faku ; .collision_animation
	jmpf	.handle_y_icy ; normal ; icy; normal; icy
.faku
	jmpf	.collision_animation
	mov #%00000000, collision_debugging_flags ; This Should Probably Be Moved...
; If Icy, Or Puddle
.handle_y_icy
	; bn	Environment_Flags, 0, .handle_y_normal
	ld	Environment_Flags
	sub	#5;#1;2
	bz	.handle_y_icy_left
	add	#5
	sub	#1;#4
	bz	.handle_y_icy_left
	ld	Puddle_Timer
	bnz	.handle_y_icy_left
	jmpf	.handle_y_normal
	; bnz	.handle_y_normal	;	Consider Having It For Icy-->To-->Normal, Too.
.handle_y_icy_left
; If Player Presses Left
	ld		p3
	bp		acc, T_BTN_DOWN1, .handle_y_icy_right
	ld	player_car_y
	sub	#24
	bn	acc, 7, .handle_y_icy_right
	clr1	Gear_Icon_Y, 1 ; not1	Gear_Icon_Y, 1 ; How Many Places Did You Use Not1 In?, And How Many Did It Work For.?
	inc	player_car_y
	inc	player_car_y
	inc	player_car_y
	jmpf	.enemy_car_down
.handle_y_icy_right
	ld	p3
	bp	acc, T_BTN_UP1, .handle_y_icy_neutral_left ; Re-Remove The "Neutral" Here For A Freeze When Hitting The Right Boundary.
	ld	player_car_y
	sub	#5
	bp	acc, 7, .handle_y_icy_neutral_left
	set1	Gear_Icon_Y, 1	; Rename This Gear_Icon_Y To Icy_Direction, Consider Using It For Puddle Direction.
	dec	player_car_y
	dec	player_car_y
	dec	player_car_y
	jmpf	.enemy_car_down
.handle_y_icy_neutral_left
	bp	gear_icon_y, 1, .handle_y_icy_neutral_right
	ld	player_car_y
	sub	#24
	bn	acc, 7, .handle_y_icy_neutral_right
	inc	player_car_y
	jmpf	.keep_bouncing
.handle_y_icy_neutral_right
; nop
; mov	#0, acc
	bn	gear_icon_y, 1, .k
	ld	player_car_y
	sub	#5
	bp	acc, 7, .k
	dec	player_car_y
	.k
	jmpf	.swerve_check_up ; .keep_bouncing
.handle_y_normal
; If In Low Gear
; If Player Presses Left
	ld		p3
	bp		acc, T_BTN_DOWN1, .not_left_low
.handle_y_low
	bp	player_gear, 7, .handle_y_high
; If d_sprite_x != 32
	ld		player_car_y
;	add player_car_size_y
	sub	#32
	bz		.not_left_low
	inc		player_car_y
	br		.not_right_low
.not_left_low
	bp	player_gear, 7, .handle_y_high
	; If Player Presses Right
	ld	p3
	bp	acc, T_BTN_UP1, .not_right_low
; If t_sprite_x != 0
;	ld	d_sprite_x
;	add d_sprite_x_size
	bz	.not_right_low
	dec	player_car_y
	; inc	d_sprite_x
.not_right_low
.handle_y_high
	ld		p3
	bp		acc, T_BTN_DOWN1, .not_left_high
bn	player_gear, 7, .not_right_high
; If d_sprite_x != 32
	ld		player_car_y
;	add player_car_size_y
	sub	#32
	bz		.not_left_high
	inc		player_car_y
	inc		player_car_y
	br		.not_right_high
.not_left_high
	bn	player_gear, 7, .not_right_high
	; If Player Presses Right
	ld	p3
	bp	acc, T_BTN_UP1, .not_right_high
; If t_sprite_x != 0
;	ld	d_sprite_x
;	add d_sprite_x_size
	bz	.not_right_high
	dec	player_car_y
	dec	player_car_y
	; inc	d_sprite_x
.not_right_high

; If Bridge_Transition
; If Bridge
	; Same As Normal...

;------------------------------------------------------------------------------	
;	Handle Puddle Hydroplaning
;------------------------------------------------------------------------------
.Puddle_Input ; If (Puddle), Skip Input Check. Read Puddle Direction (Set As A Flag By [Score Is Odd/Even, A.K.A. BP Flag_Var, 0]), And Keep Speed Constant While Moving Player To That Direction. I'm Thinking +3 Spaces.
	;ld	puddle_timer
	;bz	.swerve_check_up
	;dec	puddle_timer








;	bp	puddle_flags, 7, .Do_Puddle ; .Get_Player_Input ; bn	puddle_flags, 0, .Get_Player_Input
;	jmpf .Get_Player_Input
;.Do_Puddle
	; Determine Via MGPR If You're Going To Let The Player Change Directions While Puddle Skidding/Drifting. If Not, Turn OFF The Center Flag, And If It's Off, Don't Check Input. If It's Still On, Check Input. Note!
	; call	Get_Input
;.left_puddle
;	ld		p3
;	bp		acc, T_BTN_DOWN1, .right_puddle
;.right_puddle
	; If (Puddle_Center_Flag), JMP Puddle_Timer

;.Build_Error_3
;	dec	player_car_y
;	dec	player_car_y
;	dec	player_car_y
;.Puddle_Timer
	inc	puddle_flags ; Make Sure The 3 LSBs Are For The Timer.
	;bn	puddle_flags, 2, .Get_Player_Input ; Actually, You're Gonna Wanna SKIP Get_Player_Input, Right?
	;bn	puddle_flags, 1, .Get_Player_Input
	;bn	puddle_flags, 0, .Get_Player_Input
;	mov	#%00000000, puddle_flags
;	mov	#<Puddle_Mask, acc
;	st	trl
;	st	puddle_spr_addr
;	mov	#>Puddle_Mask, acc
;	st	trh
;	st	puddle_spr_addr+1
;	jmpf	.Get_Player_Input ; (?)

;------------------------------------------------------------------------------
; Handle Player Car's Swerve (Off-Road/Out-Of-Bounds)
;------------------------------------------------------------------------------
; Handle Swerving Status. Note: Crash Immediately If At Screen Boundary.

; Swerve_Flags = -- >  0-3: Timer. 4/5: On/Off

; Ok, Hold On...
; If Swerve Flag's ON, Check If It Equals 0-32 Or W/E Flag.
; If Swerve Flag's OFF, Check If It Equals 0.
; The Last Flag Is Just For Appearance/Sprite Choice!

; If (Swerve InvincibilityFlag)
; Skip The Swerve Check, And Decrement The Timer Instead.
; If Player Goes In-Bounds, Swerve_Timer = 0 And We're Back To Normal.



.swerve_check_up
.Temp_Invincibilty
	ld	Invincibility_Flag
	bz	.Do_Swerve_Check
	; bn	swerve_flags, 6, .Do_Swerve_Check ; Clean This Up Later.
	ld	invincibility_timer ; swerve_timer
	bz	.End_Invincibility
	dec	invincibility_timer ; dec	swerve_timer
	;ld	player_car_y
	;sub	road_rightboundary ; `Might Be Able To Do Just One Side, If We Have The Player Always Exit Crash On The Right, As Per The Arcade Version.
	;sub	#3
	;bn	acc, 7, .End_Invincibility
	;ld	player_car_y
	;sub	road_leftboundary
	;add	#3
	;bp	acc, 7, .End_Invincibility
	jmpf	.swerve_check_none
.End_Invincibility
	mov	#0, Invincibility_Flag
	mov	#0, Invincibility_Timer
	mov	#%00000000, swerve_flags
	mov	#0, swerve_timer
	jmpf	.swerve_check_none
.Do_Swerve_Check
	mov	#<Player_Car_SWerve_L_Mask, acc
	st	trl
	st	player_car_spr_addr_w
	mov	#>Player_Car_SWerve_L_Mask, acc
	st	trh
	st	player_car_spr_addr_w+1
	mov	#<Player_Car_SWerve_R_Mask, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Player_Car_SWerve_R_Mask, acc
	st	trh
	st	player_car_spr_addr_b+1
	; bp	swerve_flags, 5, .swerve_check_road; 4, .swerve_check_road
	; ld	player_car_y
	; sub road_rightboundary
	; sub	#2	; Store It As B And Do The Addition/Subtraction To Swerve_Timer.
	; bn	acc, 7, .swerve_check_down
	; set1	enemy_car_flags, 5 ; 3	; Wanna Add (Distance From Boundary) To Timer As The Increment Value.
	; inc	swerve_flags
	ld	road_rightboundary
	sub	player_car_y
	sub #2 ; add	#2
	st	b
	bp	b, 7, .swerve_check_down
	ld	b
	add	swerve_timer
	st	swerve_timer
	set1	swerve_flags, 7
	jmpf	.swerve_check_done; _road ; _done
.swerve_check_down ; up
	ld	player_car_y
	sub	road_leftboundary
	add #7 ; 5 ; 1 ;7 ; add	#7 ; sub	#2
	st	b
	bp	b, 7, .swerve_check_road ; _done ; _road
	ld	b
	add	swerve_timer
	st	swerve_timer
	set1	swerve_flags, 7 ; enemy_car_flags, 5
	jmpf	.swerve_check_done
	; inc	swerve_flags
.swerve_check_road
	clr1	swerve_flags, 7
	mov	#<Player_Car_B_Mask, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Player_Car_B_Mask, acc
	st	trh
	st	player_car_spr_addr_b+1
	mov	#<Player_Car_W_Mask, acc
	st	trl
	st	player_car_spr_addr_w
	mov	#>Player_Car_W_Mask, acc
	st	trh
	st	player_car_spr_addr_w+1
	;ld	.swerve_timer swerve_flags
	;bz	.swerve_reset
	;bp	acc, 7, 
;.swerve_reset
.swerve_check_done
.handle_swerve_timer
	; bp	swerve_timer, 6, .crash_swerve ; swerve_flags, 4, .crash_swerve
	ld	swerve_timer
	bz	.swerve_check_none
	sub	#20
	bn	acc, 7, .crash_swerve
	bp	swerve_timer, 7, .swerve_check_none
	dec	swerve_timer ; swerve_flags
	jmpf	.enemy_car_down
.crash_swerve
	set1	collision_debugging_flags, 4 ; ret
	jmpf	.collision_animation
.swerve_check_none

;This Was In .not_right_high...
	jmpf	.enemy_car_down

;------------------------------------------------------------------------------
; Position Car (Collision Animation)
;------------------------------------------------------------------------------
.collision_animation
	; If Lives, Do The Explosion Animation And Decrement Lives By One.
	ld	Lives_Flag
	bnz	.Do_Explosion ; bz	.Collision_Bounce
	jmpf	.Collision_Bounce
.Do_Explosion
.Draw_Explosion
	inc	collision_frame
.Draw_Explosion_Frame_0
	ld	collision_frame
	bnz	.Draw_Explosion_Frame_1
	mov	#<Explosion_Mask_0, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Explosion_Mask_0, acc
	st	trh
	st	player_car_spr_addr_b+1
	; inc	collision_frame
	jmpf	.Keep_Bouncing
.Draw_Explosion_Frame_1
	ld	collision_frame
	sub	#1
	bnz	.Draw_Explosion_Frame_2
	mov	#<Explosion_Mask_1, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Explosion_Mask_1, acc
	st	trh
	st	player_car_spr_addr_b+1
	mov	#1, StickFigure_Bool
	ld	player_car_x
	st	StickFigure_X
	ld	player_car_y
	st	StickFigure_Y
	;inc	collision_frame
	jmpf	.Keep_Bouncing
.Draw_Explosion_Frame_2
	ld	collision_frame
	sub	#2
	bnz	.Draw_Explosion_Frame_3
	mov	#<Explosion_Mask_2, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Explosion_Mask_2, acc
	st	trh
	st	player_car_spr_addr_b+1
	;inc	collision_frame
	jmpf	.Keep_Bouncing
.Draw_Explosion_Frame_3
	ld	collision_frame
	sub	#3
	bnz	.Draw_Explosion_Frame_4
	mov	#<Explosion_Mask_3, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Explosion_Mask_3, acc
	st	trh
	st	player_car_spr_addr_b+1
	;inc	collision_frame
	jmpf	.Keep_Bouncing
.Draw_Explosion_Frame_4
	ld	collision_frame
	sub	#4
	bnz	.Explosion_Done
	mov	#<Explosion_Mask_4, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Explosion_Mask_4, acc
	st	trh
	st	player_car_spr_addr_b+1
	;inc	collision_frame
	jmpf	.Keep_Bouncing
.Explosion_Done
	ld	collision_frame
	sub	#5
	bz	.Finish_Explosion ; bn	acc, 7, .Finish_Explosion ; bp	acc, 7, .Keep_Bouncing
	jmpf	.Keep_Bouncing
.Finish_Explosion	 ; 
	mov	#0, collision_debugging_flags
	mov	#0, collision_frame
	mov	#3, Player_Car_Y ; X
	mov	#<Player_Car_B_Mask, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Player_Car_B_Mask, acc
	st	trh
	st	player_car_spr_addr_b+1
	mov	#20, swerve_timer ; #0, swerve_timer ; Moved This Reset To End-Invinciblity Section; Now, It's Used To Count Down Said Invincibility To Da Swerve.
	set1	Swerve_Flags, 6
	clr1	Swerve_Flags, 7
	dec	Lives_Flag
	mov	#1, Invincibility_Flag
	mov	#10, Invincibility_Timer
.Draw_3LivesBanner
	ld	Lives_Flag
	sub	#3
	bnz	.Draw_2LivesBanner
	mov	#0, HUD_Banner_Number
	jmpf	.BannerLivesNumber_Chosen
.Draw_2LivesBanner
	add	#1
	; ld	Lives_Flag
	; sub	#2
	bnz	.Draw_1LivesBanner
	mov	#1, HUD_Banner_Number
	jmpf	.BannerLivesNumber_Chosen
.Draw_1LivesBanner
	add	#1
	; ld	Lives_Flag
	; sub	#1
	bnz	.BannerLivesNumber_Chosen
	mov	#2, HUD_Banner_Number
.BannerLivesNumber_Chosen
	mov	#10, HUD_Banner_Timer
	ld	Lives_Flag
	bnz	.SkipGameOver
	mov	#1, Game_Over_Bool
	mov	#20, Game_Over_Timer
	ret
.SkipGameOver
	jmpf	.Keep_Bouncing
.Collision_Bounce
	inc	collision_frame ;
	; inc	collision_frame ;
	; inc	collision_frame ;
	; ld	collision_frame
	; bne	#7, .skip_coll_reset
	bn	collision_frame, 3, .skip_coll_reset ;bp
	ld	collision_frame  ; mov	#0, collision_frame
	sub #8
	st	collision_frame
.skip_coll_reset
	;
.draw_frame_0
	ld	collision_frame
	bnz	.draw_frame_1
	; bp	frame_flags, 5, .draw_frame_1
	mov	#<Player_Car_Collision_0_Mask, acc ;_Mask, acc _Mask, acc
	st	trl
	st	player_car_spr_addr_b
	; st	player_car_spr_addr_b+1
	mov	#>Player_Car_Collision_0_Mask, acc ;_Mask, acc, acc
	st	trh
	st	player_car_spr_addr_b+1
	jmpf	.player_crashing_left ; jmpf	.draw_frame_2
.draw_frame_1
	ld	collision_frame
	sub	#1
	bnz	.draw_frame_2
	; bn	frame_flags, 5, .draw_frame_2
	mov	#<Player_Car_Collision_1_Mask, acc ;_Mask, acc
	st	trl
	st	player_car_spr_addr_b
	; st	player_car_spr_addr_b+1
	mov	#>Player_Car_Collision_1_Mask, acc
	st	trh
	st	player_car_spr_addr_b+1
	jmpf	.player_crashing_left ;jmp	.draw_frame_2
.draw_frame_2
	ld	collision_frame
	sub	#2
	bnz	.draw_frame_3
	mov	#<Player_Car_Collision_2_Mask, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Player_Car_Collision_2_Mask, acc
	st	trh
	st	player_car_spr_addr_b+1
	jmpf	.player_crashing_left
.draw_frame_3
	ld	collision_frame
	sub	#3
	bnz	.draw_frame_4
	mov	#<Player_Car_Collision_3_Mask, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Player_Car_Collision_3_Mask, acc
	st	trh
	st	player_car_spr_addr_b+1
	jmpf	.player_crashing_left
.draw_frame_4
	ld	collision_frame
	sub	#4
	bnz	.draw_frame_5
	mov	#<Player_Car_Collision_4_Mask, acc
	st	player_car_spr_addr_b
	mov	#>Player_Car_Collision_4_Mask, acc
	st	player_car_spr_addr_b+1
	jmpf	.player_crashing_left
.draw_frame_5
	ld	collision_frame
	sub	#5
	bnz	.draw_frame_6
	mov	#<Player_Car_Collision_5_Mask, acc
	st	player_car_spr_addr_b
	mov	#>Player_Car_Collision_5_Mask, acc
	st	player_car_spr_addr_b+1
	jmpf	.player_crashing_left
.draw_frame_6
	ld	collision_frame
	sub	#6
	bnz	.draw_frame_7
	mov	#<Player_Car_Collision_6_Mask, acc
	st	player_car_spr_addr_b
	mov	#>Player_Car_Collision_6_Mask, acc
	st	player_car_spr_addr_b+1
	jmpf	.player_crashing_left
.draw_frame_7
	ld	collision_frame
	sub	#7
	bnz	.player_crashing_left
	mov	#<Player_Car_B_Mask, acc ; #<Player_Car_Collision_7_Mask, acc
	st	player_car_spr_addr_b
	mov	#>Player_Car_B_Mask, acc ; #>Player_Car_Collision_7_Mask, acc
	st	player_car_spr_addr_b+1
	; jmpf	
.player_crashing_left
	bp	collision_debugging_flags, 6, .player_crashing_right
	ld	player_car_y
	add	#9
	bn	acc, 5, .keep_crashing_left
	not1	collision_debugging_flags, 6
	inc	score_tracker
	jmpf	.player_crashing_right
.keep_crashing_left
	inc	player_car_y
	inc	player_car_y
	inc	player_car_y
	jmpf	.enemy_car_down
.player_crashing_right
	bn	collision_debugging_flags, 6, .enemy_car_down
	ld	player_car_y
	sub	#3
	bn	acc, 7, .keep_crashing_right
	not1	collision_debugging_flags, 6
	; inc	collision_bounce_tracker
	inc	score_tracker
	jmp	.check_bouncedone
.keep_crashing_right
	dec	player_car_y
	dec	player_car_y
	dec	player_car_y
.check_bouncedone
	bn	score_tracker, 2, .keep_bouncing
	mov	#0, collision_debugging_flags
	mov	#<Player_Car_B_Mask, acc
	st	trl
	st	player_car_spr_addr_b
	mov	#>Player_Car_B_Mask, acc
	st	trh
	st	player_car_spr_addr_b+1
	mov	#20, swerve_timer ; #0, swerve_timer ; Moved This Reset To End-Invinciblity Section; Now, It's Used To Count Down Said Invincibility To Da Swerve.
	; set1	Swerve_Flags, 6
	clr1	Swerve_Flags, 7
	; Set Invincibility_Flag. ^ Possibly Decrement Swerve_Timer Here When In Swerve Zone; Set It As Zero When On The Road. When It's Zero, Invincibility Is Up. Consider Using The HUD Timer For Swerve_Timer Debugging...
	mov	#1, Invincibility_Flag
	mov	#10, Invincibility_Timer
.keep_bouncing

; Prevent Player's Car From Going Off-Screen. ; These Don't Work.
;.handle_y_offscreen_left
;	ld	player_car_y
;	sub	#3
;	bp	acc, 7, .handle_y_offscreen_right
;	mov	#3, player_car_y
;.handle_y_offscreen_right
;	ld	player_car_y
;	sub	#24
;	bn	acc, 7, .Player_Car_Y_Done
;	mov	#24, player_car_y
.Player_Car_Y_Done

;------------------------------------------------------------------------------
; Position Enemy Cars
;------------------------------------------------------------------------------
; Ambulance Car 1
	; When In Ambulance Transiton Mode:
	; ld	enemy_car_y
	; Is It Greater Than, Or Less Than Ambulance_Y?
	; Assign It To "Left" Or "Right" Accordingly.
	; If It's The Former, Left-Road < Enemy_Car_Y < Ambulance_Y. If It's The Latter, Ambulance_Y < Enemy_Car_Y < Right-Road.

; Move Enemy Car 1
; Lock Y-Position, If On The Bridge.
	ld	Environment_Flags
	sub	#4
	bz	.enemy_car_y_done
	add	#4
	sub	#2
	bz	.Lock_Enemy_Car1_Y_Bridge
	add	#2
	sub	#6
	bz	.Lock_Enemy_Car1_Y_Bridge
	jmpf	.Move_Enemy_Car1_Y
.Lock_Enemy_Car1_Y_Bridge
	mov	#8, enemy_car_y
	jmpf	.enemy_car_y_done
.Move_Enemy_Car1_Y
	bp	enemy_car_flags, 7, .enemy_car_y_done ; 9/29
.enemy_car_down
	bp	enemy_car_flags, 1, .enemy_car_up
	dec	enemy_car_y
	ld	enemy_car_y
	sub	#3
	bnz	.enemy_car_up
	not1	enemy_car_flags, 1
.enemy_car_up
	bn	enemy_car_flags, 1, .enemy_car_y_done
	inc	enemy_car_y
	ld	enemy_car_y
	sub	#22
	bnz	.enemy_car_y_done
	not1	enemy_car_flags, 1
.enemy_car_y_done

	ld	player_car_speed
	; bz	.speedDiffCalcDone
	bz	.playerSpeedIsZero
	sub	enemy_car_speed
	st	speed_sign
	st	c
	bp	speed_sign, 7, .isNegative
.isPositive
	; ld	enemy_car_speed
	; st	b
	mov #4, b
	; ld	player_car_speed
	; ld	speed_sign
	ld	temp_zeroes
	div
	ld	c
	st	enemy_speed_temp
	ld	enemy_car_x
	add	enemy_speed_temp
	st	enemy_car_x
	ld	b
	st	c
	mov	#4, b
	ld	temp_zeroes
	div
	ld	b
	st speed_remainder
	bz	.speedDiffCalcDone
.poscase1
	sub #1
	bnz	.poscase2
	bn	frame_flags, 0, .poscase2
	bp	frame_flags, 1, .poscase2
	inc	enemy_car_x
	jmpf	.speedDiffCalcDone
.poscase2
	ld	speed_remainder
	sub	#2
	bnz	.poscase3
	bp	frame_flags, 0, .poscase3 ; This Works, Since It's Every Other Frame
	;bn	frame_flags, 1, .poscase3
	inc	enemy_car_x
	jmpf	.speedDiffCalcDone
.poscase3
	;sub #2
	;bnz	.speedDiffCalcDone
	;inc	enemy_car_x
	ld	speed_remainder
	sub	#3
	bnz	.speedDiffCalcDone
	;bp	frame_flags, 0, .speedDiffCalcDone
	;bp	frame_flags, 1, .speedDiffCalcDone
	inc	enemy_car_x
	jmpf	.speedDiffCalcDone

.isNegative
	; ld	player_car_speed
	; st	b
	; ld	enemy_car_speed
	; st	c
	ld	enemy_car_speed
	sub	player_car_speed
	st	c
	mov #4, b
	ld	temp_zeroes
	div
	ld	c
	st	enemy_speed_temp
	ld	enemy_car_x
	sub	enemy_speed_temp
	st	enemy_car_x
	ld	b
	st speed_remainder
	; mov #24, enemy_car_x
.playerSpeedIsZero
	ld	player_car_speed
	bnz	.speedDiffCalcDone
	ld	enemy_car_speed
	st	c
	mov	#4, b
	ld	temp_zeroes
	div
	ld	c
	st	enemy_speed_temp
	ld	enemy_car_x
	sub	enemy_speed_temp
	st	enemy_car_x
.speedDiffCalcDone







; Move Enemy Car 2
; ld twocars_enabled
; bz .skip_car2

; Ambulance:
; Get Ambulance Y-Value
; Have Cars 1 And 3 To Its Left, Car 2 To Its Right
; Then, Once That's All Set, Move The Ambulance Itself.
; mov	#8, Ambulance_Speed (Or W/E We Want The Ambulance's Speed To Be.).
; sub	player_speed(_temp?).
; st	speed_temp
; ld	ambulance_x
; sub	speed_temp
; st	Ambulance_X

ld	Environment_Flags
bnz	.Ambulance_Timer_Done
ld	Environment_Timer
sub	#10
bp	acc, 7, .Ambulance_Timer_Done
ld	Ambulance_Timer
bz	.Ambulance_Timer_Done
dec	Ambulance_Timer
.Ambulance_Timer_Done

; Handle Ambulance Movement
.Ambulance_Movement
	ld	Ambulance_Timer
	bnz	.Ambulance_Movement_Done
	; When It's 0, Set The Ambulance At #120 Or Something, And Get The Two Enemy Cars Into Place.
	; Possibly: If Environment_Timer > 20 And Ambulance Timer = 0, Do This. Or Something Similar. Alternatively, Only Decrement Ambulance_Timer If Environment_Flags Is 0 And Environment_Timer > 20.
	mov	#40, acc
	sub	player_car_speed
	st	c
	mov #4, b
	ld	temp_zeroes
	div
	ld	c
	st	enemy_speed_temp
	ld	Ambulance_X
	sub	enemy_speed_temp
	st	Ambulance_X
	sub	#70
	bn	acc, 7, .Skip_Ambulance_Banner
	add	#70
	sub	#10
	bp	acc, 7, .Skip_Ambulance_Banner
	mov	#10, HUD_Banner_Timer
	 mov	#5, HUD_Banner_Number ; callf	Draw_Ambulance_Banner_Animation ; P_Draw_Ambulance_Banner	HUD_Banner_Timer ; mov	#5, HUD_Banner_Number
.Skip_Ambulance_Banner	;ld	b
	;st speed_remainder
	bn	Ambulance_X, 7, .Ambulance_Movement_Done
	mov	#127, Ambulance_X
	mov	#20, Ambulance_Timer
	mov	#6, acc
	add	score_tens_digit
	st	Ambulance_Y
.Ambulance_Movement_Done
.playerSpeedIsZero3
;	ld	player_car_speed
;	bnz	.speedDiffCalcDone2
;	ld	enemy_car2_speed
;	st	c
;	mov	#4, b
;	ld	temp_zeroes
;	div
;	ld	c
;	st	enemy_speed_temp
;	ld	enemy_car2_x
;	sub	enemy_speed_temp
;	st	enemy_car2_x
;.speedDiffCalcDone2
;.skip_car2


; If 48 > Ambulance_X > 30, Calculate Collision.
; When Ambulance Gets Off-Screen, Move It Back To #120, Reassign The X=Position, And Restart Ambulance_Timer.

.Ambulance_Done

; Lock Y-Position, If On The Bridge.
	ld	Environment_Flags
	sub	#4
	bz	.enemy_car2_y_done
	add	#4
	sub	#2
	bz	.Lock_Enemy_Car2_Y_Bridge
	add	#2
	sub	#6
	bz	.Lock_Enemy_Car2_Y_Bridge
	jmpf	.Move_Enemy_Car2_Y
	;sub	#2
	;bnz	.Move_Enemy_Car2_Y
.Lock_Enemy_Car2_Y_Bridge
	mov	#16, enemy_car2_y
	jmpf	.enemy_car2_y_done
.Move_Enemy_Car2_Y

bp	enemy_car_flags, 7, .enemy_car2_y_done ; 9/29
	ld	Environment_Flags
	sub	#4
	bz	.enemy_car2_y_done
.enemy_car2_up
	bp	enemy_car_flags, 3, .enemy_car2_down
	dec	enemy_car2_y
	dec	enemy_car2_y
	ld	enemy_car2_y
	;sub	#2
	;bnz	.enemy_car2_up
	;not1	enemy_car_flags, 3
	sub road_rightboundary ;_ypos
	sub	#2
	bn	acc, 7, .enemy_car2_y_done
	not1	enemy_car_flags, 3
	jmpf	.enemy_car2_y_done
.enemy_car2_down ; up
	bn	enemy_car_flags, 3, .enemy_car2_y_done
	inc	enemy_car2_y
	inc	enemy_car2_y
	ld	road_leftboundary ;_ypos
	sub enemy_car2_y
	sub	#7 ; sub	#2
	; sub	#22
	bn	acc, 7, .enemy_car2_y_done
	; bnz	.enemy_car2_y_done
	not1	enemy_car_flags, 3
.enemy_car2_y_done

	ld	player_car_speed
	; bz	.speedDiffCalcDone2
	bz	.playerSpeedIsZero2
	sub	enemy_car2_speed
	st	speed_sign
	st	c
	bp	speed_sign, 7, .isNegative2
.isPositive2
	; ld	enemy_car2_speed
	; st	b
	mov #4, b
	; ld	player_car_speed
	; ld	speed_sign
	ld	temp_zeroes
	div
	ld	c
	st	enemy_speed_temp
	ld	enemy_car2_x
	add	enemy_speed_temp
	st	enemy_car2_x
	ld	b
	st	c
	mov	#4, b
	ld	temp_zeroes
	div
	ld	b
	st speed_remainder
	bz	.speedDiffCalcDone2
.poscase1_2
	sub #1
	bnz	.poscase2_2
	bn	frame_flags, 0, .poscase2_2
	bp	frame_flags, 1, .poscase2_2
	inc	enemy_car2_x
	jmpf	.speedDiffCalcDone2
.poscase2_2
	ld	speed_remainder
	sub	#2
	bnz	.poscase3_2
	bp	frame_flags, 0, .poscase3_2 ; This Works, Since It's Every Other Frame
	;bn	frame_flags, 1, .poscase3_2
	inc	enemy_car2_x
	jmpf	.speedDiffCalcDone2
.poscase3_2
	;sub #2
	;bnz	.speedDiffCalcDone2
	;inc	enemy_car2_x
	ld	speed_remainder
	sub	#3
	bnz	.speedDiffCalcDone2
	;bp	frame_flags, 0, .speedDiffCalcDone2
	;bp	frame_flags, 1, .speedDiffCalcDone2
	inc	enemy_car2_x
	jmpf	.speedDiffCalcDone2

.isNegative2
	; ld	player_car_speed
	; st	b
	; ld	enemy_car2_speed
	; st	c
	ld	enemy_car2_speed
	sub	player_car_speed
	st	c
	mov #4, b
	ld	temp_zeroes
	div
	ld	c
	st	enemy_speed_temp
	ld	enemy_car2_x
	sub	enemy_speed_temp
	st	enemy_car2_x
	ld	b
	st speed_remainder
	; mov #24, enemy_car2_x
.playerSpeedIsZero2
	ld	player_car_speed
	bnz	.speedDiffCalcDone2
	ld	enemy_car2_speed
	st	c
	mov	#4, b
	ld	temp_zeroes
	div
	ld	c
	st	enemy_speed_temp
	ld	enemy_car2_x
	sub	enemy_speed_temp
	st	enemy_car2_x
.speedDiffCalcDone2
.skip_car2




bp	enemy_car2_x, 7, .enemy_car2_x_done
	bn	enemy_car2_x, 6, .enemy_car2_x_done	
	; bnz	.enemy_car2_x_done
	ld	player_car_speed
	bz	.player_stopped_car2
	mov	#0, enemy_car2_x
	Change_Enemy_Car2_Speed
	jmp	.enemy_car2_x_done
.player_stopped_car2
	mov #54, enemy_car2_x
.enemy_car2_x_done

	; If Enemy_Car_X Is Between 64 And 127, Reset It.
	bp	enemy_car_x, 7, .enemy_car_x_done
	bn	enemy_car_x, 6, .enemy_car_x_done	
	; bnz	.enemy_car_x_done
	ld	player_car_speed
	bz	.player_stopped
	mov	#0, enemy_car_x
	Change_Enemy_Car1_Speed
	jmp	.enemy_car_x_done
.player_stopped
	mov #54, enemy_car_x
	; Change_Enemy_Car1_Speed ; Set A Flag For This Instead. Bool Change_Enemy_Speed = True; Int Enemy_Car_To_Change = 1. In The Main Loop, If The Bool Is True, Do Change_Enemy_Car_Speed.
.enemy_car_x_done

;------------------------------------------------------------------------------
; Handle Collision
;------------------------------------------------------------------------------
; Collision
.handle_collision_1 ; Y

	bp	collision_debugging_flags, 4, .handle_collision_2 ; .Skip_Collision_Because_Crashing
	mov #%00000000, collision_debugging_flags ; Moved This To The Position_Player Part...
.check_first_car_collision
	ld	enemy_car_x	; If It Ain't In The X-Range 36-41...
	sub	#36
	bp	acc, 7, .check_second_car_collision
	sub #5
	bn	acc, 7, .check_second_car_collision
	ld	enemy_car_x
	st	b
	ld	enemy_car_y
	st	c
	callf _Check_Enemy_Car_Collision ; (Added CALLF And The Underscore And Uncommented The Next Five Lines, 8/7.).
.check_second_car_collision
	ld	enemy_car2_x
	sub	#36
	bp	acc, 7, .handle_collision_2
	sub	#5
	bn	acc, 7, .handle_collision_2
	ld	enemy_car2_x
	st	b
	ld	enemy_car2_y
	st	c
	callf _Check_Enemy_Car_Collision

.handle_collision_2	; Commented For HUD Debugging.....
;	ld	player_car_x
;	sub	enemy_car2_x
;	bnz	.done_colliding
;	ld	player_car_y
;	sub	enemy_car2_y
;	bnz	.done_colliding
;	mov	#0, speed_temp
;.done_colliding

;------------------------------------------------------------------------------
; Handle Score
;------------------------------------------------------------------------------
ld	score	; Commenting Just For Collision Debugging.
add	speed_temp
st	score

; Handle The 16-Bit Bool
	ld	score_low_over_127_bool
	bnz	.over_127
.under_127
	bn	score, 7, .dont_set_overflow
	mov	#1, score_low_over_127_bool
	jmpf .dont_set_overflow
.over_127
	bp	score, 7, .dont_set_overflow
	inc	score_high
	mov	#0, score_low_over_127_bool
.dont_set_overflow

;sub	#255
;bnz	.KeepGoing
;bn	score, 7, .KeepGoing
;inc	score_tracker
;ld	score_tracker
;sub	#5
;bnz	.KeepGoing
jmp	.KeepGoing
be	#250,   .dodaret
be	#251,   .dodaret
;be	#252,   .dodaret
;be	#253,   .dodaret
be	#254,   .dodaret
be	#255,   .dodaret
jmp	.KeepGoing
.dodaret
;ret
.KeepGoing


; Next Step: Load Digits 0-3 Into Memory, Draw 1 Of The 4 Depending On What Speed_Remainder Is.
	ld player_car_speed ; , 
	bz	.skip_road_movement
.Move_Road_Boundaries
	callf	Move_Left_Road_Boundary
	callf	Move_Right_Road_Boundary
.skip_road_movement

;------------------------------------------------------------------------------
; Draw Track
;------------------------------------------------------------------------------
	P_Clear_Screen
	ld	track_pos_marker
	add	speed_temp
	st	track_pos_marker
; If Bit 3 Is Set, Subtract 8. ; + 10-06: But, Only If Not In The Transition State.
	ld	Environment_Flags
	sub	#3 ; #2
	bn	acc, 7, .skip_subtract_track ; bz	.skip_subtract_track
	bn	track_pos_marker, 3, .skip_subtract_track
	;sub	#8, track_pos_marker
	ld	track_pos_marker
	sub	#8
	st	track_pos_marker
.skip_subtract_track
.Draw_Starting_Line_Blocks
	ld	Environment_Flags
	sub	#9 ; Or Some Number, Which You'll Assign Tomorrow.
	bnz	.Draw_Road_Normal
	mov	#80, Ambulance_X
	mov	#80, Puddle_X
	mov	#80, Enemy_Car_X
	mov	#80, Enemy_Car2_X
	; Make Sure To Skip Enemy_Car Movement Here, And Just Assign Them To Be Offscreen. Also, Consider Just Checking If Player X Is Off The Road, And Moving The Player To The Bound If So, Rather Than Editing The Controls. Disable The Swerve_Timer Here, Too.
	P_Draw_Starting_Line_Transition	track_pos_marker
	ld	track_pos_marker
	add	speed_temp
	st	track_pos_marker
	sub	#96 ;	#48 ;	sub	#144
	bn	acc, 7, .Build_Error_4 ; bp	acc, 7, .BGDraw_Done
	jmpf	.BGDraw_Done
.Build_Error_4
	; You'll Need To Do Something Like Score-High And Score_Low For This, Because The Number Is So High.
	;	bnz/bp acc Yep Yep --> .EndTransition_StartingLine
.EndTransition_StartingLine
	ld	track_pos_marker
	sub	#96 ; #48 ; #144
	st	track_pos_marker
	mov	#0, Environment_Flags
.Draw_Road_Normal
	ld	Environment_Flags
	bnz	.Draw_Road_Icy
	P_Draw_Road road_rightboundary_ypos, road_leftboundary_ypos, track_pos_marker, AllBlack
	jmpf	.BGDraw_Done
.Draw_Road_Icy
	ld	Environment_Flags ; Might Be Able To Skip This, If We JMPF Properly At THe End Of The Prior. ; But Not If You're JMPFing Here From A Level Transition. Maybe Load Environment_Flags Before JMPFing?
	sub	#1
	bnz	.Draw_Road_Bridge ; .Draw_Road_Transition
	P_Draw_Road_Icy	road_rightboundary_ypos, road_leftboundary_ypos, track_pos_marker, AllBlack
	; P_Draw_Road road_leftboundary_ypos, 108, track_pos_marker, AllBlack
	jmpf	.BGDraw_Done
.Draw_Road_Bridge
	sub	#1
	bnz	.Draw_Road_Transition_Normal_To_Icy
	P_Draw_Road_Bridge	track_pos_marker
	;mov	#8, enemy_car_y
	;mov	#16, enemy_car2_y
	jmpf	.BGDraw_Done
;.Draw_Road_Transition
;	ld	Environment_Flags
;	sub	#2 ;#1
;	bz	.Build_Error_A ;bnz .BGDraw_Done
;	; jmpf	.BGDraw_Done
;	jmpf	.BGDraw_Done ; Bridge
;.Build_Error_A
;	ld	track_pos_marker
;	add	speed_temp
;	st	track_pos_marker
;	ld	track_pos_marker
;	sub	#48
;	bp	acc, 7, .Skip_Transition_End_Flag
;	mov	#0, Environment_Flags
;	mov	#0, track_pos_marker
.Draw_Road_Transition_Normal_To_Icy
	sub	#1
	bz	.Build_Error_1 ; bnz	.Draw_Road_Transition_Normal_To_Bridge
	jmpf	.Draw_Road_Transition_Normal_To_Bridge
.Build_Error_1
	ld	track_pos_marker
	sub	#48;$48
	bn	acc, 7, .End_Transition_Normal_To_Icy
	P_Draw_Road_Transition_Normal_To_Icy track_pos_marker
	jmpf	.BGDraw_Done
.End_Transition_Normal_To_Icy
	;ld	track_pos_marker
	;sub	$48
	st	track_pos_marker
	mov	#30, Environment_Timer
	mov	#1, Environment_Flags
	jmpf	.Draw_Road_Icy ; .BGDraw_Done
.Draw_Road_Transition_Normal_To_Bridge
	sub	#1
	bz	.Build_Error_2
	jmpf	.Draw_Road_Transition_Icy_To_Normal ; bnz	.Draw_Road_Transition_Icy_To_Normal
.Build_Error_2
;==================================================================================================== Fuck This!!!!
	;mov	#8, b
	;mov	#16, c
	;callf Get_Enemy_Cars_In_Place ;	b, c
	
	; bp	Cars_In_Place_Bool, 4, .Move_Enemy_Car3_Bridge ?? ; .Cars_And_Road_In_Place_Done
	;mov	#6, b
	;mov	#18, c
	;callf	Get_Road_Boundaries_In_Place

	ld	track_pos_marker
	add	speed_temp
	st	track_pos_marker

	;dec	FTestTimer

	;ld	Cars_In_Place_Bool
	;bnz	.Move_Enemy_Car3_Bridge
	;ld	FTestTimer ; Fuck this ;;;;bn	Cars_In_Place_Bool, 4, .ChangeDis ; bp	Cars_In_Place_Bool, 4, .Move_Enemy_Car3_Bridge ; Rename To Finish_IntoBridge_Transition.
	;bnz	.ChangeDis
	;bn	Cars_In_Place_Bool, 0, .ChangeDis
	;bn	Cars_In_Place_Bool, 1, .ChangeDis
	jmpf	.Move_Enemy_Car3_Bridge
.ChangeDis
	bn	track_pos_marker, 3, .skip_subtract_track_bridge_transition
	;sub	#8, track_pos_marker
	ld	track_pos_marker
	sub	#8
	st	track_pos_marker
.skip_subtract_track_bridge_transition
	P_Draw_Road road_rightboundary_ypos, road_leftboundary_ypos, track_pos_marker, AllBlack
	jmpf	.BGDraw_Done
.Move_Enemy_Car3_Bridge
; Handle Bridge BackGround

	ld	track_pos_marker
	sub	#48
	bn	acc, 7, .End_Transition_Normal_To_Bridge
	P_Draw_Road_Transition_Test track_pos_marker
	jmpf	.BGDraw_Done
.End_Transition_Normal_To_Bridge
	st	track_pos_marker
	mov	#30, Environment_Timer
	mov	#2, Environment_Flags
	mov	#0, Cars_In_Place_Bool
	jmpf	.BGDraw_Done
.Draw_Road_Transition_Icy_To_Normal
	sub	#1
	bnz	.Draw_Road_Transition_Bridge_To_Normal
	ld	track_pos_marker
	sub	#48
	bn	acc, 7, .End_Transition_Icy_To_Normal
	P_Draw_Road_Transition_Icy_To_Normal track_pos_marker ; P_Draw_Road_Transition_Test track_pos_marker
	jmpf	.BGDraw_Done
.End_Transition_Icy_To_Normal
	st	track_pos_marker
	mov	#50, Environment_Timer
	mov	#0, Environment_Flags
	mov	#0, Puddle_Timer	; Might Need To Add More Of These.
	jmpf	.Draw_Road_Normal ; .BGDraw_Done
.Draw_Road_Transition_Bridge_To_Normal
	sub	#1
	bnz	.BGDraw_Done
	ld	track_pos_marker
	sub	#48
	bn	acc, 7, .End_Transition_Bridge_To_Normal
	P_Draw_Road_Transition_Test track_pos_marker
	jmpf	.BGDraw_Done
.End_Transition_Bridge_To_Normal
	st	track_pos_marker
	mov	#40, Environment_Timer
	mov	#0, Environment_Flags
	jmpf	.BGDraw_Done
.Skip_Transition_End_Flag
	P_Draw_Road_Transition_Test track_pos_marker ; Make A New Variable Here, If NEeded.
	;;jmpf	.BGDraw_Done
; - Draw+Handle Road (Bridge)
	;;ld	speed_temp
	;;st	track_pos_marker
.Cycle_Bridge
	rorc ; Da Background
	dec	track_pos_marker
	ld	track_pos_marker
	bnz	.Cycle_Bridge
	; Draw White Chunks For The "Road" Part

	; Collision --> Skip Swerve, Immediately "Splash"
	; You Currently Have 8 And 16 As The Bounds. Consider 10 And 21, If TestBG_Bridgey Looks Good In Gameplay. 

; Transitions:
	; mov	#0, transition_number
	; Add Speed Temp To This Every Frame ^
	; Draw_BG_Bridge_To_Normal transition_number
	; If Transition_Number > 48, Transition Is Done. Make Sure To Have The Road Boundaries At 8 And 24, Or W/E Numbers Are The Defaults.
	jmpf	.SkipWIPBridgeTransition
	; If	(Normal To Bridge Transition Flag)
	ld	road_leftboundary ; _ypos
	sub	#16
	bnz	.Move_Road_LeftBoundary_Bridge
	; Set Flag That It's Ready, Then JMPF To Right; Let The Code Know It's Ready For Full Bridge If Both Are Ready.
.Move_Road_LeftBoundary_Bridge
.Move_Road_LeftBoundary_Bridge_Left
	bn	acc, 7, .Move_Road_LeftBoundary_Bridge_Right
	dec	road_leftboundary
.Move_Road_LeftBoundary_Bridge_Right
	; Might Need To Calculate Again.
	bp	acc, 7, .Move_Road_RightBoundary		; God Bless The 31-Year Old Victim And His Dog, Who Is In Heaven! God Bless Bella, Who Is Missing, And Her Owner!
	inc	road_leftboundary
.Move_Road_RightBoundary
.SkipWIPBridgeTransition	

.BGDraw_Done

;------------------------------------------------------------------------------
; Draw Player Car
;------------------------------------------------------------------------------
	; P_Draw_Player_Car_Grayscale player_car_x, player_car_y
	; bp	collision_debugging_flags, 4, .done_drawing_player_car
	bn	collision_debugging_flags, 4, .drawing_player_car
	; P_Draw_Sprite	player_car_spr_addr_b, player_car_x, player_car_y
	P_Draw_Sprite_Mask	player_car_spr_addr_b, player_car_x, player_car_y
	jmpf	.done_drawing_player_car
.drawing_player_car
	bn frame_flags, 5, .draw_white_player_car
	.draw_black_player_car
	P_Draw_Sprite_Mask player_car_spr_addr_b, player_car_x, player_car_y
	.draw_white_player_car
	bp frame_flags, 5, .done_drawing_player_car
	bp	Invincibility_Flag, 0, .done_drawing_player_car ;	bn	swerve_flags, 6, .done_drawing_player_car
	P_Draw_Sprite_Mask player_car_spr_addr_w, player_car_x, player_car_y
.done_drawing_player_car
.Draw_Driver
	ld	StickFigure_Bool
	bz	.Skip_Drawing_Driver
	ld	StickFigure_Y
	sub	#32
	bp	acc, 7, .KeepDrawing_StickFigure
	mov	#0, StickFigure_Bool
	jmpf	.Skip_Drawing_Driver
.KeepDrawing_StickFigure
	inc	StickFigure_Y
	; inc	StickFigure_Y
	; inc	StickFigure_Y
	inc	StickFigure_Frame
	bn	StickFigure_Frame, 2, .Skip_StickFigure_FrameRollover
	mov	#0, StickFigure_Frame
.Skip_StickFigure_FrameRollover
	P_Draw_Sprite_Mask	StickFigure_Sprite_Address, StickFigure_X, StickFigure_Y
.Skip_Drawing_Driver
;------------------------------------------------------------------------------
; Draw Enemy Cars
;------------------------------------------------------------------------------
	ld	enemy_car_x
	; sub	#48
	st	enemy_speed_temp
	; bp	enemy_speed_temp, 5, .done_drawing_enemy_car
	bp	enemy_speed_temp, 7, .done_drawing_enemy_car
	bp	enemy_speed_temp, 6, .done_drawing_enemy_car
	; bp	enemy_speed_temp, 5, .over_thirtytwo
	bn	enemy_speed_temp, 5, .under_thirtytwo
.over_thirtytwo
	bp	enemy_speed_temp, 4, .done_drawing_enemy_car
	jmp .draw_enemy_car
.under_thirtytwo
	
.draw_enemy_car
;.OnBridgeOrNo
;	ld	Environment_Flags
;	sub	#2
;	bnz	.NotOnBridge
;	mov	#8, enemy_car_y
;	mov	#16, enemy_car2_y
;.NotOnBridge
	bn frame_flags, 5, .draw_white_enemy_car
	.draw_black_enemy_car
	P_Draw_Sprite_Mask enemy_car_spr_addr_b, enemy_car_x, enemy_car_y
	.draw_white_enemy_car
	bp frame_flags, 5, .done_drawing_enemy_car
	; P_Fill_Screen player_car_speed
	P_Draw_Sprite_Mask enemy_car_spr_addr_w, enemy_car_x, enemy_car_y
.done_drawing_enemy_car

.draw_second_car
	bn	twocars_enabled, 0, .dontdraw_second_car
	;ld	enemy_car_x
	;add	#15
	;st	enemy_car2_x
	;ld	enemy_car_y
	;sub	#3
	;st	enemy_car2_y
	;P_Draw_Sprite_Mask enemy_car2_spr_addr_b, enemy_car2_x, enemy_car2_y

	ld	enemy_car2_x
	; sub	#48
	st	enemy_speed_temp
	; bp	enemy_speed_temp, 5, .dontdraw_second_car
	bp	enemy_speed_temp, 7, .dontdraw_second_car
	bp	enemy_speed_temp, 6, .dontdraw_second_car
	; bp	enemy_speed_temp, 5, .over_thirtytwo_car2
	bn	enemy_speed_temp, 5, .under_thirtytwo_car2
.over_thirtytwo_car2
	bp	enemy_speed_temp, 4, .dontdraw_second_car
	; jmp .draw_enemy_car
.under_thirtytwo_car2
	

; Absolutely Baffled As To Why This Breaks It:
;bn	frame_flags, 5, .abcde
;mov	#0, enemy_car2_y
;bn	collision_debugging_flags, 0, .abcd
;mov	#8, enemy_car2_y
; bn	collision_debugging_flags, 1, .abcde
;mov	#24, enemy_car2_y
;.abcd
; bn	collision_debugging_flags, 1, .abcde
;mov	#32, enemy_car2_y
;.abcde


	bn frame_flags, 5, .draw_white_enemy_car2
.draw_black_enemy_car2
	P_Draw_Sprite_Mask enemy_car2_spr_addr_b, enemy_car2_x, enemy_car2_y
.draw_white_enemy_car2
	bp frame_flags, 5, .dontdraw_second_car
	P_Draw_Sprite_Mask enemy_car2_spr_addr_w, enemy_car2_x, enemy_car2_y
.dontdraw_second_car

.Draw_Ambulance
	bp	Ambulance_X, 7, .Skip_Ambulance_Draw
	bp	Ambulance_X, 6, .Skip_Ambulance_Draw
	ld	Ambulance_X
	sub #34
	bn	acc, 7, .Skip_Ambulance_Draw
	P_Draw_Sprite_Mask	Ambulance_Sprite_Address, Ambulance_X, Ambulance_Y
.Skip_Ambulance_Draw
	;mov	#24,	b
	;mov	#8,	c
	;P_Draw_Sprite_Mask	Ambulance_Sprite_Address, b, c ; Testing Collision With This. With Ambulance At Y-Value Of 8, Collision Should Happen At Y-Values Of 5 And 15, But Not 4 And 16. At X-Value Of 28, 42 Is A Collision But 43 Shouldn't Be. At X-Value Of 45, 40 Isn't A Collison But 41 Would Be. So, 14 Ahead To 4 Behind.

.Draw_Puddle
	ld	puddle_timer
	bz	.Skip_Puddle_Timer_Decrement
	dec	puddle_timer
.Skip_Puddle_Timer_Decrement
	dec	puddle_timer
	bn	puddle_timer, 7, .Skip_Puddle_Timer_Underflow
	mov	#0, Puddle_Timer
.Skip_Puddle_Timer_Underflow
	clr1	Puddle_Flags, 5
;	Puddle_Flags: On/Off (Controls), Icy L/R, Puddle L/R, 4 For The Timer
; On-Screen For: 8-48 (Adjust As Necessary.).
	ld	puddle_x
	add	speed_temp
	st	puddle_x
	ld	puddle_x
	sub	#48
	bn	acc, 7, .Skip_Drawing_Puddle
	ld	puddle_x
	sub	#1;8
	bp	acc, 7, .Skip_Drawing_Puddle
callf	_Check_Puddle_Collision
	bn	puddle_flags, 7, .Puddle_Not_Hit
	set1	puddle_flags, 5
	mov	#8, Puddle_Timer
	mov	#<Puddle_Hit_Mask, acc
	st	trl
	st	puddle_spr_addr
	mov	#>Puddle_Hit_Mask, acc
	st	trh
	st	puddle_spr_addr+1
.Puddle_Not_Hit
	P_Draw_Sprite_Mask puddle_spr_addr, puddle_x, puddle_y
.Skip_Drawing_Puddle
	bp	puddle_x, 7, .Reassign_Puddle_Sprite	
	ld	puddle_x
	sub	#48
	bp	acc, 7, .Skip_Puddle_Image_Reassignment
.Reassign_Puddle_Sprite	
	mov	#0, puddle_flags ; Might Not Be Right.
	mov	#<Puddle_Mask, acc
	st	trl
	st	puddle_spr_addr
	mov	#>Puddle_Mask, acc
	st	trh
	st	puddle_spr_addr+1
.Skip_Puddle_Image_Reassignment
.Draw_Puddle_Splash
	ld	Puddle_Timer
	bz	.Puddle_Splash_Done
	mov	#<Puddle_Splash_Left_Mask, acc
	st	trl
	st	Puddle_Left_Splash_Sprite_Address
	mov	#>Puddle_Splash_Left_Mask, acc
	st	trh
	st	Puddle_Left_Splash_Sprite_Address+1	; Consider Animating This. If Not, Move It To "Initialize Variables."
	ld	player_car_x
	add	#1
	st	b
	ld	player_car_y
	add	#4
	st	c
	P_Draw_Sprite_Mask	Puddle_Left_Splash_Sprite_Address, b, c
	mov	#<Puddle_Splash_Right_Mask, acc
	st	trl
	st	Puddle_Right_Splash_Sprite_Address
	mov	#>Puddle_Splash_Right_Mask, acc
	st	trh
	st	Puddle_Right_Splash_Sprite_Address+1
	ld	player_car_x
	add	#1
	st	b
	ld	player_car_y
	sub	#6
	st	c
	P_Draw_Sprite_Mask	Puddle_Right_Splash_Sprite_Address, b, c
.Puddle_Splash_Done

;------------------------------------------------------------------------------
; Draw HUD (Consider Moving Drawing Of Score Down Here, Since We Want That On Top Of The Cars)
;------------------------------------------------------------------------------

;.BGDraw_Bridge
;	ld	Environment_Flags
;	sub	#3
;	bnz	.BGDraw_Done2
;	P_Draw_Background_Constant	TestBG_Bridgey
;.BGDraw_Done2
.Draw_HUD_Banner
	ld	HUD_Banner_Timer
	bz	.Draw_HUD_Regular
	dec	HUD_Banner_Timer
	Draw_HUD_Banner
	jmpf	.HUD_Done
.Draw_HUD_Regular
	Draw_HUD
	; P_Draw_Timer timer
.HUD_Done

; HUD Transitions:
	; If (Transition Flags)
	; Decrement Said Flag ^, +/Or Increment It If You Prefer Or It's Easier.
	; Draw_HUD_DMD Banner_Name_Number, HUD_Timer
	; When HUD_Timer Reaches Limit, Turn Of Transition Flags.
.handle_p
;	Handle Environment_Flags
	ld	player_car_speed
	bz	.Skip_Environment_Timer_Decrement
	dec	Environment_Timer
.Skip_Environment_Timer_Decrement
	ld	Environment_Timer
	bnz	.Calculate_Timer
	; not1	Environment_Flags, 0
.EF_FromNormal ; .EF_ZeroToOne
	ld	Environment_Flags
	bnz	.EF_From_Icy ; .EF_OneToTwo
	; If (Timer And Not Lives)
	ld	Lives_Flag
	bz	.Icy_From_Normal
.Bridge_From_Normal
	bp	score, 0, .Icy_From_Normal
	mov	#4, Environment_Flags ;/
	mov	#30, Environment_Timer
	mov	#12, FTestTimer
	clr1	Enemy_Car_Flags, 4
	clr1	Enemy_Car_Flags, 5
	jmpf	.Calculate_Timer
.Icy_From_Normal
	mov	#3, Environment_Flags ; inc	Environment_Flags ; mov #2,	Enviroment_Flags
	; Else, Calculate If Score's Ones Digit Is Odd Or Even, And Send To Icy Or Bridge Accordingly.
	mov	#30, Environment_Timer
	mov	#3, HUD_Banner_Number ; 4
	mov	#16, HUD_Banner_Timer
	jmpf	.handle_p ; .Calculate_Timer
.EF_From_Icy ;.EF_OneToTwo
	ld	Environment_Flags
	sub	#1
	bnz	.EF_From_Bridge ; .EF_TwoToZero	; This Needs To Be Fixed, Since The Flag Will Be Set At The Transition Function.
	mov	#5, Environment_Flags ; inc	Environment_Flags
	mov	#30, Environment_Timer
	; mov	#0, track_pos_marker
	jmpf	.Calculate_Timer
.EF_From_Bridge
	ld	Environment_Flags
	sub	#2
	bnz	.EF_TwoToZero ; Rename This
	mov	#6, Environment_Flags
	mov	#30, Environment_Timer
	mov	#0, Cars_In_Place_Bool
	jmpf	.Calculate_Timer
.EF_TwoToZero
.Calculate_Timer
	ld	Lives_Flag	;	Switch This To Have It As Like #200 Or Something, When In Timer Mode.
	bnz	.skip_timer_frame_flags_reset
; Check If It's Expired, And We Need To Switch To Lives.
	bp	timer, 7, .Set_Timer_To_Lives
	jmpf	.Countdown_Timer
.Set_Timer_To_Lives
	mov	#3, Lives_Flag
	mov	#0, Collision_Debugging_Flags ; To Prevent Freezing/Softlocking When Player Is Crashing As The Timer Expires And Switches To Lives. Ok, Maybe This Didn't Work.
	mov	#10, HUD_Banner_Timer
	mov	#0, HUD_Banner_Number
	jmp	.skip_timer_frame_flags_reset
.Countdown_Timer
	inc	timer_frame_flags
	bn	timer_frame_flags, 2, .skip_timer_frame_flags_reset
	mov	#0, timer_frame_flags
	dec	timer
	ld	timer
	bz	.skip_timer_to_lives_transition
	; Set The Lives Flag. Lives = 2/or/3.
.skip_timer_to_lives_transition
.skip_timer_frame_flags_reset

;================== Game Over
.Game_Over_Check
	ld	Game_Over_Bool
	bz	.Game_Not_Over
	; jmpf	.Game_Over
	sub	#1
	bnz	.You_Win
	mov	#22, b
	mov	#0, c
	P_Draw_Sprite	Game_Over_Text_Sprite_Address, b, c
	dec	Game_Over_Timer
	ld	Game_Over_Timer
	bnz	.Game_Not_Over
.You_Win
	P_Draw_Background_Constant	Congratulations_You_Win
	P_Blit_Screen
	dec	Game_Over_Timer
	ld	Game_Over_Timer
	bnz	.You_Win
	ret
.Game_Not_Over
;------------------------------------------------------------------------------
; Blit Screen, Etc.
;------------------------------------------------------------------------------
	P_Blit_Screen
	;inc		frame_flags
	;bn		frame_flags, 3, .skip_frame_reset
	;mov		#0, frame_flags
.skip_frame_reset
	not1	frame_flags, 5
	jmpf .driving_test_loop

%macro random
	push b
	push c
	ld random_seed
	st b
	mov #$4e,acc
	mov #$6d,c
	mul
	st b
	ld c
	mov	#8, b
	div
	; add #$39
	st random_seed
%end

; rand:
%macro rand2
	push b
	push c
	ld random_seed
	st b
	mov #$4e,acc
	mov #$6d,c
	mul
	st b
	ld c
	mov	#8, b
	div
	; add #$39
	; st random_seed
	ld	b
	; add	#1
	st RoadLeftVarCounter
%end	; ret

rand3:
	ld	score
	; xor	enemy_car2_y
	add	#7
	; st	RoadLeftVarCounter
	bp	acc, 1, .whyretcenter
.whyretleft
	bp	acc, 0, .whyretright
	mov	#1, RoadLeftVarNum
	jmpf .donewhyret
.whyretright
	mov	#2, RoadLeftVarNum
	jmpf .donewhyret
.whyretcenter
	mov	#0, RoadLeftVarNum
.donewhyret
	mov	#7, RoadLeftVarCounter
	ret

%macro Change_Enemy_Car1_Speed
.try2 ;Happy St. Joseph's Day!!!!!!!!!!!!!!!!!!!
ld enemy_car_speed
sub #2
bnz .try1
mov #1, enemy_car_speed
jmp .enemyset_done
.try1
ld enemy_car_speed
sub #1
bnz .try3
mov #3, enemy_car_speed
jmp .enemyset_done
.try3
ld enemy_car_speed
sub #3
bnz .enemyset_done
mov #2, enemy_car_speed
.enemyset_done
%end

%macro Change_Enemy_Car2_Speed
;.try2 ;Happy St. Joseph's Day!!!!!!!!!!!!!!!!!!!
;ld enemy_car2_speed
;sub #2
;bnz .try1_2
;mov #1, enemy_car2_speed
;jmp .enemy2set_done
;.try1_2
;ld enemy_car2_speed
;sub #1
;bnz .try3_2
;mov #3, enemy_car2_speed
;jmp .enemy2set_done
;.try3_2
;ld enemy_car2_speed
;sub #3
;bnz .enemy2set_done
;mov #2, enemy_car2_speed
;.enemy2set_done
random
st	enemy_car2_speed
%end

_Check_Enemy_Car_Collision:
.collision_check_player_top_side
	ld	c
	sub	player_car_y
	add	#3	; -3
	bz	.Set_Enemy_Car_Collision_1_Top_True
	sub	#1	; -2
	bz	.Set_Enemy_Car_Collision_1_Top_True
	sub	#1 ; -1
	bz	.Set_Enemy_Car_Collision_1_Top_True
	sub	#1 ; 0
	bz	.Set_Enemy_Car_Collision_1_Top_True
	sub	#1 ; 1
	bz	.Set_Enemy_Car_Collision_1_Top_True
	sub	#1 ; 2
	bz	.Set_Enemy_Car_Collision_1_Top_True
	sub	#1 ; 3
	bz	.Set_Enemy_Car_Collision_1_Top_True
	jmpf	.collision_check_player_left_side
.Set_Enemy_Car_Collision_1_Top_True
	set1	collision_debugging_flags, 3
	set1	collision_debugging_flags, 2
	jmpf	.collision_check_player_left_side
	;bp	acc, 7, .collision_check_player_bottom_side ; .collision_top_false
	;set1	collision_debugging_flags, 3
.collision_check_player_bottom_side
	ld	player_car_y
	sub	c
	add	#3
	bp	acc, 7, .collision_check_player_left_side
	set1	collision_debugging_flags, 2
.collision_check_player_left_side
	ld	player_car_x
	sub	b
	add	#5
	bp	acc, 7, .collision_check_player_right_side
	set1	collision_debugging_flags, 1
.collision_check_player_right_side
	ld	b
	sub	player_car_x
	add	#5
	bp	acc, 7, .set_collision_flag
	set1	collision_debugging_flags, 0
.set_collision_flag
	; bp	collision_debugging_flags, 1, .horizontal_collision_true
	; bp	collision_debugging_flags, 0, .horizontal_collision_true
	; jmp	.done_colliding
	bn	collision_debugging_flags, 1, .done_colliding
	bn	collision_debugging_flags, 0, .done_colliding
	; jmp	.done_colliding
; .horizontal_collision_true
	; bp	collision_debugging_flags, 3, .vertical_collision_true
	; bp	collision_debugging_flags, 2, .vertical_collision_true
	; jmp	.done_colliding
	bn	collision_debugging_flags, 3, .done_colliding
	bn	collision_debugging_flags, 2, .done_colliding
	; jmp	.done_colliding
; .vertical_collision_true
	mov	#0, player_car_speed
	set1	collision_debugging_flags, 4 ; This Means Collision Flag Is On.
.done_colliding
	; Reset The Four Collision Flags, To Free Them Up For The Next Car/Collision Check.
	not1	collision_debugging_flags, 3
	not1	collision_debugging_flags, 2
	not1	collision_debugging_flags, 1
	not1	collision_debugging_flags, 0
	
	ret

%macro Check_Enemy_Car_Collision
	mov	#<Gear_Marker_Low, acc
	st	trl
	st	num4_spr_addr
; Inputs: b (Enemy_Car_X), c (Enemy_Car_Y)
; Top/Bottom
.top_side_collision_check
	ld	c
	sub	player_car_y
	bz	.yes_top_collision
	be	#1, .yes_top_collision
	be	#2, .yes_top_collision
	be	#3, .yes_top_collision
	jmp	.no_top_collision
.yes_top_collision
	set1	collision_debugging_flags, 3
.no_top_collision
.bottom_side_collision_check
	ld	player_car_y
	sub	c
	bz	.yes_bottom_collision
	be	#1, .yes_bottom_collision
	be	#2, .yes_bottom_collision
	be	#3, .yes_bottom_collision
	jmp	.no_bottom_collision
.yes_bottom_collision
	set1	collision_debugging_flags, 2
.no_bottom_collision
; Sides
	ld	player_car_x
	sub	b
.left_side_collision_check
	bz	.yes_left_side_collision
	be	#1, .yes_left_side_collision
	be	#2, .yes_left_side_collision
	be	#3, .yes_left_side_collision
	be	#4, .yes_left_side_collision
	be	#5, .yes_left_side_collision
	jmp	.no_left_side_collision
.yes_left_side_collision
	set1	collision_debugging_flags, 1
.no_left_side_collision
.right_side_collision_check
	ld	b
	sub	player_car_x
	bz	.yes_right_side_collision
	be	#1, .yes_right_side_collision
	be	#2, .yes_right_side_collision
	be	#3, .yes_right_side_collision
	be	#4, .yes_right_side_collision
	be	#5, .yes_right_side_collision
	jmp	.no_right_side_collision
.yes_right_side_collision
	set1	collision_debugging_flags, 0
.no_right_side_collision

.handle_leftright	; 5/31: Ok, So I Think You Are Going To Want Collision To Happen IF (Top Or Bottom Flag.), AND (Left Or Right Flag.).
.draw_num4
	mov	#<Gear_Marker_Low, acc
	st	trl
	st	num4_spr_addr
	bp	collision_debugging_flags, 1, .horizontal_collision
	bp	collision_debugging_flags, 0, .horizontal_collision
	jmp	.handle_updown
.horizontal_collision
	bp	collision_debugging_flags, 3, .vertical_collision
	bp	collision_debugging_flags, 2, .vertical_collision
	jmp	.handle_updown
.vertical_collision
	; ret
	mov	#0, player_car_speed
	mov	#<Gear_Marker_High, acc
	st	trl
	st	num4_spr_addr
	set1	collision_debugging_flags, 4 ; This Means Collision Flag Is On.
.handle_updown
	; Reset The Four Collision Flags, To Free Them Up For The Next Car/Collision Check.
	not1	collision_debugging_flags, 3
	not1	collision_debugging_flags, 2
	not1	collision_debugging_flags, 1
	not1	collision_debugging_flags, 0
	; Jump To The Start Here, Then Increment Another Flag. Or A Third B, C, Or Something. Once We've Cycled Through All 2/3(?) Cars, Exit The Macro. Or, Look Into "Call" From Trent And Marcus.
	;bp	collision_debugging_flags, 5, .done_colliding
	;set1	collision_debugging_flags, 5
	;ld	enemy_car2_x
	;st	b
	;ld	enemy_car2_y
	;st	c
	;jmp	.top_side_collision_check
.done_colliding
%end

_Check_Puddle_Collision:
	bn	puddle_x, 5, .Skip_Puddle_Collision	; Consider Re-Doing This To 40 < Puddle_X < 47, Or Something.
	ld	puddle_x
	sub	#48
	bn	acc, 7, .Skip_Puddle_Collision
	ld	puddle_x
	sub	player_car_x
	add	#2
	bz	.Puddle_Collided
	sub	#1
	bz	.Puddle_Collided
	sub	#1
	bz	.Puddle_Collided
	sub	#1
	bz	.Puddle_Collided
	sub	#1
	bz	.Puddle_Collided
	jmpf	.Skip_Puddle_Collision
.Puddle_Collided
	ld	puddle_y
	sub	player_car_y
	sub	#2
	bz	.Puddle_Collided_Y
	add	#1
	bz	.Puddle_Collided_Y
	add	#1
	bz	.Puddle_Collided_Y
	add	#1
	bz	.Puddle_Collided_Y
	add	#1
	bz	.Puddle_Collided_Y
	jmpf	.Skip_Puddle_Collision
.Puddle_Collided_Y
	set1	puddle_flags, 7
.Skip_Puddle_Collision
	ret

Move_Left_Road_Boundary:
; dec	RoadLeftVarCounter
; mov	#3, RoadLeftVarCounter
.RoadLeft_Center
	ld	RoadLeftVarNum
	bnz	.RoadLeft_Left
	jmpf	.RoadLeft_Skip
.RoadLeft_Left
	ld	RoadLeftVarNum
	sub	#1
	bnz	.RoadLeft_Right
	callf	Move_Left_Road_Boundary_Left
	jmpf	.RoadLeft_Skip
.RoadLeft_Right
	ld	RoadLeftVarNum
	sub	#2
	bnz	.RoadLeft_Skip
	callf	Move_Left_Road_Boundary_Right
.RoadLeft_Skip
	dec	RoadLeftVarCounter
	; ld	RoadLeftVarCounter
	; sub	#1
	; st	RoadLeftVarCounter
	ld	RoadLeftVarCounter
	
	;bp	RoadLeftVarCounter, 7, .Skip_255
	;mov	#7, RoadLeftVarCounter
;.Skip_255
	bnz	.Skip_RoadLeftVar_Reset; assignment
	; rand2 ; callf rand
	callf	rand3
	; mov	#7, RoadLeftVarCounter
	;inc	RoadLeftVarNum
	;ld	RoadLeftVarNum
	;sub	#3
	;bnz	.Skip_RoadLeftVar_Reset
	;mov	#0, RoadLeftVarNum
	bp	RoadLeftVarCounter, 1, .move_left_road_boundary
	mov	#0, RoadLeftVarNum
	jmpf	.Skip_RoadLeftVar_Reset
.move_left_road_boundary
	mov	#1, RoadLeftVarNum
	bp	RoadLeftVarCounter, 0, .Skip_RoadLeftVar_Reset
	mov	#2, RoadLeftVarNum
.Skip_RoadLeftVar_Reset
	; ld	RoadLeftVarNum ; 0-7. 
	; callf Move_Left_Road_Boundary_Left
	; ld	RoadLeftVarCounter
	; Sub #8 (Or Whatever Time We Decide)
	; BNZ .Skip_RoadLeftVar_Reassignment
	; Do Da Random Numbers
;.Skip_RoadLeftVar_Reassignment
	ret

Move_Right_Road_Boundary:
.RoadRight_Center
	ld	RoadRightVarNum
	bnz	.RoadRight_Left
	jmpf	.RoadRight_Skip
.RoadRight_Left
	ld	RoadRightVarNum
	sub	#1
	bnz	.RoadRight_Right
	callf	Move_Right_Road_Boundary_Left
	jmpf	.RoadRight_Skip
.RoadRight_Right
	ld	RoadRightVarNum
	sub	#2
	bnz	.RoadRight_Skip
	callf	Move_Right_Road_Boundary_Right
.RoadRight_Skip
	dec	RoadRightVarCounter
	ld	RoadRightVarCounter
	bnz	.Skip_RoadRightVar_Reset
	ld	score_ones_digit
	add	#1
	st	RoadRightVarCounter
	inc	RoadRightVarNum
	ld	RoadRightVarNum
	sub	#3
	bnz	.Skip_RoadRightVar_Reset
	mov	#0, RoadRightVarNum
.Skip_RoadRightVar_Reset
	ret

Move_Left_Road_Boundary_Left:
	ld	road_leftboundary_ypos
	sub	#168 ; #174 ; #180
	bn	acc, 7, .keep_leftroad_rightside_boundary
	ld	road_leftboundary_ypos ; add	#180
	add	#6
	st	road_leftboundary_ypos
	inc	road_leftboundary
	jmpf	.done0830
.keep_leftroad_rightside_boundary
	mov	#2, RoadLeftVarNum
.done0830
	ret

Move_Left_Road_Boundary_Right:
	ld	road_leftboundary_ypos
	sub	#132
	bp	acc, 7, .keep_leftroad_rightside_boundary
	add	#132
	sub	#6
	st	road_leftboundary_ypos
	dec	road_leftboundary
.keep_leftroad_rightside_boundary
	ret

Move_Right_Road_Boundary_Left:
	ld	road_rightboundary_ypos
	sub	#72
	bn	acc, 7, .keep_rightroad_leftside_boundary
	add	#72
	add	#6
	st	road_rightboundary_ypos
	inc	road_rightboundary
.keep_rightroad_leftside_boundary
	ret

Move_Right_Road_Boundary_Right:
	ld	road_rightboundary_ypos
	sub	#18
	bp	acc, 7, .keep_rightroad_rightside_boundary
	add	#18
	sub	#6
	st	road_rightboundary_ypos
	dec	road_rightboundary
.keep_rightroad_rightside_boundary
	ret

; How To Determine How To Move The Road?
; Let's pretend we have a way to generate a random number...
; Generate_Next_Left_Road:
	; Returns --> Direction[0-3], Time[0-7or15]		;	0: Stay, 1: Left, 2: Right, 3: Force Both To (Stay/Left/Right?)
	; NOTE: Note that you'll have to slow down the "Time" when the Player Car is moving at a slower speed! E.G. Time * 4 = Time, Add Speed-Inc Every Frame. 
%macro Draw_HUD
; Prepare the frame buffer address
    mov     #P_WRAM_BANK, vrmad2
    mov     #P_WRAM_ADDR, vrmad1
    mov     #%00010000, vsel
; Draw HUD With Timer
.DrawHUD_Timer
ld	Lives_Flag ;; ld Lives Flag ; bnz	.Draw_Score_Lives
	bnz	.Draw_HUD_Lives
; Draw One Black Line
; Draw The Timer
	ld	timer
	st	c
    mov #0, acc
	mov	#10, b
    div
	ld	c
    st	score_tens_digit
    ld  b
	st	score_ones_digit
	P_Draw_Timer score_ones_digit, score_tens_digit ;timer ; Get The Two Timer Digits Here, Or Inside The Function?
	jmpf	.Draw_HUD_Score
.Draw_HUD_Lives
	P_Draw_Lives	Lives_Flag
.Draw_HUD_Score
; Draw The Score
	ld	score ;_low
	st	c
	ld	score_high
	mov	#10, b
	div
	st	score_digit_temp ; This Should Actually Be Score_High_Temp
	ld	b ; mov	b, score_ones_digit
	st	score_ones_digit
	ld	score_digit_temp
	mov	#10, b
	div
	st	score_digit_temp ;
	ld	b
	st	score_tens_digit
	ld	score_digit_temp
	mov	#10, b
	div
	st	score_digit_temp ;
	ld	b
	st	score_hundreds_digit
	ld	score_digit_temp
	mov	#10, b
	div
	st	score_digit_temp ;
	ld	b
	st	score_thousands_digit
	ld	score_digit_temp
	mov	#10, b
	div
	st	score_digit_temp ;
	ld	b
	st	score_ten_thousands_digit
	; st	score_digit_temp ; Hey, Looking At The ElysianVMU RAM Address Debugger, This Works! 9b And 37 In This Instance Tonight, A.K.A. 155 And 55 In Decimal, From Hex. Need To Divide By 10 For The Ones Digit.
	; Tens Digit: Divide Score By 10, = Result
.Draw_Score_Timer
	ld	Lives_Flag ;; ld Lives Flag ; bnz	.Draw_Score_Lives
	bnz	.Draw_Score_Lives
	P_Draw_Score_Timer score_ten_thousands_digit, score_thousands_digit, score_hundreds_digit, score_tens_digit, score_ones_digit
	jmpf	.Done_Drawing_scores
.Draw_Score_Lives
	P_Draw_Score_Lives score_ten_thousands_digit, score_thousands_digit, score_hundreds_digit, score_tens_digit, score_ones_digit

.Done_Drawing_Scores
; Draw The Gear Marker
.draw_low_gear
	bp	player_gear, 7, .draw_high_gear
	mov	#<Gear_Marker_Low_Tiles, trl
	mov	#>Gear_Marker_Low_Tiles, trh
	P_Draw_Gear_Marker
	jmpf	.done_drawing_hud
.draw_high_gear
	bn	player_gear, 7, .done_drawing_hud
	mov	#<Gear_Marker_High_Tiles, trl
	mov	#>Gear_Marker_High_Tiles, trh
	P_Draw_Gear_Marker
.done_drawing_hud
%end

%macro	Draw_HUD_Banner
	P_Draw_HUD_Banner	HUD_Banner_Number
%end

%macro Handle_Test_Track ; Going To Refactor This With DrawPixels From Sebastian.
	P_Draw_Background_Constant Test_Track_0
	ld	track_pos_marker
	add	speed_temp
	; inc	track_pos_marker
	; add	#1
	st	track_pos_marker
; If Bit 3 Is Set, Subtract 8.
	bn	track_pos_marker, 3, .skip_subtrackt
	;sub	#8, track_pos_marker
	sub	#8
	st	track_pos_marker
.skip_subtrackt
	ld	track_pos_marker
	bnz	.TrackBG1
	; P_Draw_Background_Constant Test_Track_0
	jmp	.BGMacroDrawDone
.TrackBG1
	ld	track_pos_marker
	sub #1
	bnz	.TrackBG2
	; P_Draw_Background_Constant Test_Track_1
	jmp	.BGMacroDrawDone
.TrackBG2
	ld	track_pos_marker
	sub #2
	bnz	.TrackBG3
	; P_Draw_Background_Constant Test_Track_2
	jmp	.BGMacroDrawDone
.TrackBG3
	ld	track_pos_marker
	sub #3
	bnz	.TrackBG4
	; P_Draw_Background_Constant Test_Track_3
	jmp	.BGMacroDrawDone
.TrackBG4
	ld	track_pos_marker
	sub #4
	bnz	.TrackBG5
	; P_Draw_Background_Constant Test_Track_4
	jmp	.BGMacroDrawDone
.TrackBG5
	ld	track_pos_marker
	sub #5
	bnz	.TrackBG6
	; P_Draw_Background_Constant Test_Track_5
	jmp	.BGMacroDrawDone
.TrackBG6
	ld	track_pos_marker
	sub #6
	bnz	.TrackBG7
	; P_Draw_Background_Constant Test_Track_6
	jmp	.BGMacroDrawDone
.TrackBG7
	ld	track_pos_marker
	sub #7
	bnz	.BGMacroDrawDone
	; P_Draw_Background_Constant Test_Track_7
	; jmp	.BGMacroDrawDone
.BGMacroDrawDone
; P_Draw_Background	BG_Frame
%end

Get_Enemy_Cars_In_Place: ; %car1y, %car2y ; Get_Enemy_Cars_In_Place	car1y, car2y:
	bp	Cars_In_Place_Bool, 4, .Cars_In_Place_Done
	bn	Cars_In_Place_Bool, 0, .Set_Enemy_Car1_IP
	bn	Cars_In_Place_Bool, 1, .Set_Enemy_Car2_IP
	jmpf	.Cars_In_Place_Done
.Set_Enemy_Car1_IP
	ld	enemy_car_y
	sub	b
	bz	.Enemy_Car1_Set_IP
.Move_Enemy_Car1_IP_Up
	bp	acc, 7, .Move_Enemy_Car1_IP_Down
	dec	enemy_car_y
	jmpf	.Set_Enemy_Car2_IP
.Move_Enemy_Car1_IP_Down
	bn	acc, 7, .Set_Enemy_Car2_IP
	inc	enemy_car_y
	jmpf	.Set_Enemy_Car2_IP
.Enemy_Car1_Set_IP
	set1	Cars_In_Place_Bool, 0
.Set_Enemy_Car2_IP
	bp	Cars_In_Place_Bool, 1, .Cars_In_Place_Done
	ld	enemy_car2_y
	sub	c
	bz	.Enemy_Car2_Set_IP
.Move_Enemy_Car2_IP_Up
	bp	acc, 7, .Move_Enemy_Car2_IP_Down
	dec	enemy_car2_y
	jmpf	.Cars_In_Place_Done
.Move_Enemy_Car2_IP_Down
	bn	acc, 7, .Cars_In_Place_Done
	inc	enemy_car2_y
.Enemy_Car2_Set_IP
	set1	Cars_In_Place_Bool, 1
.Cars_In_Place_Done
ret	; %end ;	ret

Get_Road_Boundaries_In_Place:
	bp	Cars_In_Place_Bool, 4, .Road_Boundaries_In_Place_Done
	bn	Cars_In_Place_Bool, 2, .Set_Left_Road_Boundary_IP
	bn	Cars_In_Place_Bool, 3, .Set_Right_Road_Boundary_IP
	jmpf	.Road_Boundaries_In_Place_Done
.Set_Left_Road_Boundary_IP
	ld	road_leftboundary
	sub	b
	bz	.Road_LeftBoundary_Set_IP
.Move_Left_Road_Boundary_IP_Up
	bp	acc, 7, .Move_Left_Road_Boundary_IP_Down
	callf	Move_Left_Road_Boundary_Right
	jmpf	.Set_Right_Road_Boundary_IP
.Move_Left_Road_Boundary_IP_Down
	bn	acc, 7, .Set_Right_Road_Boundary_IP
	callf	Move_Left_Road_Boundary_Left
	jmpf	.Set_Right_Road_Boundary_IP
.Road_LeftBoundary_Set_IP
	set1	Cars_In_Place_Bool, 2
.Set_Right_Road_Boundary_IP
	bp	Cars_In_Place_Bool, 3, .Road_Boundaries_In_Place_Done
	ld	road_rightboundary
	sub	c
	bz	.Road_RightBoundary_Set_IP
.Move_Right_Road_Boundary_IP_Up
	bp	acc, 7, .Move_Right_Road_Boundary_IP_Down
	callf	Move_Right_Road_Boundary_Right
	jmpf	.Road_Boundaries_In_Place_Done
.Move_Right_Road_Boundary_IP_Down
	bn	acc, 7, .Road_Boundaries_In_Place_Done
	callf	Move_Right_Road_Boundary_Left
.Road_RightBoundary_Set_IP
	set1	Cars_In_Place_Bool, 3
.Road_Boundaries_In_Place_Done
ret

Draw_Ambulance_Banner_Animation:
;	ld	Ambulance_Frame
;.AmbulanceBanner_Frame0
;	bnz	.AmbulanceBanner_Frame1
;.AmbulanceBanner_Frame1
	bp	Ambulance_Frame, 5, .Reset_Ambulance_Frame
	jmpf	.Increment_Ambulance_Frame
.Reset_Ambulance_Frame
	mov	#0, HUD_Banner_Timer
	mov	#0, Ambulance_Frame
	jmpf	.Ambulance_Banner_Done
.Increment_Ambulance_Frame
	inc	Ambulance_Frame
.Draw_Ambulance_Banner_Frame
	P_Draw_Ambulance_Banner	Ambulance_Frame
.Ambulance_Banner_Done
	ret