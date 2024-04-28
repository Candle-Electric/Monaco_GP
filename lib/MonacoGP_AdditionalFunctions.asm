;	A_Move_Enemy_Car
;	===========================
;	A_Check_Collision
;	Accepts: Player_Car_X, Player_Car_Y, Enemy_Car_X, Enemy_Car_Y

%macro  P_Draw_Horizontal_Line %ypos, %bgaddr
        call    _P_Draw_Horizontal_Line
%end

%macro  P_Draw_Road %topypos, %bottomypos, %bgstep, %BlackBG
        mov #%00000000, acc
        st  trl
        st  trh
        mov     #%topypos, b ; Necessary?
        ld  %topypos
        st  b
        callf _P_Draw_BG_WhiteSpace_Top
        mov     #<AllBlack, trl
        mov     #>AllBlack, trh
        ld  b
        add #6
        st  b
        callf _P_Draw_Horizontal_Line
        
        ld  %bgstep
        st  p_spr_flag
        callf   _P_Set_Road_Texture
        ld  b
        add #6
        st  b
        callf _P_Draw_Horizontal_Line
        mov #<AllBlack, trl
        mov #>AllBlack, trh
        ld  b
        add #6
        st  b
        callf _P_Draw_Horizontal_Line

        ; Now, you Want To Store White_BG Again And Call That Until B Is At %BottomYPos
        ld  %bottomypos
        st  b
        callf _P_Draw_BG_WhiteSpace_Middle ; Top
        mov     #<AllBlack, trl
        mov     #>AllBlack, trh
        ld  b
        add #6
        st  b
        callf _P_Draw_Horizontal_Line
        ld  b
        add #6
        st  b
        ld  %bgstep
        callf   _P_Set_Road_Texture
        callf _P_Draw_Horizontal_Line
        mov     #<AllBlack, trl
        mov     #>AllBlack, trh
        ld  b
        add #6
        st  b
        callf _P_Draw_Horizontal_Line

%end

%macro  P_Draw_Road_Icy %topypos, %bottomypos, %bgstep, %BlackBG
        mov #%00000000, acc
        st  trl
        st  trh
        mov     #%topypos, b
        ld  %topypos
        st  b
        callf _P_Draw_BG_WhiteSpace_Top
        mov     #<AllBlack, trl
        mov     #>AllBlack, trh
        ld  b
        add #6
        st  b        
        ld  %bgstep
        st  p_spr_flag
        callf   _P_Set_Road_Texture
        ld  b
        add #6
        st  b
        callf _P_Draw_Horizontal_Line
        mov #<AllBlack, trl
        mov #>AllBlack, trh
        ld  b
        add #6
        st  b
        callf _P_Draw_Horizontal_Line
        ; Now, you Want To Store White_BG Again And Call That Until B Is At %BottomYPos
        ld  %bottomypos
        st  b
        callf _P_Draw_BG_Icy_Middle ;
        mov     #<AllBlack, trl
        mov     #>AllBlack, trh
        ld  b
        add #6 ;#18 ;#6
        st  b
        callf _P_Draw_Horizontal_Line
        ld  b
        add #6 ;#18 ;#6
        st  b
        ld  %bgstep
        callf   _P_Set_Road_Texture
        callf _P_Draw_Horizontal_Line
        mov     #<AllBlack, trl
        mov     #>AllBlack, trh
        ld  b
        add #6 ;#18 ;#6
        st  b
        callf _P_Draw_Horizontal_Line
%end

%macro  P_Draw_Road_Bridge  %bgstep
    P_Draw_Background_Constant  TestBG_Bridgey
%end

%macro  P_Draw_Road_Transition_Test %bgstep
    ld  %bgstep
    st  b
    callf   _P_Draw_Road_Transition_Test
%end

