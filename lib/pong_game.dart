import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PongGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  static final paint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  @override
  Future<void>? onLoad() {
    camera.viewport = FixedResolutionViewport(Vector2(512, 256));
    return super.onLoad();
  }

  @override
  @mustCallSuper
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    super.onKeyEvent(event, keysPressed);

    return KeyEventResult.handled;
  }
}
