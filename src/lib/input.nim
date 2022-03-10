# This handles mapped input (imaginary SNES ontroller)
# currently it only supports keys, but eventually it will support joypads

# echo buttonDown("a", "b", "x", "y", "start", "select")
# echo buttonUp("a")

import raylib
import std/tables
import std/strutils

var keyMap* = {
  "A": KEY_Z,
  "B": KEY_X,
  "X": KEY_A,
  "Y": KEY_S,
  "R": KEY_Q,
  "L": KEY_W,
  "START": KEY_ENTER,
  "SELECT": KEY_TAB,
  "UP": KEY_UP,
  "DOWN": KEY_DOWN,
  "LEFT": KEY_LEFT,
  "RIGHT": KEY_RIGHT
}.toTable

# check if 1 or many buttons are down
proc buttonDown*(buttons: varargs[string]): bool =
  var pressed = false
  for k in buttons:
    let K = k.toUpperAscii()
    if K in keyMap and IsKeyDown(keyMap[K]):
      pressed = true
      break
  return pressed

# check if 1 or many buttons are up
proc buttonUp*(buttons: varargs[string]): bool =
  var pressed = false
  for k in buttons:
    let K = k.toUpperAscii()
    if K in keyMap and IsKeyUp(keyMap[K]):
      pressed = true
      break
  return pressed
