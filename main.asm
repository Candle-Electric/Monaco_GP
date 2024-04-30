;******************************************************************************
; Monaco GP: Main ASM file
;******************************************************************************

;=======================;
;  Prepare Application  ;
;=======================;
    .org	$00
	jmpf	start

	.org	$3
	jmp	nop_irq

	.org	$b
	jmp	nop_irq
	
	.org	$13
	jmp	nop_irq

	.org	$1b
	jmp	t1int
	
	.org	$23
	jmp	nop_irq

	.org	$2b
	jmp	nop_irq
	
	.org	$33
	jmp	nop_irq

	.org	$3b
	jmp	nop_irq

	.org	$43
	jmp	nop_irq

	.org	$4b
	clr1	p3int,0
	clr1	p3int,1
nop_irq:
	reti

	.org	$130	
t1int:
	push	ie
	clr1	ie,7
	not1	ext,0
	jmpf	t1int
	pop	ie
	reti

	.org	$1f0

goodbye:	
	not1	ext,0
	jmpf	goodbye

    
;******************************************************************************
; Variables
;******************************************************************************
; Global variables
p3_pressed              =       $4      ; 1 byte
p3_last_input           =       $5      ; 1 byte

;******************************************************************************
; Game Header
;******************************************************************************
    .org   $200
    .include "GameHeader.i" ; .include "../Advent_Wreath_Upload/GameHeader.i" ; .include "GameHeader.i"
; Credits/Thanks:	
	.org	$680
    .byte    " Monaco GP VMU  "
    .byte   "  Dedicated To  "
    .byte   " Alfredo.  O:-) "
    .byte   "Thanks To:      "
    .byte   "Kresna Susila,  "
    .byte   "Walter Tetzner, "
    .byte   "Falco Girgis,   "
    .byte   "Dmitry Grinberg,"
    .byte   "Marcus Comstedt,"
    .byte   "Sebastian Mihai,"
    .byte   "Tyco,Trent,Speud"
    .byte   "RetroOnyx,Ian M."
    .byte   "B.Leeto,NeoGeoF,"
    .byte   "B.Squirrel,Akane"
    .byte   "Sega Retro,     "
    .byte   "Ben Geeves,     "
    .byte   "All OG Monaco GP"
    .byte   "Players + Staff,"
    .byte   "  And Many More."
    .byte   "And You,        "
    .byte   "    For Playing!" 
    .byte   "...Both This And"
    .byte   "Happy Advent!:-)"
    .byte   "BLCARLOA,STFEAIF"
    .byte   "HBD,+M.!GBRDDRAA"
    

Start:
	clr1 ie,7
	mov #$a1,ocr
	mov #$09,mcr
	mov #$80,vccr
	clr1 p3int,0
	clr1 p1,7
	mov #$ff,p3
	set1 ie,7
	
	;clr1 psw,1
	;ld $lc
	;set1 psw,1

