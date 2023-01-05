import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetCustomerEvent>(_getCustomers);
  }

  Future<void> _getCustomers(
      GetCustomerEvent event, Emitter<HomeState> emit) async {

  }
}
