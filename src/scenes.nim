type
  Scene* = ref object of RootObj

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
