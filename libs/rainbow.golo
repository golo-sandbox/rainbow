module org.k33g.rainbow

struct terminal = {escCode, row, col}

#http://www.termsys.demon.co.uk/vtansi.htm
#http://rsiqueira.postbit.com/upload/2/posts/unicode.html
#http://www.unicode.org/charts/PDF/U2500.pdf
#http://www.unicode.org/charts/PDF/U2580.pdf
#http://www.unicode.org/charts/
#http://dmmarks.com/UnicodeChars.html

augment org.k33g.rainbow.types.terminal {

  function reset = |this| {
    print(this:escCode()+"0m")
    return this
  }

  function bright = |this| { # make reset before ?
    print(this:escCode()+"1m")
    return this
  }

  function dim = |this| { # doesn't work
    print(this:escCode()+"2m")
    return this
  }

  function underscore = |this| {
    print(this:escCode()+"4m")
    return this
  }

  function blink = |this| { # doesn't work
    print(this:escCode()+"5m")
    return this
  }

  function reverse = |this| {
    print(this:escCode()+"7m")
    return this
  }

  function hidden = |this| { # doesn't work
    print(this:escCode()+"8m")
    return this
  }

  function black = |this| {
    print(this:escCode()+"30m")
    return this
  }

  function blackBg = |this| {
    print(this:escCode()+"40m")
    return this
  }

  function gray = |this| {
    print(this:escCode()+"30;1m")
    return this
  }

  function red = |this| {
    print(this:escCode()+"31m")
    return this
  }

  function brightRed = |this| {
    print(this:escCode()+"31;1m")
    return this
  }

  function redBg = |this| {
    print(this:escCode()+"41m")
    return this
  }  

  function green = |this| {
    print(this:escCode()+"32m")
    return this
  }

  function brightGreen = |this| {
    print(this:escCode()+"32;1m")
    return this
  }

  function greenBg = |this| {
    print(this:escCode()+"42m")
    return this
  }

  function yellow = |this| {
    print(this:escCode()+"33m")
    return this
  }

  function brightYellow = |this| {
    print(this:escCode()+"33;1m")
    return this
  }

  function yellowBg = |this| {
    print(this:escCode()+"43m")
    return this
  }  

  function blue = |this| {
    print(this:escCode()+"34m")
    return this
  }

  function brightBlue = |this| {
    print(this:escCode()+"34;1m")
    return this
  }

  function blueBg = |this| {
    print(this:escCode()+"44m")
    return this
  }  

  function purple = |this| { #Magenta
    print(this:escCode()+"35m")
    return this
  }

  function brightPurple = |this| {
    print(this:escCode()+"35;1m")
    return this
  }

  function purpleBg = |this| {
    print(this:escCode()+"45m")
    return this
  }    

  function cyan = |this| {
    print(this:escCode()+"36m")
    return this
  }

  function brightCyan = |this| {
    print(this:escCode()+"36;1m")
    return this
  }

  function cyanBg = |this| {
    print(this:escCode()+"46m")
    return this
  }  

  function white = |this| {
    print(this:escCode()+"37m")
    return this
  }

  function brightWhite = |this| {
    print(this:escCode()+"37;1m")
    return this
  }

  function whiteBg = |this| {
    print(this:escCode()+"47m")
    return this
  }  

  function pos = |this, row, col| {
    this:row(row)
    this:col(col)
    print(this:escCode()+"%s;%sf":format(row:toString(), col:toString())) 
    return this
  }

  function home = |this| {
    return this:pos(0,0)
  }

  # Cursor Forward    <ESC>[{COUNT}C
  # Moves the cursor forward by COUNT columns; the default count is 1.
  function forward = |this, howMany| {
    this:col(this:col() + howMany)
    print(this:escCode()+"%sC":format(howMany:toString())) 
    return this
  }

  function forward = |this| {
    return this:forward(1)
  }

  # Cursor Backward   <ESC>[{COUNT}D
  # Moves the cursor backward by COUNT columns; the default count is 1.
  function backward = |this, howMany| {
    this:col(this:col() - howMany)
    print(this:escCode()+"%sD":format(howMany:toString())) 
    return this
  }

  function backward = |this| {
    return this:backward(1)
  }

  # Cursor Up   <ESC>[{COUNT}A
  # Moves the cursor up by COUNT rows; the default count is 1.
  function up = |this, howMany| {
    this:row(this:row() - howMany)
    print(this:escCode()+"%sA":format(howMany:toString())) 
    return this
  }

  function up = |this| {
    return this:up(1)
  }

 # Cursor Down   <ESC>[{COUNT}B
 # Moves the cursor down by COUNT rows; the default count is 1.
  function down = |this, howMany| {
    this:row(this:row() + howMany)
    print(this:escCode()+"%sB":format(howMany:toString())) 
    return this
  }

  function down = |this| {
    return this:down(1)
  }

  function clear = |this| {
    print(this:escCode()+"2J")
    return this   
  }

  function drawLineForward = |this, char, howMany| {
    #TODO : one char only ?
    howMany:times({
      this:print(char)
    })
    return this
  }

  function drawLineBackward = |this, char, howMany| {
    #TODO : one char only ?
    howMany:times({
      this:print(char):backward():backward()
    })
    return this
  }  

  function drawLineDown = |this, char, howMany| {
    #TODO : one char only ?
    howMany:times({
      this:print(char):down():backward()
    }) 
    return this
  }

  function drawLineUp = |this, char, howMany| {
    #TODO : one char only ?
    howMany:times({
      this:print(char):up():backward()
    }) 
    return this
  }

  function simpleBox = |this, width, height| {
    return this:print("\u250c")
      :drawLineForward("\u2500", width)
      :print("\u2510")
      :down():backward():drawLineDown("\u2502", height)
      :print("\u2518")
      :backward():backward():drawLineBackward("\u2500", width)
      :print("\u2514")
      :backward():up():drawLineUp("\u2502", height)
  }

  

  function doubleBox = |this, width, height| {
    return this:print("\u2554")
      :drawLineForward("\u2550", width)
      :print("\u2557")
      :down():backward():drawLineDown("\u2551", height)
      :print("\u255D")
      :backward():backward():drawLineBackward("\u2550", width)
      :print("\u255A")
      :backward():up():drawLineUp("\u2551", height)
  } 

  function eraseLine = |this| { # don't change cursor position
    print(this:escCode()+"2K")
    return this
  }   

  function eraseScreen = |this| { # don't change cursor position
    print(this:escCode()+"2J")
    this:home()
    return this
  }   

  function print = |this, message| {
    this:col(this:col() + message:length())
    print(message)
    return this
  }

}

function console = {
  let term = terminal("\u001B[", 0, 0)
  term:home()
  return term
} 

function clear = -> console():clear()

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



