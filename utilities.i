;-------------------------------------------------------------------------------
; Useful definitions
;-------------------------------------------------------------------------------
;DPAD_UP EQU 0
;DPAD_DOWN EQU 1
;DPAD_LEFT EQU 2
;DPAD_RIGHT EQU 3
;BUTTON_A EQU 4
;BUTTON_B EQU 5

LCD_CHUNK_SELECTOR EQU 2

;-------------------------------------------------------------------------------
; Clear screen routine
;-------------------------------------------------------------------------------
clear_screen:
       clr1 ocr,5

       push acc
       push xbnk
       push 2

       mov #0,xbnk
.cbank:
       mov #$80,2
.cloop:
       mov #0,@R2

       inc 2

       ld 2
       and #$f
       bne #$c,.cskip

       ld 2
       add #4
       st 2
.cskip:
       ld 2
       bnz .cloop

       bp xbnk,0,.cexit

       mov #1,xbnk
       br .cbank
.cexit:
       pop 2
       pop xbnk
       pop acc
       ;set1 ocr,5
       ret
	   
;-------------------------------------------------------------------------------
; Scan controller, returning what's pressed
; 
; Output: 
;	Key code in acc
;-------------------------------------------------------------------------------
;read_input:
;	bp p7,0,quit	;Quit, if Dreamcast Connection
;	ld p3			;read key status
;	ret				;otherwise return with pressed key in ACC
;quit:
;	jmp goodbye
;-------------------------------------------------------------------------------
; Plot a pixel
; Input:
;	b - row
;   c - column
;-------------------------------------------------------------------------------
put_pixel:
	push b
	push c
	push acc
	mov #0, xbnk			; bank 0 for rows 0-15, bank 1 for rows 16-31
	
	ld b
	clr1 psw,cy
	rorc
	clr1 psw,cy
	rorc
	clr1 psw,cy
	rorc
	clr1 psw,cy
	rorc
	clr1 psw,cy
	bz putpixel_bank_ok		; if( b div 16 == 0 ) then goto putpixel_bank_ok

	mov #1, xbnk 			; since row >= 16, we use bank 1
	ld b
	sub #16
	st b					; b := b - 16
	
