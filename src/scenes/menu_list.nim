import lib/raylib
import lib/input
import lib/scenes
import lib/utils
import std/strformat
import std/strutils
import std/math
import std/os
import std/osproc

# see lib/scenes for definition

# do all initialization
method load*(this:SceneMenuList) =
  this.currentListItem = 0
  this.games = splitLines(strip(execProcess("./list", fmt"games/{this.list}")))

  # just handle a single directional press
  this.listenUp = true
  this.listenDown = true
  this.runtime = 0

# called in update-loop
method update*(this:SceneMenuList, time: float) =
  this.runtime += GetFrameTime()
  if buttonUp("up"):
    this.listenUp = true
  if buttonUp("down"):
    this.listenDown = true
  if buttonDown("up") and this.listenUp:
    this.listenUp = false
    this.currentListItem = lmod(this.currentListItem - 1, len(this.games))
  if buttonDown("down") and this.listenDown:
    this.listenDown = false
    this.currentListItem = lmod(this.currentListItem + 1, len(this.games))
  if buttonDown("a", "start") and this.runtime > 2:
    this.runtime = 0
    echo execProcess(fmt"./run '{this.games[this.currentListItem]}'", fmt"games/{this.list}")
  if buttonDown("b"):
    this.set_scene(SceneMenuTop(currentListItem:this.parentListItem ))

# called in draw loop
method draw*(this:SceneMenuList, time: float) =
  ClearBackground(BLACK)
  let page = int(floor(this.currentListItem / 18))
  let pageStart = page * 18
  DrawRectangle(0, 10 + ((this.currentListItem mod 18) * 12), 320, 10, BLUE);
  for i in pageStart..(pageStart + 17):
    DrawText(this.games[i], 10, 10 + ((i mod 18)*12), 8, WHITE)

