#!/usr/local/bin/sbcl --script

(defun dbg(id x)
    (write "Input: ")
    (write id)
    (write " - Result: ")
    (write x)
    (write-line "")
)

(defun determine-if-travelling-towards-eachother(sat neighbour)
    (if (and 
        (eq (signum sat) 1) 
        (eq (signum neighbour) -1)
    ) 
    T 
    NIL
))

(defun determine-survivor(sat neighbour)
    (if (eq (abs sat) (abs neighbour))
        NIL
        (if (> (abs sat) (abs neighbour))
            (list sat)
            (list neighbour)
        )
    )
)

(defun recalculate-survivors(arr survivors)
    (if (eq (determine-survivor (car arr) (car (cdr arr))) NIL)
        survivors
        (append (determine-survivor (car arr) (car (cdr arr))) survivors)
    )
)

(defun should-halt(collision survivors)
    (if (eq collision T)
        (step-through-sats (reverse survivors) '() NIL)
        survivors
    )
)

(defun evaluate-satellites(arr survivors)
    (if (eq (determine-if-travelling-towards-eachother (car arr) (car (cdr arr))) NIL)
        (step-through-sats (cdr arr) (append (list (car arr)) survivors) NIL)
        (step-through-sats (cdr (cdr arr)) (recalculate-survivors arr survivors) T)
    )
)

(defun step-through-sats(arr survivors collision)
    (if (eq arr NIL)
        (should-halt collision survivors)
        (if (eq (length arr) 1)
            (should-halt collision (append arr survivors))
            (evaluate-satellites arr survivors)
        )
    )
)

(defun compute-collisions(arr i sats)
    (if (eq (length (cdr arr)) 0)
        sats
        (reverse (step-through-sats arr '() NIL))
))

(defun main(sats) (compute-collisions sats 0 '()))

(dbg 
    '(-3 1 1 -2 3 -2)
    (main 
       '(-3 1 1 -2 3 -2)
))

(dbg 
    '(-2 -1 1 2)
    (main 
       '(-2 -1 1 2)
))

(dbg 
    '(-2 1 1 -2)
    (main 
       '(-2 1 1 -2)
))

(dbg 
    '(1 1 -2 -2)
    (main 
       '(1 1 -2 -2)
))

(dbg 
    '(10 2 -5)
    (main 
       '(10 2 -5)
))

(dbg 
    '(8 -8)
    (main 
       '(8 -8)
))

(dbg
    '(-4 2 -3 3 4 -1 2 -2 3 -4)
    (main 
       '(-4 2 -3 3 4 -1 2 -2 3 -4)
))

(dbg
    '(5 -2 -5 -2 3 -1 -1 3 -4)
    (main 
       '(5 -2 -5 -2 3 -1 -1 3 -4)
))

(dbg
    '(1 -1 1 1 -1 -1 1 -1)
    (main 
       '(1 -1 1 1 -1 -1 1 -1)
))