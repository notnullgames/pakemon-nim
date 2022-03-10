import raylib

type
  ParalaxLayer* = ref object
    offsetY*: int
    scroll*: float
    speed*: float
    image*: Texture2D

proc draw*(this:ParalaxLayer) =
  this.scroll += this.speed
  if this.scroll <= (-1.0 * float(this.image.width)):
    this.scroll = 0
  DrawTexture(this.image, int(this.scroll), this.offsetY, WHITE)
  DrawTexture(this.image, int(this.scroll) + this.image.width, this.offsetY, WHITE)

proc unload*(this:ParalaxLayer) =
  UnloadTexture(this.image)