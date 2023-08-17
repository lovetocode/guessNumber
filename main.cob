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
       01 WS-NUMBER-GUESSES PIC 999.
       01 WS-USER-GUESS PIC 9999.
       01 WS-SEED PIC 9 VALUE 1.
       01 WS-RAND PIC ZZZ9.
       01 WS-RUN PIC 9 VALUE 1.
       01 WS-NEWLINE PIC 9(1) value 1. 
       01 WS-PLAY-AGAIN PIC X(5) VALUE "y".
       

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
       PERFORM GAME-LOOP UNTIL WS-RUN = 0.
       STOP RUN.
             
       GAME-LOOP.
           EVALUATE WS-PLAY-AGAIN
           WHEN "n"
             PERFORM QUIT-GAME
           WHEN OTHER
             COMPUTE WS-RAND = FUNCTION RANDOM(WS-SEED) * 10000 + 1.
             MOVE 1 TO WS-RUN.
             DISPLAY "Welcome to guess the number...... version 1.0."
             DISPLAY "Guess a number between 1 and who knows ". 
             ACCEPT WS-USER-GUESS.
             IF WS-RAND = WS-USER-GUESS THEN
                DISPLAY "You won! "
                PERFORM QUIT-GAME
             ELSE IF WS-RAND > WS-USER-GUESS THEN
                  DISPLAY "Your guess is to low"
              ELSE 
                  DISPLAY "Your guess is to high"
        STOP RUN.

       CALCULATE-NUM-GUESSES.
          COMPUTE WS-NUMBER-GUESSES = WS-NUMBER-GUESSES + 1.

       QUIT-GAME.
        DISPLAY "Do you want to play again? "
          ACCEPT WS-PLAY-AGAIN
          MOVE FUNCTION LOWER-CASE(WS-PLAY-AGAIN) TO WS-PLAY-AGAIN.
          IF WS-PLAY-AGAIN = "y"
              PERFORM MAIN-PROCEDURE
          ELSE IF WS-PLAY-AGAIN = "n"
              DISPLAY "Goodbye for now...!"
             STOP RUN
      
          STOP RUN.

         

      

