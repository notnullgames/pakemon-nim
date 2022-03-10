import raylib
import input
import scenes

# setup initial types
type
  SceneScaffold* = ref object of Scene

# do all initialization
method load*(this:SceneScaffold) =
  echo "load SceneScaffold"

# called in update-loop
method update*(this:SceneScaffold, time: float) =
  discard

# called in draw loop
method draw*(this:SceneScaffold, time: float) =
  ClearBackground(RED)
  DrawText("MENU", 160, 240, 20, WHITE)

# called when this is unloaded
method unload*(this:SceneScaffold) =
  echo "unload SceneScaffold"
