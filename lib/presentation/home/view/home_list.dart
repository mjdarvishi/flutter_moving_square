import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/presentation/home/home_bloc/home_bloc.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return ListView.builder(itemCount: bloc.state.customers.length,
      itemBuilder: (context, index) =>Container(),);
  }
}