_P_Draw_Road_Transition_Test: ;
.Test_Road_Transition_0
    ld  b
    bnz .Test_Road_Transition_1
    P_Draw_Background_Constant Transition_BGTestInto_0
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_1
    ld  b
    sub #1
    bnz .Test_Road_Transition_2
    P_Draw_Background_Constant Transition_BGTestInto_1
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_2    
    ld  b
    sub #2
    bnz .Test_Road_Transition_3
    P_Draw_Background_Constant Transition_BGTestInto_2
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_3
    ld  b
    sub #3
    bnz .Test_Road_Transition_4
    P_Draw_Background_Constant Transition_BGTestInto_3
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_4
    ld  b
    sub #4
    bnz .Test_Road_Transition_5
    P_Draw_Background_Constant Transition_BGTestInto_4
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_5
    ld  b
    sub #5
    bnz .Test_Road_Transition_6
    P_Draw_Background_Constant Transition_BGTestInto_5
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_6
    ld  b
    sub #6
    bnz .Test_Road_Transition_7
    P_Draw_Background_Constant Transition_BGTestInto_6
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_7
    ld  b
    sub #7
    bnz .Test_Road_Transition_8
    P_Draw_Background_Constant Transition_BGTestInto_7
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_8
    ld  b
    sub #8
    bnz .Test_Road_Transition_9
    P_Draw_Background_Constant Transition_BGTestInto_8
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_9
    ld  b
    sub #9
    bnz .Test_Road_Transition_10
    P_Draw_Background_Constant Transition_BGTestInto_9
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_10
    ld  b
    sub #10
    bnz .Test_Road_Transition_11
    P_Draw_Background_Constant Transition_BGTestInto_10
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_11
    ld  b
    sub #11
    bnz .Test_Road_Transition_12
    P_Draw_Background_Constant Transition_BGTestInto_11
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_12
    ld  b
    sub #12
    bnz .Test_Road_Transition_13
    P_Draw_Background_Constant Transition_BGTestInto_12
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_13
    ld  b
    sub #13
    bnz .Test_Road_Transition_14
    P_Draw_Background_Constant Transition_BGTestInto_13
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_14
    ld  b
    sub #14
    bnz .Test_Road_Transition_15
    P_Draw_Background_Constant Transition_BGTestInto_14
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_15
    ld  b
    sub #15
    bnz .Test_Road_Transition_16
    P_Draw_Background_Constant Transition_BGTestInto_15
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_16
    ld  b
    sub #16
    bnz .Test_Road_Transition_17
    P_Draw_Background_Constant Transition_BGTestInto_16
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_17
    ld  b
    sub #17
    bnz .Test_Road_Transition_18
    P_Draw_Background_Constant Transition_BGTestInto_17
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_18
    ld  b
    sub #18
    bnz .Test_Road_Transition_19
    P_Draw_Background_Constant Transition_BGTestInto_18
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_19
    ld  b
    sub #19
    bnz .Test_Road_Transition_20
    P_Draw_Background_Constant Transition_BGTestInto_19
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_20
    ld  b
    sub #20
    bnz .Test_Road_Transition_21
    P_Draw_Background_Constant Transition_BGTestInto_20
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_21
    ld  b
    sub #21
    bnz .Test_Road_Transition_22
    P_Draw_Background_Constant Transition_BGTestInto_21
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_22
    ld  b
    sub #22
    bnz .Test_Road_Transition_23
    P_Draw_Background_Constant Transition_BGTestInto_22
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_23
    ld  b
    sub #23
    bnz .Test_Road_Transition_24
    P_Draw_Background_Constant Transition_BGTestInto_23
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_24
    ld  b
    sub #24
    bnz .Test_Road_Transition_25
    P_Draw_Background_Constant Transition_BGTestInto_24
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_25
    ld  b
    sub #25
    bnz .Test_Road_Transition_26
    P_Draw_Background_Constant Transition_BGTestInto_25
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_26
    ld  b
    sub #26
    bnz .Test_Road_Transition_27
    P_Draw_Background_Constant Transition_BGTestInto_26
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_27
    ld  b
    sub #27
    bnz .Test_Road_Transition_28
    P_Draw_Background_Constant Transition_BGTestInto_27
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_28
    ld  b
    sub #28
    bnz .Test_Road_Transition_29
    P_Draw_Background_Constant Transition_BGTestInto_28
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_29
    ld  b
    sub #29
    bnz .Test_Road_Transition_30
    P_Draw_Background_Constant Transition_BGTestInto_29
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_30
    ld  b
    sub #30
    bnz .Test_Road_Transition_31
    P_Draw_Background_Constant Transition_BGTestInto_30
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_31
    ld  b
    sub #31
    bnz .Test_Road_Transition_32
    P_Draw_Background_Constant Transition_BGTestInto_31
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_32
    ld  b
    sub #32
    bnz .Test_Road_Transition_33
    P_Draw_Background_Constant Transition_BGTestInto_32
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_33
    ld  b
    sub #33
    bnz .Test_Road_Transition_34
    P_Draw_Background_Constant Transition_BGTestInto_33
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_34
    ld  b
    sub #34
    bnz .Test_Road_Transition_35
    P_Draw_Background_Constant Transition_BGTestInto_34
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_35
    ld  b
    sub #35
    bnz .Test_Road_Transition_36
    P_Draw_Background_Constant Transition_BGTestInto_35
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_36
    ld  b
    sub #36
    bnz .Test_Road_Transition_37
    P_Draw_Background_Constant Transition_BGTestInto_36
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_37
    ld  b
    sub #37
    bnz .Test_Road_Transition_38
    P_Draw_Background_Constant Transition_BGTestInto_37
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_38
    ld  b
    sub #38
    bnz .Test_Road_Transition_39
    P_Draw_Background_Constant Transition_BGTestInto_38
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_39
    ld  b
    sub #39
    bnz .Test_Road_Transition_40
    P_Draw_Background_Constant Transition_BGTestInto_39
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_40
    ld  b
    sub #40
    bnz .Test_Road_Transition_41
    P_Draw_Background_Constant Transition_BGTestInto_40
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_41
    ld  b
    sub #41
    bnz .Test_Road_Transition_42
    P_Draw_Background_Constant Transition_BGTestInto_41
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_42
    ld  b
    sub #42
    bnz .Test_Road_Transition_43
    P_Draw_Background_Constant Transition_BGTestInto_42
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_43
    ld  b
    sub #43
    bnz .Test_Road_Transition_44
    P_Draw_Background_Constant Transition_BGTestInto_43
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_44
    ld  b
    sub #44
    bnz .Test_Road_Transition_45
    P_Draw_Background_Constant Transition_BGTestInto_44
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_45
    ld  b
    sub #45
    bnz .Test_Road_Transition_46
    P_Draw_Background_Constant Transition_BGTestInto_45
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_46
    ld  b
    sub #46
    bnz .Test_Road_Transition_47
    P_Draw_Background_Constant Transition_BGTestInto_46
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_47
    ld  b
    sub #47 ;#147
    bnz .Test_Road_Transition_Done
    P_Draw_Background_Constant Transition_BGTestInto_47
    jmpf    .Test_Road_Transition_Done
.Test_Road_Transition_Done
    ret

%macro  P_Draw_Starting_Line_Transition %bgstep
    ld  %bgstep
    st  b
    bn  b, 0, .Skip_EvenNumber_StartingBlocks
    dec b
.Skip_EvenNumber_StartingBlocks
    callf   _P_Draw_Starting_Line_Transition
%end

_P_Draw_Starting_Line_Transition:
.Starting_Transition_0
    ld  b
    bnz .Starting_Transition_2
    P_Draw_Background_Constant Starting_Line_Blocks_0
    jmpf    .Starting_Transition_Done
;.Starting_Transition_1
;    ld  b
;    sub #1
;    bnz .Starting_Transition_2
;    P_Draw_Background_Constant Starting_Line_Blocks_1
;    jmpf    .Starting_Transition_Done
.Starting_Transition_2    
    ld  b
    sub #2
    bnz .Starting_Transition_4
    P_Draw_Background_Constant Starting_Line_Blocks_2
    jmpf    .Starting_Transition_Done
;.Starting_Transition_3
;    ld  b
;    sub #3
;    bnz .Starting_Transition_4
;    P_Draw_Background_Constant Starting_Line_Blocks_3
;    jmpf    .Starting_Transition_Done
.Starting_Transition_4
    ld  b
    sub #4
    bnz .Starting_Transition_6
    P_Draw_Background_Constant Starting_Line_Blocks_4
    jmpf    .Starting_Transition_Done
;.Starting_Transition_5
;    ld  b
;    sub #5
;    bnz .Starting_Transition_6
;    P_Draw_Background_Constant Starting_Line_Blocks_5
;    jmpf    .Starting_Transition_Done
.Starting_Transition_6
    ld  b
    sub #6
    bnz .Starting_Transition_8
    P_Draw_Background_Constant Starting_Line_Blocks_6
    jmpf    .Starting_Transition_Done
;.Starting_Transition_7
;    ld  b
;    sub #7
;    bnz .Starting_Transition_8
;    P_Draw_Background_Constant Starting_Line_Blocks_7
;    jmpf    .Starting_Transition_Done
.Starting_Transition_8
    ld  b
    sub #8
    bnz .Starting_Transition_10
    P_Draw_Background_Constant Starting_Line_Blocks_8
    jmpf    .Starting_Transition_Done
;.Starting_Transition_9
;    ld  b
;    sub #9
;    bnz .Starting_Transition_10
;    P_Draw_Background_Constant Starting_Line_Blocks_9
;    jmpf    .Starting_Transition_Done
.Starting_Transition_10
    ld  b
    sub #10
    bnz .Starting_Transition_12
    P_Draw_Background_Constant Starting_Line_Blocks_10
    jmpf    .Starting_Transition_Done
