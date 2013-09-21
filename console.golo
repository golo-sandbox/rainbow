module console

# DynamicObject version

function console = {
  let terminal = DynamicObject():escCode("\u001B[")

  terminal:reset(|this| -> this:print(this:escCode()+"0m"))
  terminal: bright(|this| -> this:print(this:escCode()+"1m"))

  terminal: dim(|this| -> this:print(this:escCode()+"2m"))

  terminal: underscore(|this|  -> this:print(this:escCode()+"4m"))

  terminal: blink(|this| -> this:print(this:escCode()+"5m"))

  terminal: reverse(|this|  -> this:print(this:escCode()+"7m"))

  terminal: hidden(|this| -> this:print(this:escCode()+"8m"))

  terminal: black(|this| -> this:print(this:escCode()+"30m"))

  terminal: blackBg(|this| -> this:print(this:escCode()+"40m"))

  terminal: gray(|this| -> this:print(this:escCode()+"30;1m"))

  terminal: red(|this| -> this:print(this:escCode()+"31m"))

  terminal: brightRed(|this| -> this:print(this:escCode()+"31;1m"))

  terminal: redBg(|this| -> this:print(this:escCode()+"41m"))

  terminal: green(|this| -> this:print(this:escCode()+"32m"))

  terminal: brightGreen(|this| -> this:print(this:escCode()+"32;1m"))

  terminal: greenBg(|this| -> this:print(this:escCode()+"42m"))

  terminal: yellow(|this| -> this:print(this:escCode()+"33m"))

  terminal: brightYellow(|this| -> this:print(this:escCode()+"33;1m"))

  terminal: yellowBg(|this| -> this:print(this:escCode()+"43m"))

  terminal: blue(|this| -> this:print(this:escCode()+"34m"))

  terminal: brightBlue(|this| -> this:print(this:escCode()+"34;1m"))

  terminal: blueBg(|this| -> this:print(this:escCode()+"44m"))

  terminal: purple(|this| -> this:print(this:escCode()+"35m")) # Magenta

  terminal: brightPurple(|this| -> this:print(this:escCode()+"35;1m"))

  terminal: purpleBg(|this| -> this:print(this:escCode()+"45m"))

  terminal: cyan(|this| -> this:print(this:escCode()+"36m"))

  terminal: brightCyan(|this| -> this:print(this:escCode()+"36;1m"))

  terminal: cyanBg(|this| -> this:print(this:escCode()+"46m"))

  terminal: white(|this| -> this:print(this:escCode()+"37m"))

  terminal: brightWhite(|this| -> this:print(this:escCode()+"37;1m"))

  terminal: whiteBg(|this| -> this:print(this:escCode()+"47m"))

  terminal: pos(|this, row, col| ->
    this:print(this:escCode()+"%s;%sf":format(row:toString(), col:toString()))
  )

  terminal: home(|this| -> this:pos(0,0))
  # Cursor Forward    <ESC>[{COUNT}C
  # Moves the cursor forward by COUNT columns; the default count is 1.
  terminal: forward(|this, howMany| ->
    this:print(this:escCode()+"%sC":format(howMany:toString()))
  )

  terminal: forward(|this| -> this:forward(1))

  # Cursor Backward   <ESC>[{COUNT}D
  # Moves the cursor backward by COUNT columns; the default count is 1.
  terminal: backward(|this, howMany| ->
    this:print(this:escCode()+"%sD":format(howMany:toString())) 
  )

  terminal: backward(|this| -> this:backward(1))

  # Cursor Up   <ESC>[{COUNT}A
  # Moves the cursor up by COUNT rows; the default count is 1.
  terminal: up(|this, howMany| ->
    this:print(this:escCode()+"%sA":format(howMany:toString())) 
  )

  terminal: up(|this| -> this:up(1))

 # Cursor Down   <ESC>[{COUNT}B
 # Moves the cursor down by COUNT rows; the default count is 1.
  terminal: down(|this, howMany| ->
    this:print(this:escCode()+"%sB":format(howMany:toString())) 
  )

  terminal: down(|this|  -> this:down(1))
  
  terminal: clear(|this| -> this:print(this:escCode()+"2J"))

  terminal: drawLineForward(|this, char, howMany| -> this:print(char * howMany)) 

  terminal: drawLineBackward(|this, char, howMany| {
    howMany:times({
      this:print(char):backward():backward()
    })
    return this
  }) 

  terminal: drawLineDown(|this, char, howMany| {
    howMany:times({
      this:print(char):down():backward()
    }) 
    return this
  })

  terminal: drawLineUp(|this, char, howMany| {
    howMany:times({
      this:print(char):up():backward()
    }) 
    return this
  })

  # don't change cursor position
  terminal: eraseLine(|this| -> this:code(this:escCode()+"2K"))

  # don't change cursor position
  terminal: eraseScreen(|this| -> this:code(this:escCode()+"2J"):home())

  terminal: print(|this, message| {
    print(message)
    return this
  })

  terminal:home()
  return terminal  
}

# for test with library
function error = |line, col, message| {
  console():red():pos(line, col):eraseLine():print(message)
}

function information = |line, col, message| {
  console():blue():pos(line, col):eraseLine():print(message) 
}

function success = |line, col, message| {
  console():green():pos(line, col):eraseLine():print(message) 
}

function main = |arg| {
  console():clear()
  information(4,4,"Hello World!!!!")
}

