; Factorial Calculation Program for Intel 8080
      MVI C, 05H     ; Load immediate 5 into register C (the counter)
      MVI A, 01H     ; Load immediate 1 into A, since factorial starts with 1

FACT_LOOP:
      CALL MULT      ; Call multiplication subroutine
      DCR C          ; Decrement counter
      JNZ FACT_LOOP  ; Loop until counter is zero (when factorial is done)
      STA 0100H      ; Store the result in A to memory location 0100H
      HLT            ; Halt the system (result is in memory at 0100H)

; Multiplication subroutine to multiply A and C (assuming C <= A and result < 256)
MULT: 
      MOV D, C       ; Copy C into D for the multiplication loop
      MOV E, A       ; Copy A into E as the multiplicand
      MVI A, 00H    ; Clear A for the multiplication result

MULT_LOOP:
      ADD E          ; Add E to A
      DCR D          ; Decrement D (counter for how many times to add)
      JNZ MULT_LOOP  ; If D is not zero, keep multiplying
      RET            ; Return from the subroutine