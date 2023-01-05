import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/injector.dart';
import 'package:mc_crud_test/presentation/home/home_bloc/home_bloc.dart';
import 'package:mc_crud_test/presentation/home/view/home_list.dart';
import 'package:mc_crud_test/presentation/home/view/widget/empty_widget.dart';
import 'package:mc_crud_test/presentation/home/view/widget/loading_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final bloc = injector<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) =>
            Scaffold(
              floatingActionButton: FloatingActionButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/add', arguments: () {
                        Navigator.pop(context);
                        bloc.add(GetCustomerEvent());
                      }),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              body: BlocProvider(
                  create: (context) =>
                  bloc..add(GetCustomerEvent()),
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      switch (state.state) {
                        case HomePageState.loading:
                          return const LoadingWidget();
                        case HomePageState.home:
                          return const HomeList();
                        case HomePageState.empty:
                          return const EmptyWidget();
                      }
                    },
                  )),
            ));
  }
}
