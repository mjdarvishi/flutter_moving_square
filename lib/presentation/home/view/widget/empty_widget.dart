import 'package:flutter/material.dart';
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.hourglass_empty,size: 50,),
          SizedBox(height: 20,),
          Text('There is no Customer',)
        ],
      ),
    );
  }
}
