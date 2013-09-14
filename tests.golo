module tests

import org.k33g.rainbow

function main = |args| {

  
  console():clear():pos(0,5)
   :red():print("Golo"):brightRed():print("Golo")
   :pos(10,5):blue():print("Rainbow by @k33g_org")
   :pos(5,5):green():print("\u27fb "):blackBg()
  readln("Hello, do you know Golo ?")
  
  console():reset():cyan():pos(15,10):drawLineForward("=",5)
  readln("> ?")

  console():red():reverse():pos(20,8):print("Hello")
  console():reset():red():pos(21,10):bright():underscore():print("World!")

  console():pos(2,8):yellow():drawLineForward(".",5):print("X")

  error(1, 2,"ERROR")
  information(2, 2, "INFORMATION")
  success(3, 2, "BRAVO")

  println("")
  println("")
  #console():clear():pos(0,5)

}