;.Starting_Transition_11
;    ld  b
;    sub #11
;    bnz .Starting_Transition_12
;    P_Draw_Background_Constant Starting_Line_Blocks_11
;    jmpf    .Starting_Transition_Done
.Starting_Transition_12
    ld  b
    sub #12
    bnz .Starting_Transition_14
    P_Draw_Background_Constant Starting_Line_Blocks_12
    jmpf    .Starting_Transition_Done
;.Starting_Transition_13
;    ld  b
;    sub #13
;    bnz .Starting_Transition_14
;    P_Draw_Background_Constant Starting_Line_Blocks_13
;    jmpf    .Starting_Transition_Done
.Starting_Transition_14
    ld  b
    sub #14
    bnz .Starting_Transition_16
    P_Draw_Background_Constant Starting_Line_Blocks_14
    jmpf    .Starting_Transition_Done
;.Starting_Transition_15
;    ld  b
;    sub #15
;    bnz .Starting_Transition_16
;    P_Draw_Background_Constant Starting_Line_Blocks_15
;    jmpf    .Starting_Transition_Done
.Starting_Transition_16
    ld  b
    sub #16
    bnz .Starting_Transition_18
    P_Draw_Background_Constant Starting_Line_Blocks_16
    jmpf    .Starting_Transition_Done
;.Starting_Transition_17
;    ld  b
;    sub #17
;    bnz .Starting_Transition_18
;    P_Draw_Background_Constant Starting_Line_Blocks_17
;    jmpf    .Starting_Transition_Done
.Starting_Transition_18
    ld  b
    sub #18
    bnz .Starting_Transition_20
    P_Draw_Background_Constant Starting_Line_Blocks_18
    jmpf    .Starting_Transition_Done
;.Starting_Transition_19
;    ld  b
;    sub #19
;    bnz .Starting_Transition_20
;    P_Draw_Background_Constant Starting_Line_Blocks_19
;    jmpf    .Starting_Transition_Done
.Starting_Transition_20
    ld  b
    sub #20
    bnz .Starting_Transition_22
    P_Draw_Background_Constant Starting_Line_Blocks_20
    jmpf    .Starting_Transition_Done
;.Starting_Transition_21
;    ld  b
;    sub #21
;    bnz .Starting_Transition_22
;    P_Draw_Background_Constant Starting_Line_Blocks_21
;    jmpf    .Starting_Transition_Done
.Starting_Transition_22
    ld  b
    sub #22
    bnz .Starting_Transition_24
    P_Draw_Background_Constant Starting_Line_Blocks_22
    jmpf    .Starting_Transition_Done
;.Starting_Transition_23
;    ld  b
;    sub #23
;    bnz .Starting_Transition_24
;    P_Draw_Background_Constant Starting_Line_Blocks_23
;    jmpf    .Starting_Transition_Done
.Starting_Transition_24
    ld  b
    sub #24
    bnz .Starting_Transition_26
    P_Draw_Background_Constant Starting_Line_Blocks_24
    jmpf    .Starting_Transition_Done
;.Starting_Transition_25
;    ld  b
;    sub #25
;    bnz .Starting_Transition_26
;    P_Draw_Background_Constant Starting_Line_Blocks_25
;    jmpf    .Starting_Transition_Done
.Starting_Transition_26
    ld  b
    sub #26
    bnz .Starting_Transition_28
    P_Draw_Background_Constant Starting_Line_Blocks_26
    jmpf    .Starting_Transition_Done
;.Starting_Transition_27
;    ld  b
;    sub #27
;    bnz .Starting_Transition_28
;    P_Draw_Background_Constant Starting_Line_Blocks_27
;    jmpf    .Starting_Transition_Done
.Starting_Transition_28
    ld  b
    sub #28
    bnz .Starting_Transition_30
    P_Draw_Background_Constant Starting_Line_Blocks_28
    jmpf    .Starting_Transition_Done
;.Starting_Transition_29
;    ld  b
;    sub #29
;    bnz .Starting_Transition_30
;    P_Draw_Background_Constant Starting_Line_Blocks_29
;    jmpf    .Starting_Transition_Done
.Starting_Transition_30
    ld  b
    sub #30
    bnz .Starting_Transition_32
    P_Draw_Background_Constant Starting_Line_Blocks_30
    jmpf    .Starting_Transition_Done
;.Starting_Transition_31
;    ld  b
;    sub #31
;    bnz .Starting_Transition_32
;    P_Draw_Background_Constant Starting_Line_Blocks_31
;    jmpf    .Starting_Transition_Done
.Starting_Transition_32
    ld  b
    sub #32
    bnz .Starting_Transition_34
    P_Draw_Background_Constant Starting_Line_Blocks_32
    jmpf    .Starting_Transition_Done
;.Starting_Transition_33
;    ld  b
;    sub #33
;    bnz .Starting_Transition_34
;    P_Draw_Background_Constant Starting_Line_Blocks_33
;    jmpf    .Starting_Transition_Done
.Starting_Transition_34
    ld  b
    sub #34
    bnz .Starting_Transition_36
    P_Draw_Background_Constant Starting_Line_Blocks_34
    jmpf    .Starting_Transition_Done
;.Starting_Transition_35
;    ld  b
;    sub #35
;    bnz .Starting_Transition_36
;    P_Draw_Background_Constant Starting_Line_Blocks_35
;    jmpf    .Starting_Transition_Done
.Starting_Transition_36
    ld  b
    sub #36
    bnz .Starting_Transition_38
    P_Draw_Background_Constant Starting_Line_Blocks_36
    jmpf    .Starting_Transition_Done
;.Starting_Transition_37
;    ld  b
;    sub #37
;    bnz .Starting_Transition_38
;    P_Draw_Background_Constant Starting_Line_Blocks_37
;    jmpf    .Starting_Transition_Done
.Starting_Transition_38
    ld  b
    sub #38
    bnz .Starting_Transition_40
    P_Draw_Background_Constant Starting_Line_Blocks_38
    jmpf    .Starting_Transition_Done
;.Starting_Transition_39
;    ld  b
;    sub #39
;    bnz .Starting_Transition_40
;    P_Draw_Background_Constant Starting_Line_Blocks_39
;    jmpf    .Starting_Transition_Done
.Starting_Transition_40
    ld  b
    sub #40
    bnz .Starting_Transition_42
    P_Draw_Background_Constant Starting_Line_Blocks_40
    jmpf    .Starting_Transition_Done
