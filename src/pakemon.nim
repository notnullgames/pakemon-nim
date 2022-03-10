import raylib
import scenes
import scenes/intro

SetTraceLogLevel(LOG_WARNING)
InitWindow(320, 240, "Pakémon")
InitAudioDevice()
SetTargetFPS(60)

currentScene = SceneIntro()
currentScene.load()

while not WindowShouldClose():
  let time = GetTime()
  currentScene.update(time)
  BeginDrawing()
  currentScene.draw(time)
  EndDrawing()

currentScene.unload()
CloseWindow()

