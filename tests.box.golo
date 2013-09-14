module tests

import org.k33g.rainbow

function main = |args| {

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
    :pos(10,23):cyan():doubleBox(8,4):pos(0,0):print("az"):print("b"):forward():forward():green()


  readln(term:col()+":"+term:row())






}