;.Starting_Transition_41
;    ld  b
;    sub #41
;    bnz .Starting_Transition_42
;    P_Draw_Background_Constant Starting_Line_Blocks_41
;    jmpf    .Starting_Transition_Done
.Starting_Transition_42
    ld  b
    sub #42
    bnz .Starting_Transition_44
    P_Draw_Background_Constant Starting_Line_Blocks_42
    jmpf    .Starting_Transition_Done
;.Starting_Transition_43
;    ld  b
;    sub #43
;    bnz .Starting_Transition_44
;    P_Draw_Background_Constant Starting_Line_Blocks_43
;    jmpf    .Starting_Transition_Done
.Starting_Transition_44
    ld  b
    sub #44
    bnz .Starting_Transition_46
    P_Draw_Background_Constant Starting_Line_Blocks_44
    jmpf    .Starting_Transition_Done
;.Starting_Transition_45
;    ld  b
;    sub #45
;    bnz .Starting_Transition_46
;    P_Draw_Background_Constant Starting_Line_Blocks_45
;    jmpf    .Starting_Transition_Done
.Starting_Transition_46
    ld  b
    sub #46
    bnz .Starting_Transition_48
    P_Draw_Background_Constant Starting_Line_Blocks_46
    jmpf    .Starting_Transition_Done
;.Starting_Transition_47
;    ld  b
;    sub #47 ;#147
;    bnz .Starting_Transition_Done
;    P_Draw_Background_Constant Starting_Line_Blocks_47
;    jmpf    .Starting_Transition_Done
.Starting_Transition_48
    ld  b
    sub #48
    bnz .Starting_Transition_50
    P_Draw_Background_Constant Starting_Line_Blocks_48
    jmpf    .Starting_Transition_Done
.Starting_Transition_50
    ld  b
    sub #50
    bnz .Starting_Transition_52
    P_Draw_Background_Constant Starting_Line_Blocks_50
    jmpf    .Starting_Transition_Done
.Starting_Transition_52
    ld  b
    sub #52
    bnz .Starting_Transition_54
    P_Draw_Background_Constant Starting_Line_Blocks_52
    jmpf    .Starting_Transition_Done
.Starting_Transition_54
    ld  b
    sub #54
    bnz .Starting_Transition_56
    P_Draw_Background_Constant Starting_Line_Blocks_54
    jmpf    .Starting_Transition_Done
.Starting_Transition_56
    ld  b
    sub #56
    bnz .Starting_Transition_58
    P_Draw_Background_Constant Starting_Line_Blocks_56
    jmpf    .Starting_Transition_Done
.Starting_Transition_58
    ld  b
    sub #58
    bnz .Starting_Transition_60
    P_Draw_Background_Constant Starting_Line_Blocks_58
    jmpf    .Starting_Transition_Done
.Starting_Transition_60
    ld  b
    sub #60
    bnz .Starting_Transition_62
    P_Draw_Background_Constant Starting_Line_Blocks_60
    jmpf    .Starting_Transition_Done
.Starting_Transition_62
    ld  b
    sub #62
    bnz .Starting_Transition_64
    P_Draw_Background_Constant Starting_Line_Blocks_62
    jmpf    .Starting_Transition_Done
.Starting_Transition_64
    ld  b
    sub #64
    bnz .Starting_Transition_66
    P_Draw_Background_Constant Starting_Line_Blocks_64
    jmpf    .Starting_Transition_Done
.Starting_Transition_66
    ld  b
    sub #66
    bnz .Starting_Transition_68
    P_Draw_Background_Constant Starting_Line_Blocks_66
    jmpf    .Starting_Transition_Done
.Starting_Transition_68
    ld  b
    sub #68
    bnz .Starting_Transition_70
    P_Draw_Background_Constant Starting_Line_Blocks_68
    jmpf    .Starting_Transition_Done
.Starting_Transition_70
    ld  b
    sub #70
    bnz .Starting_Transition_72
    P_Draw_Background_Constant Starting_Line_Blocks_70
    jmpf    .Starting_Transition_Done
.Starting_Transition_72
    ld  b
    sub #72
    bnz .Starting_Transition_74
    P_Draw_Background_Constant Starting_Line_Blocks_72
    jmpf    .Starting_Transition_Done
.Starting_Transition_74
    ld  b
    sub #74
    bnz .Starting_Transition_76
    P_Draw_Background_Constant Starting_Line_Blocks_74
    jmpf    .Starting_Transition_Done
.Starting_Transition_76
    ld  b
    sub #76
    bnz .Starting_Transition_78
    P_Draw_Background_Constant Starting_Line_Blocks_76
    jmpf    .Starting_Transition_Done
.Starting_Transition_78
    ld  b
    sub #78
    bnz .Starting_Transition_80
    P_Draw_Background_Constant Starting_Line_Blocks_78
    jmpf    .Starting_Transition_Done
.Starting_Transition_80
    ld  b
    sub #80
    bnz .Starting_Transition_82
    P_Draw_Background_Constant Starting_Line_Blocks_80
    jmpf    .Starting_Transition_Done
.Starting_Transition_82
    ld  b
    sub #82
    bnz .Starting_Transition_84
    P_Draw_Background_Constant Starting_Line_Blocks_82
    jmpf    .Starting_Transition_Done
.Starting_Transition_84
    ld  b
    sub #84
    bnz .Starting_Transition_86
    P_Draw_Background_Constant Starting_Line_Blocks_84
    jmpf    .Starting_Transition_Done
.Starting_Transition_86
    ld  b
    sub #86
    bnz .Starting_Transition_88
    P_Draw_Background_Constant Starting_Line_Blocks_86
    jmpf    .Starting_Transition_Done
.Starting_Transition_88
    ld  b
    sub #88
    bnz .Starting_Transition_90
    P_Draw_Background_Constant Starting_Line_Blocks_88
    jmpf    .Starting_Transition_Done
.Starting_Transition_90
    ld  b
    sub #90
    bnz .Starting_Transition_92
    P_Draw_Background_Constant Starting_Line_Blocks_90
    jmpf    .Starting_Transition_Done
.Starting_Transition_92
    ld  b
    sub #92
    bnz .Starting_Transition_94
    P_Draw_Background_Constant Starting_Line_Blocks_92
    jmpf    .Starting_Transition_Done
.Starting_Transition_94
    ld  b
    sub #94
    bnz .Starting_Transition_96
    P_Draw_Background_Constant Starting_Line_Blocks_94
    jmpf    .Starting_Transition_Done
.Starting_Transition_96
    ld  b
    sub #96
    bnz .Starting_Transition_Done
    P_Draw_Background_Constant Starting_Line_Blocks_96
    jmpf    .Starting_Transition_Done
.Starting_Transition_Done
    ret