putpixel_bank_ok:
	push b
	push c
	push c
	push b
	clr1 ocr, 5

	; screen resolution is 48x32
	; each chunk has 8 pixels
	; there are 6*32 chunks (6 on each line, 32 lines)
	
	; multiply row by 6 to get the number of the first chunk in the row
	; where we will draw the pixel
	mov #0, acc
	mov #6, c
	mul						; [b:acc:c] = [acc:c] * b
	
	; since row is between 0 and 31, the result of multiplication by 6
	; only requires the lower byte, which ends up in register c after the
	; multiplication
	
	pop acc					; acc := b
	
	; the LCD_CHUNK_SELECTOR maps chunk number to LCD like so:
	;  0  1  2  3  4  5       <---- first LCD line (6 * 8 = 48 pixels)
	;  6  7  8  9  A  B       <---- second LCD line
	; 10 11 12 13 14 15       <---- third line
	; 16 17 18 19 1A 1B       <---- fourth line
	;                               and so on
	; It's important to note that last 4 of every 16 chunks are offscreen 
	
	; now, for every two rows, we must add 4 to the chunk number, 
	; to account for the 4 offscreen chunks					; 
	clr1 psw,cy
	rorc					; acc := b div 2
	clr1 psw,cy				; clear CY flag to discard rotated bit
	rolc					;
	clr1 psw,cy
	rolc					; acc := acc * 4 (the offscreen adjustment)
	clr1 psw,cy
	add c					; acc := (row * 6) + offscreen adjustment
							; (basically contains the number of first chunk
							; on the row where we'll put the pixel )
	
	pop c					; c now contains the column argument
	push acc
	; now calculate the correct chunk on this row where we will put the pixel
	mov #0, acc				
	mov #8, b				
	div						; [acc:c] := [acc:c] div b
							; b := [acc:c] mod b
	
	; b now contains a value between 0 and 7
	; corresponding to the bit which has to be set in the byte we'll write to LCD
	pop acc
	add c					; acc now contains correct chunk to set
	
	add #$80				; 0x80 is the first chunk (top left of screen)
							; 0x81 the second (next 8 pixels to the right), and so on
	st LCD_CHUNK_SELECTOR
	
	; set the correct bit for our pixel, in a byte which will be written to LCD
	; we do this by shifting a 1 as many places as the value in register b
	mov #%10000000, acc
putpixel_shift:
	push acc
	ld b
	bz putpixel_shift_done	; if b == 0 then we are done shifting our bit
	pop acc
	clr1 psw,cy
	rorc					
	clr1 psw,cy
	
	dec b
	br putpixel_shift
putpixel_shift_done:
	pop acc					; we missed the pop right after the bz, so do it here
	; acc now contains the proper byte we have to write to get our pixel

	or @R2					; this accumulates pixels, so that the zeroes we
							; write along with the 1 don't erase existing pixels
	
	st @R2					; write accumulated (on-screen + our new pixel) pixels
							; to the LCD
	;set1 ocr,5
	
	pop c
	pop b
	
	pop acc
	pop c
	pop b
	ret

;-------------------------------------------------------------------------------
; Draw a full screen image
; VMU resolution is 48x36 - 32 lines with 6 bytes (48 pixel) per line
;
; Input:
;	th - high byte of image address
;   tl - low byte of image address
;-------------------------------------------------------------------------------
draw_full_screen:
       clr1 ocr, 5		; clear bit 5 in ocr
       push acc
       push xbnk

       push c
       push LCD_CHUNK_SELECTOR
       mov #$80, LCD_CHUNK_SELECTOR ; LCD_CHUNK_SELECTOR := 0x80

       xor acc			; acc := 0
       st xbnk			; xbnk := 0
       st c				; c := acc
.sloop:
       ldc				; acc := value at address ( TH:TL + acc )
       st @R2			; write acc to LCD frame buffer

       inc LCD_CHUNK_SELECTOR

       ld LCD_CHUNK_SELECTOR		; 
       and #$f				;
       bne #$c, .nextpixels	; if (LCD_CHUNK_SELECTOR % 16) != 0x0C then goto .nextpixels

       ld LCD_CHUNK_SELECTOR	; 
       add #$4			; 
       st LCD_CHUNK_SELECTOR	; LCD_CHUNK_SELECTOR += 4

       bnz .nextpixels	; if acc != 0 then goto .nextpixels

       inc xbnk			; 
       mov #$80, LCD_CHUNK_SELECTOR ; LCD_CHUNK_SELECTOR := 0x80
.nextpixels:
       inc c
       ld c				; acc := c
       bne #$C0,.sloop	; if acc != 0xC0 then goto .sloop

       pop LCD_CHUNK_SELECTOR
       pop c
       pop xbnk
       pop acc
       ;set1 ocr,5
       ret

;-------------------------------------------------------------------------------
; Clear a pixel
; Input:
;	b - row
;   c - column
;-------------------------------------------------------------------------------
clear_pixel:
	push b
	push c
	push acc
	mov #0, xbnk			; bank 0 for rows 0-15, bank 1 for rows 16-31
	
	ld b
	clr1 psw,cy
	rorc
	clr1 psw,cy
	rorc
	clr1 psw,cy
	rorc
	clr1 psw,cy
	rorc
	clr1 psw,cy
	bz clearpixel_bank_ok		; if( b div 16 == 0 ) then goto clearpixel_bank_ok

	mov #1, xbnk 			; since row >= 16, we use bank 1
	ld b
	sub #16
	st b					; b := b - 16
	
clearpixel_bank_ok:
	push b
	push c
	push c
	push b
	clr1 ocr, 5

	; screen resolution is 48x32
	; each chunk has 8 pixels
	; there are 6*32 chunks (6 on each line, 32 lines)
	
	; multiply row by 6 to get the number of the first chunk in the row
	; where we will draw the pixel
	mov #0, acc
	mov #6, c
	mul						; [b:acc:c] = [acc:c] * b
	
	; since row is between 0 and 31, the result of multiplication by 6
	; only requires the lower byte, which ends up in register c after the
	; multiplication
	
	pop acc					; acc := b
	
	; the LCD_CHUNK_SELECTOR maps chunk number to LCD like so:
	;  0  1  2  3  4  5       <---- first LCD line (6 * 8 = 48 pixels)
	;  6  7  8  9  A  B       <---- second LCD line
	; 10 11 12 13 14 15       <---- third line
	; 16 17 18 19 1A 1B       <---- fourth line
	;                               and so on
	; It's important to note that last 4 of every 16 chunks are offscreen 
	
	; now, for every two rows, we must add 4 to the chunk number, 
	; to account for the 4 offscreen chunks					; 
	clr1 psw,cy
	rorc					; acc := b div 2
	clr1 psw,cy				; clear CY flag to discard rotated bit
	rolc					;
	clr1 psw,cy
	rolc					; acc := acc * 4 (the offscreen adjustment)
	clr1 psw,cy
	add c					; acc := (row * 6) + offscreen adjustment
							; (basically contains the number of first chunk
							; on the row where we'll put the pixel )
	
	pop c					; c now contains the column argument
	push acc
	; now calculate the correct chunk on this row where we will put the pixel
	mov #0, acc				
	mov #8, b				
	div						; [acc:c] := [acc:c] div b
							; b := [acc:c] mod b
	
	; b now contains a value between 0 and 7
	; corresponding to the bit which has to be set in the byte we'll write to LCD
	pop acc
	add c					; acc now contains correct chunk to set
	
	add #$80				; 0x80 is the first chunk (top left of screen)
							; 0x81 the second (next 8 pixels to the right), and so on
	st LCD_CHUNK_SELECTOR
	
	; set the correct bit for our pixel, in a byte which will be written to LCD
	; we do this by shifting a 1 as many places as the value in register b
	mov #%10000000, acc
clearpixel_shift:
	push acc
	ld b
	bz clearpixel_shift_done	; if b == 0 then we are done shifting our bit
	pop acc
	clr1 psw,cy
	rorc					
	clr1 psw,cy
	
	dec b
	br clearpixel_shift
clearpixel_shift_done:
	pop acc					; we missed the pop right after the bz, so do it here
	; acc now has only one bit set, in the position we want to clear
	; we have to invert acc now, to make it all but one zeroes
	not1 acc, 0
	not1 acc, 1
	not1 acc, 2
	not1 acc, 3
	not1 acc, 4
	not1 acc, 5
	not1 acc, 6
	not1 acc, 7
	
	; acc now contains the proper byte we have to write to clear our pixel
	
	and @R2					; we and with the existing pixels to keep all but the one
	
	st @R2					; write accumulated (on-screen + our new pixel) pixels
							; to the LCD
	;set1 ocr,5
	
	pop c
	pop b
	
	pop acc
	pop c
	pop b
	ret

;-------------------------------------------------------------------------------
; Read a pixel
; Input:
;	b - row
;   c - column
; Output:
;	zero in acc when pixel is not set
;   non-zero in acc when pixel is set
;-------------------------------------------------------------------------------
read_pixel:
	push b
	push c
	push acc
	mov #0, xbnk			; bank 0 for rows 0-15, bank 1 for rows 16-31
	
	ld b
	clr1 psw,cy
	rorc
	clr1 psw,cy
	rorc
	clr1 psw,cy
	rorc
	clr1 psw,cy
	rorc
	clr1 psw,cy
	bz readpixel_bank_ok		; if( b div 16 == 0 ) then goto readpixel_bank_ok

	mov #1, xbnk 			; since row >= 16, we use bank 1
	ld b
	sub #16
	st b					; b := b - 16
	
readpixel_bank_ok:
	push b
	push c
	push c
	push b
	clr1 ocr, 5

	; screen resolution is 48x32
	; each chunk has 8 pixels
	; there are 6*32 chunks (6 on each line, 32 lines)
	
	; multiply row by 6 to get the number of the first chunk in the row
	; where we will draw the pixel
	mov #0, acc
	mov #6, c
	mul						; [b:acc:c] = [acc:c] * b
	
	; since row is between 0 and 31, the result of multiplication by 6
	; only requires the lower byte, which ends up in register c after the
	; multiplication
	
	pop acc					; acc := b
	
	; the LCD_CHUNK_SELECTOR maps chunk number to LCD like so:
	;  0  1  2  3  4  5       <---- first LCD line (6 * 8 = 48 pixels)
	;  6  7  8  9  A  B       <---- second LCD line
	; 10 11 12 13 14 15       <---- third line
	; 16 17 18 19 1A 1B       <---- fourth line
	;                               and so on
	; It's important to note that last 4 of every 16 chunks are offscreen 
	
	; now, for every two rows, we must add 4 to the chunk number, 
	; to account for the 4 offscreen chunks					; 
	clr1 psw,cy
	rorc					; acc := b div 2
	clr1 psw,cy				; clear CY flag to discard rotated bit
	rolc					;
	clr1 psw,cy
	rolc					; acc := acc * 4 (the offscreen adjustment)
	clr1 psw,cy
	add c					; acc := (row * 6) + offscreen adjustment
							; (basically contains the number of first chunk
							; on the row where we'll put the pixel )
	
	pop c					; c now contains the column argument
	push acc
	; now calculate the correct chunk on this row where we will put the pixel
	mov #0, acc				
	mov #8, b				
	div						; [acc:c] := [acc:c] div b
							; b := [acc:c] mod b
	
	; b now contains a value between 0 and 7
	; corresponding to the bit which has to be set in the byte we'll write to LCD
	pop acc
	add c					; acc now contains correct chunk to set
	
	add #$80				; 0x80 is the first chunk (top left of screen)
							; 0x81 the second (next 8 pixels to the right), and so on
	st LCD_CHUNK_SELECTOR
	
	; set the correct bit for our pixel, in a byte which will be written to LCD
	; we do this by shifting a 1 as many places as the value in register b
	mov #%10000000, acc
readpixel_shift:
	push acc
	ld b
	bz readpixel_shift_done	; if b == 0 then we are done shifting our bit
	pop acc
	clr1 psw,cy
	rorc					
	clr1 psw,cy
	
	dec b
	br readpixel_shift
readpixel_shift_done:
	pop acc					; we missed the pop right after the bz, so do it here	
	; acc now contains the proper byte with which we can AND and read the pixel
	
	and @R2					; acc becomes non-zero if pixel is set, and zero if not
	
	;set1 ocr,5
	
	pop c
	pop b
	
	pop acc
	pop c
	pop b
	ret


;-------------------------------------------------------------------------------
; Draw a square
; Input:
;   b - row
;   c - column
; acc - side length
;-------------------------------------------------------------------------------
draw_square:
	push b
	push c
	push acc 
	
	push c
	push acc
draw_square_horizontal:
	call put_pixel
	inc c
	dec acc
	bne #1, draw_square_horizontal	
	pop acc
	pop c
	
	push b
	push acc
	add b
	dec acc
	st b					; move b to the bottom row of the square
	pop acc
	
	push c
	push acc
draw_square_horizontal2:
	call put_pixel
	inc c
	dec acc
	bne #1, draw_square_horizontal2
	pop acc
	pop c
	
	pop b					; b, c, acc reset to initial values
	
	push b
	push acc
draw_square_vertical:
	call put_pixel
	inc b
	dec acc
	bne #1, draw_square_vertical
	pop acc
	pop b
	
	push acc
	add c
	dec acc
	st c					; move c to the right-most column of the square
	pop acc
	
draw_square_vertical2:
	call put_pixel
	inc b
	dec acc
	bne #0, draw_square_vertical2
	
	pop acc
	pop c
	pop b
	ret


;-------------------------------------------------------------------------------
; Clear a square
; Input:
;   b - row
;   c - column
; acc - side length
;-------------------------------------------------------------------------------
clear_square:
	push b
	push c
	push acc 
	
	push c
	push acc
clear_square_horizontal:
	call clear_pixel
	inc c
	dec acc
	bne #1, clear_square_horizontal	
	pop acc
	pop c
	
	push b
	push acc
	add b
	dec acc
	st b					; move b to the bottom row of the square
	pop acc
	
	push c
	push acc
clear_square_horizontal2:
	call clear_pixel
	inc c
	dec acc
	bne #1, clear_square_horizontal2
	pop acc
	pop c
	
	pop b					; b, c, acc reset to initial values
	
	push b
	push acc
clear_square_vertical:
	call clear_pixel
	inc b
	dec acc
	bne #1, clear_square_vertical
	pop acc
	pop b
	
	push acc
	add c
	dec acc
	st c					; move c to the right-most column of the square
	pop acc
	
clear_square_vertical2:
	call clear_pixel
	inc b
	dec acc
	bne #0, clear_square_vertical2
	
	pop acc
	pop c
	pop b
	ret