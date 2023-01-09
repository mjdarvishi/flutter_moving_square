import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:mc_crud_test/pages/component/arena.dart';

class GameWorld extends Forge2DGame {
  @override
  Future<void> onLoad() async {
    await _initializeGame();
  }
  Future<void> _initializeGame() async {
    final arena = Arena();
    await add(arena);
  }
}