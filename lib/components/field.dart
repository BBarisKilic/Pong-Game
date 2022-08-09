import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pong_game/pong_game.dart';

class Field extends Component with HasGameRef {
  static const width = 8.0;

  static const halfWidth = width / 2;

  static const backgroundColor = Color(0xFF363636);

  static final _lineRect = Vector2.zero() & Vector2(halfWidth, width);

  static final _foregroundPaint = Paint()
    ..color = PongGame.paint.color
    ..strokeWidth = width
    ..isAntiAlias = false
    ..style = PongGame.paint.style;

  static final _backgroundPaint = Paint()
    ..color = backgroundColor
    ..isAntiAlias = false;

  static final _linePaint = Paint()
    ..color = PongGame.paint.color
    ..isAntiAlias = false;

  late Rect _gameRect;

  @override
  void onGameResize(Vector2 size) {
    _gameRect = Vector2.zero() & gameRef.size;
    super.onGameResize(size);
  }

  @override
  void render(Canvas canvas) {
    canvas
      ..save()
      ..drawRect(_gameRect, _backgroundPaint)
      ..drawRect(_gameRect, _foregroundPaint)
      ..translate(gameRef.size.x / 2 - _lineRect.width / 2, halfWidth);

    for (var i = 0; i < gameRef.size.y / width; i++) {
      canvas
        ..drawRect(_lineRect, _linePaint)
        ..translate(0, width * 2);
    }

    canvas.restore();
    super.render(canvas);
  }
}
