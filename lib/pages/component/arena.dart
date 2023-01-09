import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:mc_crud_test/pages/component/game_world.dart';


// 1
class Arena extends BodyComponent<GameWorld> {
  Vector2? size;

  // 2
  Arena({this.size}) {
    assert(size == null || size!.x >= 1.0 && size!.y >= 1.0);
  }

  late Vector2 arenaSize;

  // 3
  @override
  Future<void> onLoad() {
    arenaSize = size ?? gameRef.size;
    return super.onLoad();
  }

  // 4
  @override
  Body createBody() {
    final bodyDef = BodyDef()
      ..position = Vector2(0, 0)
      ..type = BodyType.static;

    final arenaBody = world.createBody(bodyDef);

    // 5
    final vertices = <Vector2>[
      arenaSize,
      Vector2(0, arenaSize.y),
      Vector2(0, 0),
      Vector2(arenaSize.x, 0),
    ];

    // 6
    final chain = ChainShape()..createLoop(vertices);

    // 7
    for (var index = 0; index < chain.childCount; index++) {
      arenaBody.createFixture(FixtureDef(chain.childEdge(index)));
    }

    return arenaBody;
  }
}