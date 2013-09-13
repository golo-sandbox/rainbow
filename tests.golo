module tests

import rainbow

function main = |args| {
  console():clear():pos(0,5)
   :red():print("hello"):brightRed():println("salut")
   :pos(10,5):blue():println("k33g_org")
   :pos(5,5):blue():print("\u27fb "):yellowBg()
  readln("Hello, what's your name ?")
  
  console():reset():cyan():pos(15,10):draw("=",15)
  readln("?")
}
