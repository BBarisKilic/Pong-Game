import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/services.dart';
import 'package:pong_game/entities/paddle/behaviors/behaviors.dart';
import 'package:pong_game/pong_game.dart';

class Paddle extends Entity {
  Paddle._({
    required Vector2 center,
    required Behavior movingBehavior,
  }) : super(
          position: center,
          size: _paddleSize,
          anchor: Anchor.center,
          behaviors: [movingBehavior],
          children: [
            RectangleComponent.relative(
              Vector2.all(1),
              parentSize: _paddleSize,
              paint: PongGame.paint,
            ),
            RectangleHitbox()
          ],
        );

  Paddle._withKeys({
    required Vector2 center,
    required LogicalKeyboardKey upKey,
    required LogicalKeyboardKey downKey,
  }) : this._(
          center: center,
          movingBehavior:
              KeyboardMovingBehavior(upKey: upKey, downKey: downKey),
        );

  Paddle.arrows({
    required Vector2 center,
  }) : this._withKeys(
          center: center,
          upKey: LogicalKeyboardKey.arrowUp,
          downKey: LogicalKeyboardKey.arrowDown,
        );

  Paddle.wasd({
    required Vector2 center,
  }) : this._withKeys(
          center: center,
          upKey: LogicalKeyboardKey.keyW,
          downKey: LogicalKeyboardKey.keyS,
        );

  static final Vector2 _paddleSize = Vector2(8, 50);
}
