       IDENTIFICATION DIVISION.
       PROGRAM-ID. "guessNumber".
       AUTHOR "Daniel Thornton".
      *This is a guess the number game

       ENVIRONMENT DIVISION.
      *-------------------------
       INPUT-OUTPUT SECTION.
      *-------------------------
       DATA DIVISION.
      *-------------------------
       FILE SECTION. 
      *-------------------------

       WORKING-STORAGE SECTION.
       01 WS-GUESSES-TAKEN PIC X(9).
       01 WS-USER-GUESS PIC X(5).
       01 WS-SEED PIC 9(08) value 1.
       01 WS-RAND PIC ZZZ9.
       01 WS-RUN PIC 9 VALUE 1.
       78 WS-NEWLINE VALUE x"0d".
       

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
             COMPUTE WS-RAND = FUNCTION RANDOM(WS-SEED) * 10 + 1.
             MOVE 1 TO WS-RUN.
             DISPLAY "Guess the number !".
             ACCEPT WS-USER-GUESS.
             IF WS-RAND = WS-USER-GUESS THEN
                DISPLAY "You won!"
             ELSE IF WS-RAND < WS-USER-GUESS THEN
                DISPLAY "Your guess is to high"
             ELSE IF WS-RAND > WS-USER-GUESS THEN
                DISPLAY "You guess is to low"
             ELSE 
                DISPLAY "Your guess is invalid".
              
             
            
  
       STOP RUN.

