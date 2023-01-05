import 'package:flutter/material.dart';
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.hourglass_empty,size: 35,),
        SizedBox(height: 20,),
        Text('There is no Customer')
      ],
    );
  }
}
