import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:mc_crud_test/pages/component/game_world.dart';


// 1
class Ball extends BodyComponent<GameWorld> {
  // 2
  final Vector2 position;
  final double radius;

  Ball({required this.position, required this.radius});

  // 3
  @override
  Body createBody() {
    // 4
    final bodyDef = BodyDef()
      ..type = BodyType.dynamic
      ..position = position;

    // 5
    final ball = world.createBody(bodyDef);

    // 6
    final shape = CircleShape()..radius = radius;

    // 7
    final fixtureDef = FixtureDef(shape);

    // 8
    ball.createFixture(fixtureDef);
    return ball;
  }
}
