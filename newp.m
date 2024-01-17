comment(`  code to convert a binary number to decimal  ')

comment(`  Noah Nininger  ')
comment(`  CPSC 2310-001  ')
comment(`  Programming Assignment 1 - Conversion From Binary to Decimal  ')
comment(`  05/29/2023  ')

    word(N, 111)
    word(dec, 0)
    word(base, 1)
    word(prev, 0)
    word(temp1, 0)
    word(temp2, 0)

label(start)
label(loop)
    load(N)         comment(`branch to done if given value is equal to 0')
    beq0(done)

    load(temp1)     comment(`creates the equation, N % 10')
    mov(temp1, N)
    mod(10)
    store(temp1)

    load(temp1)     comment(`sets the value of prev to the equation')
    store(prev)

    load(N)         comment(`N = N / 10')
    div(10)
    store(N)

    load(prev)      comment(`creates the equation, prev * base')
    store(temp2)
    load(temp2)
    mul(base)
    store(temp2)

    load(dec)       comment(`adds the value of the equation to dec')
    add(temp2)
    store(dec)

    load(base)      comment(`base = base * 2')
    mul(2)
    store(base)

    ba(loop)        comment(`branches unconditionally')
label(done)

    print(dec)      comment(`prints the converted number')
    halt

comment(`  start execution at label start  ')
   end(start)
