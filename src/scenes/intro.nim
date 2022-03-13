import lib/raylib
import lib/parallax
import lib/sprite
import lib/input
import lib/scenes
import std/os

# do all initialization
method load*(this:SceneIntro) =
  this.music = LoadMusicStream("assets/the_golden_ages.mod")
  PlayMusicStream(this.music)
  this.title = LoadTexture("assets/title.png")
  this.titleY = -float(this.title.height)
  this.layer1 = ParalaxLayer(offsetY: 0, scroll: 0, speed: -0.1, image: LoadTexture("assets/far-buildings.png"))
  this.layer2 = ParalaxLayer(offsetY: 0, scroll: 0, speed: -0.5, image: LoadTexture("assets/back-buildings.png"))
  this.layer3 = ParalaxLayer(offsetY: 50, scroll: 0, speed: -1.0, image: LoadTexture("assets/foreground.png"))
  this.cat = Spritesheet(playing: true, image: LoadTexture("assets/cat.png"), frames: @[36, 37, 38, 39, 40, 41], speed: 0.25, height: 32, width: 32, frame: 0)

# called in update-loop
method update*(this:SceneIntro, time: float) =
  UpdateMusicStream(this.music)
  # wait until the "PRESS A BUTTON" is showing
  if this.titleY >= 60.0:
    if buttonDown("a", "b", "x", "y", "start", "select"):
      this.set_scene(SceneMenuTop())

# called in draw loop
method draw*(this:SceneIntro, time: float) =
  ClearBackground(BLACK)
  this.layer1.draw()
  this.layer2.draw()
  this.layer3.draw()
  this.cat.draw(150, 200)

  if this.titleY < 60.0:
    this.titleY += 0.14
  else:
    if int(time) mod 2 == 0:
      DrawText("PRESS A BUTTON", 115, 120, 10, WHITE)
  
  DrawTexture(this.title, int(this.title.width / 2), int(this.titleY), WHITE)

# called when this is unloaded
method unload*(this:SceneIntro) =
  UnLoadTexture(this.title)
  UnloadMusicStream(this.music)
  this.layer1.unload()
  this.layer2.unload()
  this.layer3.unload()
  this.cat.unload()
