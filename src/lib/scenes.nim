import lib/raylib
import lib/parallax
import lib/sprite

type
  Scene* = ref object of RootObj
  SceneIntro* = ref object of Scene
    music*: Music
    title*: Texture2D
    titleY*: float
    layer1*: ParalaxLayer
    layer2*: ParalaxLayer
    layer3*: ParalaxLayer
    cat*: Spritesheet
  SceneMenuTop* = ref object of Scene
    lists*:seq[string]
    icons*:seq[Texture2D]
    currentListItem*: int
    listenRight*: bool
    listenLeft*: bool
    runtime*: float
  SceneMenuList* = ref object of Scene
    list*: string
    currentListItem*: int
    games*:seq[string]
    parentListItem*: int
    listenUp*: bool
    listenDown*: bool
    runtime*: float

# this is the global current scene
var currentScene*: Scene

# do all initialization
method load*(this:Scene) {.base.} =
  discard

# called in update-loop
method update*(this:Scene, time: float) {.base.} =
  discard

# called in draw-loop
method draw*(this:Scene, time: float) {.base.} =
  discard

# called when this is unloaded
method unload*(this:Scene) {.base.} =
  discard

# switch to a new scene
method set_scene*(this:Scene, s:Scene) {.base.} =
  this.unload()
  currentScene = s
  currentScene.load()

import scenes/intro
import scenes/menu_list
import scenes/menu_top
