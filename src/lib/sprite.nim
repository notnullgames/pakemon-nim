import raylib

type
  Spritesheet* = ref object
    image*:Texture2D
    height*:float
    width*:float
    frames*:seq[int]
    frame*:int
    speed*:float
    playing*:bool

proc draw*(this:Spritesheet, x:float, y:float) =
  if this.playing:
    this.frame = int(GetTime() / this.speed) mod len(this.frames)
  let f = this.frames[this.frame]
  let xratio = int(float(this.image.width) / this.width)
  let xcurrent = float(f mod xratio) * this.height
  let ycurrent = float(int(f / xratio)) * float(this.width)
  DrawTextureRec(this.image, Rectangle(x: xcurrent, y: ycurrent, width: this.width, height: this.height), Vector2(x: x, y: y), WHITE)

proc unload*(this:Spritesheet) =
  UnloadTexture(this.image)