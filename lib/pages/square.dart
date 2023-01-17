import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:vector_math/vector_math.dart' hide Colors;

Random _rng = Random();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  get randomizedDirection =>
      _randomDirectionWithVelocity((150 + _rng.nextInt(600)).toDouble());

   Ticker? _ticker;
  Duration prevT = Duration.zero;

  late SquareModel _ballModel;

  @override
  void dispose() {
    super.dispose();
    _ticker!.dispose();
  }

  void _init(Size size) {
    _ballModel = SquareModel(
      Vector2(size.width / 2, size.height / 2),
      randomizedDirection,
      16,
    );
    _ticker = createTicker((t) {
      // This sets state and forces a rebuild on every frame. A good optimization would be
      // to only build when the ball changes direction and use AnimatedPositioned to fluidly
      // draw the ball between changes in direction.
      setState(() {
        _ballModel.updateSquare(t - prevT, size);
      });
      prevT = t;
    });
    _ticker!.start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        child: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              // Initialize everything here because we need to access the constraints.
              if (_ticker == null) _init(constraints.biggest);
              return Stack(children: [
                Square(_ballModel),
              ]);
            },
          ),
        ),
        onTap: () => setState(() => _ballModel.v = randomizedDirection),
      ),
    );
  }
}

class SquareModel {
  // The current x,y position of the ball.
  Vector2 p;

  // The direction, including speed in pixels per second, of the ball
  Vector2 v;

  // The radius of the ball.
  double r;

  SquareModel(this.p, this.v, this.r);

  void updateSquare(Duration elapsed, Size size) {
    // Move the ball by v, scaled by what fraction of a second has passed
    // since the last frame.
    p = p + v * (elapsed.inMilliseconds / 1000);
    // If the ball overflows on a given dimension, correct the overflow and update v.
    var newX = _correctOverflow(p.x, r, 0, size.width);
    var newY = _correctOverflow(p.y, r, 0, size.height);
    if (newX != p.x) v.x = -v.x;
    if (newY != p.y) v.y = -v.y;
    p = Vector2(newX, newY);
  }
}

class Square extends StatelessWidget {
  final SquareModel b;

  Square(this.b);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: b.p.x - b.r,
        bottom: b.p.y - b.r,
        child: DecoratedBox(
            decoration:
            BoxDecoration(shape: BoxShape.rectangle, color: Colors.black)),
        width: 2 * b.r,
        height: 2 * b.r);
  }
}

double _correctOverflow(s, r, lowerBound, upperBound) {
  var underflow = s - r - lowerBound;
  // Reflect s across lowerBound.
  if (underflow < 0) return s - 2 * underflow;
  var overflow = s + r - upperBound;
  // Reflect s across upper bound.
  if (overflow > 0) return s - 2 * overflow;
  // No over or underflow, return s.
  return s;
}

Vector2 _randomDirectionWithVelocity(double velocity) {
  return Vector2(_rng.nextDouble() - .5, _rng.nextDouble() - 0.5).normalized() *
      velocity;
}