%macro  P_Draw_Road_Transition_Normal_To_Icy %bgstep
    ld  %bgstep
    st  b
    bn  b, 0, .Skip_EvenNumber_NormalToIcy
    dec b
.Skip_EvenNumber_NormalToIcy
    callf   _P_Draw_Road_Transition_Normal_To_Icy
%end

_P_Draw_Road_Transition_Normal_To_Icy:
.Transition_Normal_To_Icy_0
    ld  b
    bnz .Transition_Normal_To_Icy_2
    P_Draw_Background_Constant Transition_Normal_To_Icy_0
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_2    
    ld  b
    sub #2
    bnz .Transition_Normal_To_Icy_4
    P_Draw_Background_Constant Transition_Normal_To_Icy_2
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_4
    ld  b
    sub #4
    bnz .Transition_Normal_To_Icy_6
    P_Draw_Background_Constant Transition_Normal_To_Icy_4
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_6
    ld  b
    sub #6
    bnz .Transition_Normal_To_Icy_8
    P_Draw_Background_Constant Transition_Normal_To_Icy_6
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_8
    ld  b
    sub #8
    bnz .Transition_Normal_To_Icy_10
    P_Draw_Background_Constant Transition_Normal_To_Icy_8
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_10
    ld  b
    sub #10
    bnz .Transition_Normal_To_Icy_12
    P_Draw_Background_Constant Transition_Normal_To_Icy_10
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_12
    ld  b
    sub #12
    bnz .Transition_Normal_To_Icy_14
    P_Draw_Background_Constant Transition_Normal_To_Icy_12
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_14
    ld  b
    sub #14
    bnz .Transition_Normal_To_Icy_16
    P_Draw_Background_Constant Transition_Normal_To_Icy_14
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_16
    ld  b
    sub #16
    bnz .Transition_Normal_To_Icy_18
    P_Draw_Background_Constant Transition_Normal_To_Icy_16
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_18
    ld  b
    sub #18
    bnz .Transition_Normal_To_Icy_20
    P_Draw_Background_Constant Transition_Normal_To_Icy_18
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_20
    ld  b
    sub #20
    bnz .Transition_Normal_To_Icy_22
    P_Draw_Background_Constant Transition_Normal_To_Icy_20
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_22
    ld  b
    sub #22
    bnz .Transition_Normal_To_Icy_24
    P_Draw_Background_Constant Transition_Normal_To_Icy_22
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_24
    ld  b
    sub #24
    bnz .Transition_Normal_To_Icy_26
    P_Draw_Background_Constant Transition_Normal_To_Icy_24
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_26
    ld  b
    sub #26
    bnz .Transition_Normal_To_Icy_28
    P_Draw_Background_Constant Transition_Normal_To_Icy_26
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_28
    ld  b
    sub #28
    bnz .Transition_Normal_To_Icy_30
    P_Draw_Background_Constant Transition_Normal_To_Icy_28
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_30
    ld  b
    sub #30
    bnz .Transition_Normal_To_Icy_32
    P_Draw_Background_Constant Transition_Normal_To_Icy_30
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_32
    ld  b
    sub #32
    bnz .Transition_Normal_To_Icy_34
    P_Draw_Background_Constant Transition_Normal_To_Icy_32
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_34
    ld  b
    sub #34
    bnz .Transition_Normal_To_Icy_36
    P_Draw_Background_Constant Transition_Normal_To_Icy_34
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_36
    ld  b
    sub #36
    bnz .Transition_Normal_To_Icy_38
    P_Draw_Background_Constant Transition_Normal_To_Icy_36
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_38
    ld  b
    sub #38
    bnz .Transition_Normal_To_Icy_40
    P_Draw_Background_Constant Transition_Normal_To_Icy_38
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_40
    ld  b
    sub #40
    bnz .Transition_Normal_To_Icy_42
    P_Draw_Background_Constant Transition_Normal_To_Icy_40
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_42
    ld  b
    sub #42
    bnz .Transition_Normal_To_Icy_44
    P_Draw_Background_Constant Transition_Normal_To_Icy_42
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_44
    ld  b
    sub #44
    bnz .Transition_Normal_To_Icy_46
    P_Draw_Background_Constant Transition_Normal_To_Icy_44
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_46
    ld  b
    sub #46
    bnz .Transition_Normal_To_Icy_48
    P_Draw_Background_Constant Transition_Normal_To_Icy_46
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_48
    ld  b
    sub #48
    bnz .Transition_Normal_To_Icy_Done
    P_Draw_Background_Constant Transition_Normal_To_Icy_48
    jmpf    .Transition_Normal_To_Icy_Done
.Transition_Normal_To_Icy_Done
    ret

%macro  P_Draw_Road_Transition_Icy_To_Normal %bgstep
    ld  %bgstep
    st  b
    bn  b, 0, .Skip_EvenNumber_Icy_To_Normal
    dec b
.Skip_EvenNumber_Icy_To_Normal
    callf   _P_Draw_Road_Transition_Icy_To_Normal
%end

