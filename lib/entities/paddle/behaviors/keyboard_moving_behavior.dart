import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/services.dart';
import 'package:pong_game/components/components.dart';
import 'package:pong_game/entities/entities.dart';

class KeyboardMovingBehavior extends Behavior<Paddle>
    with KeyboardHandler, HasGameRef {
  KeyboardMovingBehavior({
    this.speed = 100,
    required this.upKey,
    required this.downKey,
  });

  final LogicalKeyboardKey upKey;
  final LogicalKeyboardKey downKey;
  final double speed;

  double _movement = 0;

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(upKey)) {
      _movement = -1;
    } else if (keysPressed.contains(downKey)) {
      _movement = 1;
    } else {
      _movement = 0;
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    parent.position.y += _movement * speed * dt;

    parent.position.y = parent.position.y.clamp(
      parent.size.y / 2 + Field.halfWidth,
      gameRef.size.y - parent.size.y / 2 - Field.halfWidth,
    );

    super.update(dt);
  }
}
