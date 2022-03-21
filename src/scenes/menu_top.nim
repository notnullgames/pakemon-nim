import lib/raylib
import lib/input
import lib/scenes
import lib/utils
import std/strutils
import std/os
import std/re
import std/strformat

# see lib/scenes for definition

# do all initialization
method load*(this:SceneMenuTop) =
  # run each list function
  for lister in walkDir("games"):
    if lister.kind == pcDir:
      let name = lister.path.replace(re"^games/")
      this.lists.add(name)
      let fname = fmt"games/{name}/icon.png"
      if existsFile(fname):
        this.icons.add(LoadTexture(fname))
      else:
        this.icons.add(LoadTexture("assets/unknown_icon.png"))

  this.currentListItem = 0

  # just handle a single directional press
  this.listenLeft = true
  this.listenRight = true
  this.runtime = 0

# called in update-loop
method update*(this:SceneMenuTop, time: float) =
  this.runtime += GetFrameTime()
  if buttonUp("left"):
    this.listenLeft = true
  if buttonUp("right"):
    this.listenRight = true
  if buttonDown("left") and this.listenLeft:
    this.listenLeft = false
    this.currentListItem = lmod(this.currentListItem - 1, len(this.lists))
  if buttonDown("right") and this.listenRight:
    this.listenRight = false
    this.currentListItem = lmod(this.currentListItem + 1, len(this.lists))
  if buttonDown("a") and this.runtime > 2:
    this.set_scene(SceneMenuList(list: this.lists[this.currentListItem], parentListItem: this.currentListItem, currentListItem: 0 ))

# called in draw loop
method draw*(this:SceneMenuTop, time: float) =
  ClearBackground(BLACK)
  let textwidth = MeasureText(this.lists[this.currentListItem], 30)
  let icon = this.icons[this.currentListItem]
  DrawText(this.lists[this.currentListItem], 160-int(textwidth/2), 20, 30, WHITE)
  DrawTexture(icon, 160 - int(icon.width / 2), 120 - int(icon.width / 2), WHITE)

# called when this is unloaded
method unload*(this:SceneMenuTop) =
  for icon in this.icons:
    UnloadTexture(icon)