_P_Draw_Road_Transition_Icy_To_Normal:
.Transition_Icy_To_Normal_0
    ld  b
    bnz .Transition_Icy_To_Normal_2
    P_Draw_Background_Constant Transition_Icy_To_Normal_0
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_2    
    ld  b
    sub #2
    bnz .Transition_Icy_To_Normal_4
    P_Draw_Background_Constant Transition_Icy_To_Normal_2
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_4
    ld  b
    sub #4
    bnz .Transition_Icy_To_Normal_6
    P_Draw_Background_Constant Transition_Icy_To_Normal_4
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_6
    ld  b
    sub #6
    bnz .Transition_Icy_To_Normal_8
    P_Draw_Background_Constant Transition_Icy_To_Normal_6
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_8
    ld  b
    sub #8
    bnz .Transition_Icy_To_Normal_10
    P_Draw_Background_Constant Transition_Icy_To_Normal_8
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_10
    ld  b
    sub #10
    bnz .Transition_Icy_To_Normal_12
    P_Draw_Background_Constant Transition_Icy_To_Normal_10
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_12
    ld  b
    sub #12
    bnz .Transition_Icy_To_Normal_14
    P_Draw_Background_Constant Transition_Icy_To_Normal_12
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_14
    ld  b
    sub #14
    bnz .Transition_Icy_To_Normal_16
    P_Draw_Background_Constant Transition_Icy_To_Normal_14
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_16
    ld  b
    sub #16
    bnz .Transition_Icy_To_Normal_18
    P_Draw_Background_Constant Transition_Icy_To_Normal_16
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_18
    ld  b
    sub #18
    bnz .Transition_Icy_To_Normal_20
    P_Draw_Background_Constant Transition_Icy_To_Normal_18
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_20
    ld  b
    sub #20
    bnz .Transition_Icy_To_Normal_22
    P_Draw_Background_Constant Transition_Icy_To_Normal_20
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_22
    ld  b
    sub #22
    bnz .Transition_Icy_To_Normal_24
    P_Draw_Background_Constant Transition_Icy_To_Normal_22
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_24
    ld  b
    sub #24
    bnz .Transition_Icy_To_Normal_26
    P_Draw_Background_Constant Transition_Icy_To_Normal_24
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_26
    ld  b
    sub #26
    bnz .Transition_Icy_To_Normal_28
    P_Draw_Background_Constant Transition_Icy_To_Normal_26
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_28
    ld  b
    sub #28
    bnz .Transition_Icy_To_Normal_30
    P_Draw_Background_Constant Transition_Icy_To_Normal_28
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_30
    ld  b
    sub #30
    bnz .Transition_Icy_To_Normal_32
    P_Draw_Background_Constant Transition_Icy_To_Normal_30
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_32
    ld  b
    sub #32
    bnz .Transition_Icy_To_Normal_34
    P_Draw_Background_Constant Transition_Icy_To_Normal_32
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_34
    ld  b
    sub #34
    bnz .Transition_Icy_To_Normal_36
    P_Draw_Background_Constant Transition_Icy_To_Normal_34
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_36
    ld  b
    sub #36
    bnz .Transition_Icy_To_Normal_38
    P_Draw_Background_Constant Transition_Icy_To_Normal_36
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_38
    ld  b
    sub #38
    bnz .Transition_Icy_To_Normal_40
    P_Draw_Background_Constant Transition_Icy_To_Normal_38
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_40
    ld  b
    sub #40
    bnz .Transition_Icy_To_Normal_42
    P_Draw_Background_Constant Transition_Icy_To_Normal_40
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_42
    ld  b
    sub #42
    bnz .Transition_Icy_To_Normal_44
    P_Draw_Background_Constant Transition_Icy_To_Normal_42
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_44
    ld  b
    sub #44
    bnz .Transition_Icy_To_Normal_46
    P_Draw_Background_Constant Transition_Icy_To_Normal_44
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_46
    ld  b
    sub #46
    bnz .Transition_Icy_To_Normal_48
    P_Draw_Background_Constant Transition_Icy_To_Normal_46
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_48
    ld  b
    sub #48
    bnz .Transition_Icy_To_Normal_Done
    P_Draw_Background_Constant Transition_Icy_To_Normal_48
    jmpf    .Transition_Icy_To_Normal_Done
.Transition_Icy_To_Normal_Done
    ret

; WIP Animations Done

_P_Set_Road_Texture:
.draw_roadline_0
    ld  p_spr_flag
	; bp	acc, 2, .draw_roadline_4a
	bnz .draw_roadline_1
	mov	#<RoadTexture_Step0, trl
	mov	#>RoadTexture_Step0, trh
	jmpf	.draw_roadline_4
.draw_roadline_1
    ld  p_spr_flag
    sub #1
	bnz .draw_roadline_2
	mov	#<RoadTexture_Step1, trl
	mov	#>RoadTexture_Step1, trh
	jmpf	.draw_roadline_4
.draw_roadline_2
    ld  p_spr_flag
    sub #2
	bnz .draw_roadline_3
	mov	#<RoadTexture_Step2, trl
	mov	#>RoadTexture_Step2, trh
	jmpf	.draw_roadline_4
.draw_roadline_3
    ld  p_spr_flag
    sub #3
	bnz .draw_roadline_4a
	mov	#<RoadTexture_Step3, trl
	mov	#>RoadTexture_Step3, trh
	jmpf	.draw_roadline_4
.draw_roadline_4a
    ld  p_spr_flag
    sub #4
	bnz .draw_roadline_5
	mov	#<RoadTexture_Step4, trl
	mov	#>RoadTexture_Step4, trh
	jmpf	.draw_roadline_4
.draw_roadline_5
    ld  p_spr_flag
    sub #5
	bnz .draw_roadline_6
	mov	#<RoadTexture_Step5, trl
	mov	#>RoadTexture_Step6, trh
	jmpf	.draw_roadline_4
.draw_roadline_6
    ld  p_spr_flag
    sub #6
	bnz .draw_roadline_7
	mov	#<RoadTexture_Step6, trl
	mov	#>RoadTexture_Step6, trh
	jmpf	.draw_roadline_4
.draw_roadline_7
    ld  p_spr_flag
    sub #7
	bnz .draw_roadline_4
	mov	#<RoadTexture_Step7, trl
	mov	#>RoadTexture_Step7, trh
.draw_roadline_4
    ret

%macro  P_Draw_Digit %number, %startingypos
; .drawthree
    ; ld  %number
    ; sub #3
    ; bnz .drawfour
    ; mov #<Number_3, trl
    ; mov #>Number_3, trh
    ; jmpf .start_drawing_da_digit
; .drawfour
    mov #<Number_4, trl
    mov #>Number_4, trh
; .start_drawing_da_digit
    ; mov #<AllBlack, trl
    ; mov #>AllBlack, trh
    ; ld  %startingyposition
    ; st  c
        clr1    ocr, 5
        ; Prepare the frame buffer address
        mov     #P_WRAM_BANK, vrmad2
        mov     #P_WRAM_ADDR, vrmad1
        mov     #%00010000, vsel
    mov     #0, c ; #30, c ; mov #24, c
    ld  %startingypos
    st  c
    callf   _P_Draw_Digit
    ; mov #24, c; #30, c
    ; inc P_WRAM_ADDR
    ; dec vrmad1
    ; inc vrmad1
    ; inc vrmad1
    ; inc vrmad1
    ; inc vrmad1
    ; inc vrmad1
        ; mov     #P_WRAM_ADDR, vrmad2
        ; mov     #24, vrmad2
    ; callf   _P_Draw_Digit
    ; mov #48, c; #60, c
        ; mov     #48, vrmad2
    ; dec vrmad1
    ; inc vrmad1
    ; inc vrmad1
    ; inc vrmad1
    ; inc vrmad1
    ; inc vrmad1
    ; callf   _P_Draw_Digit
%end

