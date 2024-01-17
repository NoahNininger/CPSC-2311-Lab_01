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