#!/usr/local/bin/sbcl --script

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
        (reverse survivors)
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
        (step-through-sats arr '() NIL)
))

(defun main(sats) (compute-collisions sats 0 '()))

(write 
    (main 
       '(-3 1 1 -2 3 -2)
))

(write-line "")

(write 
    (main 
       '(-2 -1 1 2)
))

(write-line "")

(write 
    (main 
       '(-2 1 1 -2)
))

(write-line "")

(write 
    (main 
       '(1 1 -2 -2)
))

(write-line "")

(write 
    (main 
       '(10 2 -5)
))

(write-line "")

(write 
    (main 
       '(8 -8)
))

(write-line "")