%macro P_Draw_Score_Timer %tenthousands, %thousands, %hundreds, %tens, %ones
    clr1    ocr, 5
        ;; Prepare the frame buffer address ; Commented Out, 8/21, For % Macro ([P_])Draw_HUD.
        ;mov     #P_WRAM_BANK, vrmad2
        ;mov     #P_WRAM_ADDR, vrmad1
        ;mov     #%00010000, vsel
    ld  %ones
    callf Set_Digit
    ; mov #0, acc
    ; mov #0, b
    mov #48, c
    callf   _P_Draw_Digit
    ; callf   _P_Draw_Chunk
    ld  %tens
    callf Set_Digit
    mov #72, c
    callf   _P_Draw_Digit
    ; callf   _P_Draw_Chunk
    ld  %hundreds
    callf Set_Digit
    mov #96, c
    callf   _P_Draw_Digit
    ; callf   _P_Draw_Chunk
    ld  %thousands
    callf Set_Digit
    mov #120, c
    callf   _P_Draw_Digit
    ; callf   _P_Draw_Chunk
    ld  %tenthousands
    callf Set_Digit
    ; mov #144, c               ;
    ; callf   _P_Draw_Digit     ; Moving/Commenting Out  This, And Adding The Below Paragraph, To Test Gear Marker.
    ;; callf   _P_Draw_Chunk    ;
    
     mov     #<HUD_Spacer, trl
        mov     #>HUD_Spacer, trh
        callf   _P_Draw_Chunk
        ld  c
        add #6
        st  c
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
     mov     #<AllBlack, trl
        mov     #>AllBlack, trh
        callf   _P_Draw_Chunk
        ld  c
        add #6
        st  c
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1

    set1    ocr, 5
%end

%macro P_Draw_Score_Lives %tenthousands, %thousands, %hundreds, %tens, %ones
    clr1    ocr, 5
        ;; Prepare the frame buffer address ; Commented Out, 8/21, For % Macro ([P_])Draw_HUD.
        ;mov     #P_WRAM_BANK, vrmad2
        ;mov     #P_WRAM_ADDR, vrmad1
        ;mov     #%00010000, vsel
    ld  %ones
    callf Set_Digit
    ; mov #0, acc
    ; mov #0, b
    mov #24, c
    callf   _P_Draw_Digit
    ; callf   _P_Draw_Chunk
    ld  %tens
    callf Set_Digit
    mov #48, c
    callf   _P_Draw_Digit
    ; callf   _P_Draw_Chunk
    ld  %hundreds
    callf Set_Digit
    mov #72, c
    callf   _P_Draw_Digit
    ; callf   _P_Draw_Chunk
    ld  %thousands
    callf Set_Digit
    mov #96, c
    callf   _P_Draw_Digit
    ; callf   _P_Draw_Chunk
    ld  %tenthousands
    callf Set_Digit
    mov #120, c
    callf   _P_Draw_Digit
    ;callf   _P_Draw_Chunk ; Re-Uncomment This To Move The Gear Marker Down/Right A Chunk.
    
     mov     #<HUD_Spacer, trl
        mov     #>HUD_Spacer, trh
        callf   _P_Draw_Chunk
        ld  c
        add #6
        st  c
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
     mov     #<AllBlack, trl
        mov     #>AllBlack, trh
        callf   _P_Draw_Chunk
        ld  c
        add #6
        st  c
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1

    set1    ocr, 5
%end

%macro P_Draw_HUD_Banner    %HUD_Banner_Number
    ld  %HUD_Banner_Number
    st  b
    callf   _P_Draw_HUD_Banner
%end

_P_Draw_HUD_Banner:
.Draw_3LivesBanner
    ld  b
    bnz .Draw_2LivesBanner
    mov     #<ThreeCarsLeft, trl
    mov     #>ThreeCarsLeft, trh
    jmpf    .Draw_Finalized_Banner
.Draw_2LivesBanner
    sub #1
    bnz .Draw_1LivesBanner
    ;mov     #<AllBlack, trl
    mov     #<TwoCarsLeft, trl
    ;mov     #>AllBlack, trh
    mov     #>TwoCarsLeft, trh
    jmpf    .Draw_Finalized_Banner
.Draw_1LivesBanner
    sub #1
    bnz .Draw_Icy_Banner ; .Draw_Finalized_Banner
    mov     #<OneCarLeft, trl
    mov     #>OneCarLeft, trh
    jmpf    .Draw_Finalized_Banner
.Draw_Icy_Banner
    sub #1
    bnz .Draw_Bridge_Banner
    mov     #<Icy_Banner, trl
    mov     #>Icy_Banner, trh
.Draw_Bridge_Banner
    sub #1
    bnz .Draw_Ambulance_Banner
    mov     #<Bridge_Banner, trl
    mov     #>Bridge_Banner, trh
    jmpf    .Draw_Finalized_Banner
.Draw_Ambulance_Banner
    sub #1
    bnz .Draw_Finalized_Banner
    mov     #<Ambulance_Banner, trl
    mov     #>Ambulance_Banner, trh
    jmpf    .Draw_Finalized_Banner
.Draw_Finalized_Banner
    clr1    ocr, 5
    ; #0, p_spr_flag(s)
    mov     #P_WRAM_BANK, vrmad2
    mov     #P_WRAM_ADDR, vrmad1
    mov     #%00010000, vsel
    mov #0, b
    mov #0, acc
    .Draw_HUD_Banner_Loop
    callf   _P_Draw_Chunk
    ld  c
    add #6
    st  c
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1
    ld  c
    sub #240
    bnz .Draw_HUD_Banner_Loop
    set1    ocr, 5
    ret

%macro  P_Draw_Ambulance_Banner %AmbulanceFrameNumber
    ld  %AmbulanceFrameNumber
    st  b
    callf   _P_Draw_Ambulance_Banner
%end

_P_Draw_Ambulance_Banner:
.AmbulanceBanner_Frame0
    ld  b
    bnz .AmbulanceBanner_Frame1
    mov     #<ThreeCarsLeft, trl
    mov     #>ThreeCarsLeft, trh
    jmpf    .Draw_Finalized_Ambulance_Banner
.AmbulanceBanner_Frame1
    sub #1
    bnz .AmbulanceBanner_Frame2
    ;mov     #<AllBlack, trl
    mov     #<TwoCarsLeft, trl
    ;mov     #>AllBlack, trh
    mov     #>TwoCarsLeft, trh
    jmpf    .Draw_Finalized_Ambulance_Banner
.AmbulanceBanner_Frame2
    sub #1
    bnz .AmbulanceBanner_Frame3
    mov     #<OneCarLeft, trl
    mov     #>OneCarLeft, trh
    jmpf    .Draw_Finalized_Ambulance_Banner
.AmbulanceBanner_Frame3
    sub #1
    bnz .AmbulanceBanner_Frame4
    mov     #<Icy_Banner, trl
    mov     #>Icy_Banner, trh
    jmpf    .Draw_Finalized_Ambulance_Banner
.AmbulanceBanner_Frame4
    sub #1
    bnz .AmbulanceBanner_Frame5
    mov     #<Ambulance_Banner, trl
    mov     #>Ambulance_Banner, trh
    jmpf    .Draw_Finalized_Ambulance_Banner
.AmbulanceBanner_Frame5

