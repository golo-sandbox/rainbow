#Rainbow

ANSI/VT100 Terminal Control Escape Sequences Golo Helper

```coffeescript
  let term = console()

  term:clear():pos(2,8)
    :yellow():print("Hello")
    :red():print("World")
    :forward(2):purple():print("Tadaaa!"):forward(3)
    :red():drawLineForward("=", 5)
    :blue():drawLineDown("+", 4)
    :green():drawLineBackward("-", 6)
    :yellow():drawLineUp("I", 5)
    :pos(10,15):green():simpleBox(5,3)
    :pos(10,23):cyan():doubleBox(8,4)
```

#License

<a href="http://www.wtfpl.net/"><img
       src="http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-4.png"
       width="80" height="15" alt="WTFPL" /></a>