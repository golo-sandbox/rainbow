module tests

import org.k33g.rainbow

function Bestiole = {
  let bestiole = DynamicObject():avatar("X"):console(console()):x(0):y(0)
    :define("red", |this|{
      this:console():red()
      return this
    })
    :define("blue", |this|{
      this:console():blue()
      return this
    }) 
    :define("green", |this|{
      this:console():green()
      return this
    }) 
    :define("yellow", |this|{
      this:console():yellow()
      return this
    })          
    :define("draw", |this| {
      this:console():pos(this:y(), this:x()):print(this:avatar())
      return this
    })
    :define("erase", |this| {
      this:console():pos(this:y(), this:x()):print("\u2022")
      return this
    })
    :define("moveRight", |this| {
      this:erase():x(this:x() + 1):draw()
      return this
    })
    :define("moveLeft", |this| {
      this:erase():x(this:x() - 1):draw()
      return this
    })    
    :define("moveDown", |this| {
      this:erase():y(this:y() + 1):draw()
      return this
    }) 
    :define("moveUp", |this| {
      this:erase():y(this:y() - 1):draw()
      return this
    }) 
    return bestiole 
}


function Panda = |line, col| {
  let panda = DynamicObject():mixin(Bestiole()):avatar("🐼")
  panda:x(col):y(line):draw()
  return panda
}

function Tiger = |line, col| {
  let tiger = DynamicObject():mixin(Bestiole()):avatar("🐯")
  tiger:x(col):y(line):draw()
  return tiger
}

function main = |args| {

  console():clear()

  let pandi = Panda(5,5)

  let tigrou = Tiger(10,10)

  pandi:red():moveRight():moveRight():moveRight():moveDown():moveDown():moveDown()
    :moveLeft():moveLeft():moveLeft():moveLeft():green():moveUp():moveUp():moveUp():moveUp():moveUp()

  tigrou:yellow():moveRight():moveRight():moveRight():moveRight()


  console():pos(18,0)


}

