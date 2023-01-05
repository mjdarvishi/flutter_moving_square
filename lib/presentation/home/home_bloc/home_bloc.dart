import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';
import 'package:mc_crud_test/domain/usecase/get_customers_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCustomersUseCase _getCustomersUseCase;

  HomeBloc(this._getCustomersUseCase) : super(HomeState()) {
    on<GetCustomerEvent>(_getCustomers);
  }

  //get customers
  Future<void> _getCustomers(
      GetCustomerEvent event, Emitter<HomeState> emit) async {
    List<Customer> customers = await _getCustomersUseCase();
    emit(state.copyWith(customers: customers));
  }
}