Main_Loop:
        callf    Title_Screen
        callf    Driving_Gameplay
        jmpf     Main_Loop

        ; .include      "./lib/libperspective.asm" ; Courtesy of Kresna Susila. 
        .include        "./lib/libperspective_long.asm" ; Adapted From Original Code (C) Kresna Susila - 2018. Edited LibPerspective File; Lots Of Calls Replaced With CallF To Circumvent Build Errors From This Monaco GP Code.
        .include        "./lib/libkcommon.asm"
        .include        "./src/TitleScreen.asm"
        .include        "./src/Driving_Gameplay.asm"
        ; .include      "./src/Game_Over_Screen.asm"
        .include        "./img/MGP_TSBG.asm"
        .include        "./lib/sfr.i" ; VMU Special Function Register Mapping
        .include        "./lib/MonacoGP_AdditionalFunctions.asm"
		
        .include        "./img/Player_Car_B.asm"
        .include        "./img/Player_Car_W.asm"
        .include        "./img/Test_Track.asm"
        .include        "./img/Player_Car_B_Mask.asm"
        .include        "./img/Player_Car_W_Mask.asm"
        .include        "./img/Gear_Marker_High.asm"
        .include        "./img/Gear_Marker_Low.asm"
        .include        "./img/Numbers/Zero.asm"
        .include        "./img/Numbers/One.asm"
        .include        "./img/Test_Track_0.asm"
        .include        "./img/Test_Track_1.asm"
        .include        "./img/Test_Track_2.asm"
        .include        "./img/Test_Track_3.asm"
        .include        "./img/Test_Track_4.asm"
        .include        "./img/Test_Track_5.asm"
        .include        "./img/Test_Track_6.asm"
        .include        "./img/Test_Track_7.asm"
        .include        "./img/Collision_Debugging_Up.asm"
        .include        "./img/Collision_Debugging_Down.asm"
        .include        "./img/Collision_Debugging_Left.asm"
        .include        "./img/Collision_Debugging_Right.asm"
        .include        "./img/Collision_Debugging_Above.asm"
        .include        "./img/Collision_Debugging_Below.asm"
        .include        "./img/BruhWhoa.asm"
        .include        "./img/Player_Car_Collision_0.asm"
        .include        "./img/Player_Car_Collision_0_Mask.asm"
        .include        "./img/Player_Car_Collision_1_Mask.asm"
        .include        "./img/Test_Track_8-Test-Copy.asm"
        .include        "./img/AllBlack.asm"
        .include        "./img/AllWhite.asm"
        .include        "./img/RoadTexture_Step0.asm"
        .include        "./img/RoadTexture_Step1.asm"
        .include        "./img/RoadTexture_Step2.asm"
        .include        "./img/RoadTexture_Step3.asm"
        .include        "./img/RoadTexture_Step4.asm"
        .include        "./img/RoadTexture_Step5.asm"
        .include        "./img/RoadTexture_Step6.asm"
        .include        "./img/RoadTexture_Step7.asm"
        .include        "./img/RoadTexture5_Step0.asm"
        .include        "./img/RoadTexture5_Step1.asm"
        .include        "./img/RoadTexture5_Step2.asm"
        .include        "./img/RoadTexture5_Step3.asm"
        .include        "./img/RoadTexture5_Step4.asm"
        .include        "./img/RoadTexture5_Step5.asm"
        .include        "./img/RoadTexture5_Step6.asm"
        .include        "./img/RoadTexture5_Step7.asm"
        ;.include        "./img/RoadTesture_Step0.asm"
        ;.include        "./img/RoadTesture_Step1.asm"
        ;.include        "./img/RoadTesture_Step2.asm"
        ;.include        "./img/RoadTesture_Step3.asm"
        ;.include        "./img/RoadTesture_Step4.asm"
        ;.include        "./img/RoadTesture_Step5.asm"
        ;.include        "./img/RoadTesture_Step6.asm"
        ;.include        "./img/RoadTesture_Step7.asm"
        .include        "./img/Number_3.asm"
        .include        "./img/Number_4.asm"
        .include        "./img/Number_0.asm"
        .include        "./img/Number_1.asm"
        .include        "./img/Number_2.asm"
        .include        "./img/Number_5.asm"
        .include        "./img/Number_6.asm"
        .include        "./img/Number_7.asm"
        .include        "./img/Number_8.asm"
        .include        "./img/Number_9.asm"
        .include        "./img/Number_0b.asm"
        .include        "./img/Number_1b.asm"
        .include        "./img/Number_2b.asm"
        .include        "./img/Number_3b.asm"
        .include        "./img/Number_4b.asm"
        .include        "./img/Number_5b.asm"
        .include        "./img/Number_6b.asm"
        .include        "./img/Number_7b.asm"
        .include        "./img/Number_8b.asm"
        .include        "./img/Number_9b.asm"
        .include        "./img/Gear_Marker_Low_Tiles.asm" ;?
        .include        "./img/Gear_Marker_High_Tiles.asm"
        .include        "./img/Puddle.asm"
        .include        "./img/Puddle_Splash.asm"
        .include        "./img/Player_Car_Collision_1.asm"
        .include        "./img/Player_Car_Collision_2.asm"
        .include        "./img/Player_Car_Collision_3.asm"
        .include        "./img/Player_Car_Collision_4.asm"
        .include        "./img/Player_Car_Collision_5.asm"
        .include        "./img/Player_Car_Collision_6.asm"
        .include        "./img/Player_Car_Collision_7.asm"
        .include        "./img/Player_Car_Collision_2_Mask.asm"
        .include        "./img/Player_Car_Collision_3_Mask.asm"
        .include        "./img/Player_Car_Collision_4_Mask.asm"
        .include        "./img/Player_Car_Collision_5_Mask.asm"
        .include        "./img/Player_Car_Collision_6_Mask.asm"
        ;.include       "./img/Player_Car_Collision_7_Mask.asm"
        .include        "./img/HUD_Spacer.asm"
        .include        "./img/Puddle_Mask.asm"
        .include        "./img/Puddle_Splash_Mask2.asm"
        .include        "./img/Player_Car_Swerve_L_Mask.asm"
        .include        "./img/Player_Car_Swerve_R_Mask.asm"
        .include        "./img/TestBG_Icy.asm"
        .include        "./img/Ambulance_Mask.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_0.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_1.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_2.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_3.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_4.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_5.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_6.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_7.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_8.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_9.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_10.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_11.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_12.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_13.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_14.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_15.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_16.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_17.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_18.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_19.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_20.asm"
        ;include        "./img/Transition_BGTestInto/Transition_BGTestInto_20.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_21.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_22.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_23.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_24.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_25.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_26.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_27.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_28.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_29.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_30.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_31.asm"
        ;include        "./img/Transition_BGTestInto/Transition_BGTestInto_31.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_32.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_33.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_34.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_35.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_36.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_37.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_38.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_39.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_40.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_41.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_42.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_43.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_44.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_45.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_46.asm"
        .include        "./img/Transition_BGTestInto/Transition_BGTestInto_47.asm"
        .include        "./img/TestBG_Bridgey.asm"
        .include        "./img/Puddle_Splash_Left_Mask.asm"
        .include        "./img/Puddle_Splash_Right_Mask.asm"
        .include        "./img/Puddle_Hit_Mask.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_0.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_1.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_2.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_3.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_4.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_5.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_6.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_7.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_8.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_9.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_10.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_11.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_12.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_13.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_14.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_15.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_16.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_17.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_18.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_19.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_20.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_21.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_22.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_23.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_24.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_25.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_26.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_27.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_28.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_29.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_30.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_31.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_32.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_33.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_34.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_35.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_36.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_37.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_38.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_39.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_40.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_41.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_42.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_43.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_44.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_45.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_46.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_47.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_48.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_50.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_52.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_54.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_56.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_58.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_60.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_62.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_64.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_66.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_68.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_70.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_72.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_74.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_76.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_78.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_80.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_82.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_84.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_86.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_88.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_90.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_92.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_94.asm"
        .include        "./img/Starting_Line/Starting_Line_Blocks_96.asm"
        ;.include       "./img/Lives_Counter_0.asm"
        .include        "./img/Lives_Counter_1.asm"
        .include        "./img/Lives_Counter_2.asm"
        .include        "./img/Lives_Counter_3.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_0.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_2.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_4.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_6.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_8.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_10.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_12.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_14.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_16.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_18.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_20.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_22.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_24.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_26.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_28.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_30.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_32.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_34.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_36.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_38.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_40.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_42.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_44.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_46.asm"
        .include        "./img/Transition_NormalIntoIcy/Transition_NormalToIcy_48.asm"
        .include        "./img/Explosion_Mask_0.asm"
        .include        "./img/Explosion_Mask_1.asm"
        .include        "./img/Explosion_Mask_2.asm"
        .include        "./img/Explosion_Mask_3.asm"
        .include        "./img/Explosion_Mask_4.asm"
        .include        "./img/1CarLeft.asm"
        .include        "./img/2CarsLeft.asm"
        .include        "./img/3CarsLeft.asm"
        .include        "./img/Icy_Banner.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_0.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_2.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_4.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_6.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_8.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_10.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_12.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_14.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_16.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_18.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_20.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_22.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_24.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_26.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_28.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_30.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_32.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_34.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_36.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_38.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_40.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_42.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_44.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_46.asm"
        .include        "./img/Transition_IcyIntoNormal/Transition_IcyToNormal_48.asm"
        .include        "./img/StickFigure_0_Mask.asm"
        .include        "./img/StickFigure_1_Mask.asm"
        .include        "./img/StickFigure_2_Mask.asm"
        .include        "./img/Ambulance_Banner.asm"
        .include        "./img/Game_Over_Text.asm"
        .include        "./img/Game_Over_Screen_Text.asm"
        .include        "./img/Bridge_Banner.asm"
        .include        "./img/Congratulations_You_Win.asm"
        .include        "./img/Headlight_Front_Mask.asm"
        .include        "./img/Headlight_Back_Mask.asm"
        .include        "./img/Ambulance_Point_Marker_Sprite_Mask.asm"
        .include        "./img/Title_Screen_Graphic.asm"
        .include        "./img/Great_Driving_Message_Mask.asm"

;******************************************************************************
; End of File
;******************************************************************************
        .cnop   0,$200          ; pad to an even number of blocks
