module tests

import rainbow

function main = |args| {

  let term = console()

  term:clear():pos(2,8):print("Hello"):white():print("World"):forward(2):print("Tadaaa!"):forward()
    :red():drawLineForward("=", 5)
    :blue():drawLineDown("+", 4)
    :green():drawLineBackward("-", 6)
    :yellow():drawLineUp("I", 5)
    :pos(10,20)
    :print("\u250c"):drawLineForward("\u2500", 15):print("\u2510"):down():backward():drawLineDown("\u2502", 3)
    :print("\u2518"):backward():backward():drawLineBackward("\u2500", 15):print("\u2514"):backward():up():drawLineUp("\u2502", 3)
    :pos(18,15):green():simpleBox(5,3)
    :pos(18,23):cyan():doubleBox(8,4):pos(0,0):print("az"):print("b")


  readln(term:col()+":"+term:row())






}

