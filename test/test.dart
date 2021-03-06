/*
  Copyright (C) 2013 John McCutchan <john@johnmccutchan.com>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

import 'dart:html';
import 'package:game_loop/game_loop.dart';

GameLoop gameLoop;

void update(GameLoop gameLoop) {
  bool mouseDown = gameLoop.mouse.isDown(GameLoopMouse.LEFT);
  if (mouseDown) {
    print('left down.');
  }
  bool down = gameLoop.keyboard.isDown(GameLoopKeyboard.D);
  double timePressed = gameLoop.keyboard.timePressed(GameLoopKeyboard.D);
  double timeReleased = gameLoop.keyboard.timeReleased(GameLoopKeyboard.D);
  if (gameLoop.keyboard.released(GameLoopKeyboard.D)) {
    print('D down: $down $timePressed $timeReleased');
    //gameLoop.enableFullscreen(true);
  }
  print('frame: ${gameLoop.frame}');
  print('gameTime: ${gameLoop.gameTime}');
  print('time: ${gameLoop.time}');
  print('dt: ${gameLoop.dt}');
}

void render(GameLoop gameLoop) {
  print('Interpolation factor: ${gameLoop.renderInterpolationFactor}');
}

GameLoopTimer timer1;
GameLoopTimer timer2;

void timerFired(GameLoopTimer timer) {
  if (timer == timer1) {
    print('timer1 fired.');
  } else if (timer == timer2) {
    print('timer2 fired.');
  }
}

main() {
  gameLoop = new GameLoop(query('#gameElement'));
  gameLoop.onUpdate = update;
  gameLoop.onRender = render;
  gameLoop.start();
  timer1 = gameLoop.addTimer(timerFired, 2.5);
  timer2 = gameLoop.addTimer(timerFired, 0.5);
}