.Draw_Finalized_Ambulance_Banner
    clr1    ocr, 5
    ; #0, p_spr_flag(s)
    mov     #P_WRAM_BANK, vrmad2
    mov     #P_WRAM_ADDR, vrmad1
    mov     #%00010000, vsel
    mov #0, b
    mov #0, acc
    .Draw_Ambulance_Banner_Loop
    callf   _P_Draw_Chunk
    ld  c
    add #6
    st  c
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1
    ld  c
    sub #240
    bnz .Draw_Ambulance_Banner_Loop
    set1    ocr, 5
    ret

Set_Digit:
    ld  acc
.digit_0 
    bnz .digit_1
    mov #<Number_0, trl
    mov #>Number_0, trh
    ret
.digit_1
    sub #1 ; ld  acc
    bnz .digit_2
    mov #<Number_1, trl
    mov #>Number_1, trh
    ret
.digit_2
    sub #1
    bnz .digit_3
    mov #<Number_2, trl
    mov #>Number_2, trh
    ret
.digit_3
    sub #1
    bnz .digit_4
    mov #<Number_3, trl
    mov #>Number_3, trh
    ret
.digit_4
    sub #1
    bnz .digit_5
    mov #<Number_4, trl
    mov #>Number_4, trh
    ret
.digit_5
    sub #1
    bnz .digit_6
    mov #<Number_5, trl
    mov #>Number_5, trh
    ret
.digit_6
    sub #1
    bnz .digit_7
    mov #<Number_6, trl
    mov #>Number_6, trh
    ret
.digit_7
    sub #1
    bnz .digit_8
    mov #<Number_7, trl
    mov #>Number_7, trh
    ret
.digit_8
    sub #1
    bnz .digit_9
    mov #<Number_8, trl
    mov #>Number_8, trh
    ret
.digit_9
    sub #1
    ; bnz .done_setting_digit
    mov #<Number_9, trl
    mov #>Number_9, trh
    ret

Set_Digit_Inverted:
    ld  acc
.digit_0 
    bnz .digit_1
    mov #<Number_0b, trl
    mov #>Number_0b, trh
    ret
.digit_1
    sub #1 ; ld  acc
    bnz .digit_2
    mov #<Number_1b, trl
    mov #>Number_1b, trh
    ret
.digit_2
    sub #1
    bnz .digit_3
    mov #<Number_2b, trl
    mov #>Number_2b, trh
    ret
.digit_3
    sub #1
    bnz .digit_4
    mov #<Number_3b, trl
    mov #>Number_3b, trh
    ret
.digit_4
    sub #1
    bnz .digit_5
    mov #<Number_4b, trl
    mov #>Number_4b, trh
    ret
.digit_5
    sub #1
    bnz .digit_6
    mov #<Number_5b, trl
    mov #>Number_5b, trh
    ret
.digit_6
    sub #1
    bnz .digit_7
    mov #<Number_6b, trl
    mov #>Number_6b, trh
    ret
.digit_7
    sub #1
    bnz .digit_8
    mov #<Number_7b, trl
    mov #>Number_7b, trh
    ret
.digit_8
    sub #1
    bnz .digit_9
    mov #<Number_8b, trl
    mov #>Number_8b, trh
    ret
.digit_9
    sub #1
    mov #<Number_9b, trl
    mov #>Number_9b, trh
    ret

%macro P_Draw_Timer %timerOnes, %timerTens
    clr1    ocr, 5    
        ;mov     #<AllBlack, trl
        ;mov     #>AllBlack, trh
        ;callf   _P_Draw_Chunk
        ;ld  c
        ;add #6
        ;st  c
        ;inc vrmad1
        ;inc vrmad1
        ;inc vrmad1
        ;inc vrmad1
        ;inc vrmad1
        ;mov #0, acc
        ;mov #0, c
    ld  %timerOnes
    callf Set_Digit_Inverted
    mov #0, acc
    mov #0, c
    callf   _P_Draw_Digit
    ld  %timerTens
    callf Set_Digit_Inverted 
    mov #24, c
    callf   _P_Draw_Digit
        
        mov     #<AllBlack, trl
        mov     #>AllBlack, trh
        callf   _P_Draw_Chunk
        ld  c
        add #6
        st  c
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
    set1    ocr, 5
%end

%macro  P_Draw_Lives    %livesNum    
    mov     #<AllBlack, trl
    mov     #>AllBlack, trh
    callf   _P_Draw_Chunk
    ld  c
    add #6
    st  c
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1

    callf   _P_Draw_Chunk
    ld  c
    add #6
    st  c
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1

    ld  %livesNum
.LifeNumber0
    bnz .LifeNumber1
    mov     #<AllBlack, trl
    mov     #>AllBlack, trh
    jmpf    .LifeNumberSet
.LifeNumber1
    sub #1
    bnz .LifeNumber2
    mov     #<Lives_Counter_1, trl
    mov     #>Lives_Counter_1, trh
    jmpf    .LifeNumberSet
.LifeNumber2
    sub #1
    bnz .LifeNumber3
    mov     #<Lives_Counter_2, trl
    mov     #>Lives_Counter_2, trh
    jmpf    .LifeNumberSet
.LifeNumber3
    sub #1
    bnz .LifeNumberSet
    mov     #<Lives_Counter_3, trl
    mov     #>Lives_Counter_3, trh
.LifeNumberSet
    callf   _P_Draw_Chunk
    ld  c
    add #6
    st  c
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1

    mov     #<AllBlack, trl
    mov     #>AllBlack, trh
    callf   _P_Draw_Chunk
    ld  c
    add #6
    st  c
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1

    callf   _P_Draw_Chunk
    ld  c
    add #6
    st  c
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1
    inc vrmad1
%end

%macro P_Draw_Gear_Marker
    clr1    ocr, 5
     ; Prepare the frame buffer address
     ;   mov     #P_WRAM_BANK, vrmad2
     ;   mov     #P_WRAM_ADDR, vrmad1
     ;   mov     #%00010000, vsel
    ; ld   vrmad1 ; fFix This By Having A Selector For Draw Score (Or Draw HUD), To Decide Which To Draw And Draw It At The Right Place, With Timer/4 Digits Vs./Or Lives Counter/5 Digits.
    ; sub     #18
    ; st  vrmad1
    ; mov     #144, c
    callf   _P_Draw_Chunk
        ld  c
        add #6
        st  c
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
    callf   _P_Draw_Chunk
        ld  c
        add #6
        st  c
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
    callf   _P_Draw_Chunk
        ld  c
        add #6
        st  c
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
    callf   _P_Draw_Chunk
        ld  c
        add #6
        st  c
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
    callf   _P_Draw_Chunk
        ld  c
        add #6
        st  c
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
        inc vrmad1
    set1    ocr, 5
%end


;	===========================