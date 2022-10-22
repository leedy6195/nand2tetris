// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


(LOOP)
@i
M=0

@KBD
D=M
@IFZERO
D;JEQ
@IFNOTZERO
0;JMP

(IFZERO)
//clear the screen
(WSUBLOOP)
@i
D=M
@SCREEN
A=A+D
M=0

@i
M=M+1
D=M
@512
D=D-A
@WSUBEND
D;JEQ

@WSUBLOOP
0;JMP

(WSUBEND)

@LOOP
0;JMP

(IFNOTZERO)
//black the screen
(BSUBLOOP)
@i
D=M
@SCREEN
A=A+D
M=-1

@i
M=M+1
D=M
@512
D=D-A
@BSUBEND
D;JEQ

@BSUBLOOP
0;JMP

(BSUBEND)

@LOOP
0;JMP