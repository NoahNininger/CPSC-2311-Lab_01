Worksheet on assembling code for the accumulator machine

   instruction table (built into assembler)
   ----------------------------------------
   name    opcode  args  loc increment
   ----    ------  ----  -------------
   div     10      $1      2          <- e.g., div is defined as two words:
   mul     20      $1      2               * first word is opcode 10
   sub     30      $1      2               * second word is address of arg
   add     40      $1      2             (thus loc should be incremented by 2)
   load    50      $1      2
   store   60      $1      2
   halt    00              1



first program

  comment(`  data section for program  ')

     word(a,0)
     word(b,3)
     word(c,48)
     word(d,9)

  label(start)

     load(b)
     add(c)
     sub(d)
     store(a)

     halt

  comment(`  start execution at label start  ')

     start


translation of first program 

   symbol table after first pass
   label  addr==loc
   -----  ---------
   a      00         <- a is defined as location 00
   b      01         <- b is defined as location 01
   c      02         <- c is defined as location 02
   d      03         <- d is defined as location 03
   start  04         <- start is defined as location 04


   second pass input               "executable" after second pass
   -----------------              ------------------------------
   (loc:)  assembly language       addr:   machine code or data
   ------  -----------------       -----   --------------------
   (00:)   word(a,0)               00:      0      <- value in location a
   (01:)   word(b,3)               01:      3      <- value in location b
   (02:)   word(c,48)              02:     48      <- value in location c
   (03:)   word(d,9)               03:      9      <- value in location d
           label(start)
   (04:)   load(b)                 04:     50      <- opcode for load
                                   05:     01      <- address of b
   (06:)   add(c)                  06:     40      <- opcode for add
                                   07:     02      <- address of c
   (08:)   sub(d)                  08:     30      <- opcode for sub
                                   09:     03      <- address of d
   (10:)   store(a)                10:     60      <- opcode for store
                                   11:     00      <- address of a
   (12:)   halt                    12:     00      <- opcode for halt
   (13:)   start                   13:     04      <- starting address



================================================================================
second program

  label(start)

     load(b)
     add(c)
     sub(d)
     store(a)

     halt

  comment(`  data section for program  ')

     word(a,0)
     word(b,3)
     word(c,48)
     word(d,9)

  comment(`  start execution at label start  ')

     start


translation of second program 

   symbol table after first pass
   label  addr==loc
   -----  ---------
   a      09

   b      10

   c      11

   d      12

   start  0


   second pass input               "executable" after second pass
   -----------------              ------------------------------
   (loc:)  assembly language       addr:   machine code or data
   ------  -----------------       -----   --------------------
           label(start)

   (00:)   load(b)                00:     50

                                   01:     10

   (02:)   add(c)                  02:     70

                                   03:     11

   (04:)   sub(d)                  04:     30

                                   05:     12

   (06:)   store(a)                06:     90

                                   07:     09

   (08:)   halt                    08:     00

   (09:)   word(a,0)               09:      0

   (10:)   word(b,3)               10:      3

   (11:)   word(c,48)              11:     48

   (12:)   word(d,9)               12:     09

   (13:)   start                   13:     00



================================================================================
third program

  label(start)

     load(beta)
     mul(gamma)
     div(delta)
     store(alpha)

     halt

  comment(`  data section for program  ')

     word(alpha,50)
     word(beta,2)
     word(gamma,12)
     word(delta,6)

  comment(`  start execution at label start  ')

     start


translation of third program 

   symbol table after first pass
   label  addr==loc
   -----  ---------

   alpha  09

   beta   10

   gamma  11

   delta  00

   start     0


   second pass input               "executable" after second pass
   -----------------              ------------------------------
   (loc:)  assembly language       addr:   machine code or data
   ------  -----------------       -----   --------------------
           label(start)

   (00:)   load(beta)              00:     40

                                   01:     10

   (02:)   mul(gamma)              02:     80

                                   03:     11

   (04:)   div(delta)              04:     90

                                   05:     12

   (06:)   store(alpha)            06:     20

                                   07:     09

   (08:)   halt                    08:     00

   (09:)   word(alpha,50)          09:     50

   (10:)   word(beta,2)            10:     02

   (11:)   word(gamma,12)          11:     12

   (12:)   word(delta,6)           12:     06

   (13:)   start                   13:       0

