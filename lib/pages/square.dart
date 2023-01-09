import 'package:flutter/material.dart';
import 'package:mc_crud_test/utils/context_utils.dart';

class SquareWidget extends StatefulWidget {
  SquareWidget({Key? key}) : super(key: key);

  @override
  State<SquareWidget> createState() => _SquareWidgetState();
}

class _SquareWidgetState extends State<SquareWidget>
    with TickerProviderStateMixin {
  late AnimationController _horizontalAnimationController;
  late AnimationController _verticalAnimationController;
   Animation<double>? _horizontalAnimation;
   Animation<double>?_verticalAnimation;

  late final width;
  late final height;
  late final widthStart;
  late final heightStart;

  void initState() {
    super.initState();
    width = MediaQuery.of(ApplicationContext.navigatorKey.currentContext!)
        .size
        .width;
    height = MediaQuery.of(ApplicationContext.navigatorKey.currentContext!)
        .size
        .height;
    widthStart=width * .5 - 25;
    heightStart= height * .5 - 25;

    _horizontalAnimationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _verticalAnimationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _horizontalAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _horizontalAnimationController.reverse();
      }
    });
    _verticalAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _verticalAnimationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          print(details.delta);
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            _verticalAnimation=null;
            _horizontalAnimation =
                Tween<double>(begin:widthStart , end: width - 50)
                    .animate(_horizontalAnimationController);
            _horizontalAnimationController.forward();
          }

          // Swiping in left direction.
          if (details.delta.dx < 0) {
            _verticalAnimation=null;
            _horizontalAnimation = Tween<double>(begin:widthStart, end: 0)
                .animate(_horizontalAnimationController);
            _horizontalAnimationController.forward();
          }
          // Swiping in top direction.
          if (details.delta.dy > 0) {
            _horizontalAnimation=null;
            _verticalAnimation =
                Tween<double>(begin:heightStart, end: height)
                    .animate(_verticalAnimationController);

            _verticalAnimationController.forward();
          }

          // Swiping in bottom direction.
          if (details.delta.dy < 0) {
            _horizontalAnimation=null;
            _verticalAnimation = Tween<double>(begin:heightStart, end: 0)
                .animate(_verticalAnimationController);

            _verticalAnimationController.forward();

          }
        },
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              AnimatedBuilder(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                  animation: _horizontalAnimationController,
                  builder: (context, child) => Positioned(
                        top: _verticalAnimation?.value??heightStart,
                        left: _horizontalAnimation?.value??widthStart,
                        child: child!,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
