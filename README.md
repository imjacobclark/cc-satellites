# Code Challenge - Satellites 

Common Lisp, SBCL compiler.

## Setup
```
brew install sbcl
chmod +x satellites.lisp
./satellites.lisp
```

## Program output

```
[jacobclark:~/workspace/cc-satelites]$ ./satelites.lisp
"Input: "(-3 1 1 -2 3 -2)" - Result: "(-3 -2 3)
"Input: "(-2 -1 1 2)" - Result: "(-2 -1 1 2)
"Input: "(-2 1 1 -2)" - Result: "(-2 -2)
"Input: "(1 1 -2 -2)" - Result: "(-2 -2)
"Input: "(10 2 -5)" - Result: "(10)
"Input: "(8 -8)" - Result: "NIL
"Input: "(-4 2 -3 3 4 -1 2 -2 3 -4)" - Result: "(-4 -3 3)
"Input: "(5 -2 -5 -2 3 -1 -1 3 -4)" - Result: "(-2 -4)
"Input: "(1 -1 1 1 -1 -1 1 -1)" - Result: "NIL
```

![](./architecture.png)