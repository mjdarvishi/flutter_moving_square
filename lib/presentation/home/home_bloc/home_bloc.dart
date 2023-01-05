import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';
import 'package:mc_crud_test/domain/usecase/delete_customers_usecase.dart';
import 'package:mc_crud_test/domain/usecase/get_customers_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCustomersUseCase _getCustomersUseCase;
  final DeleteCustomersUseCase _deleteCustomersUseCase;

  HomeBloc(this._getCustomersUseCase, this._deleteCustomersUseCase)
      : super(HomeState()) {
    on<GetCustomerEvent>(_getCustomers);
    on<DeleteCustomerEvent>(_deleteCustomer);
  }

  //get customers
  Future<void> _getCustomers(
      GetCustomerEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(state: HomePageState.loading));
    List<Customer> customers = await _getCustomersUseCase();
    emit(state.copyWith(
        customers: customers,
        state: customers.isEmpty ? HomePageState.empty : HomePageState.home));
  }

  Future<void> _deleteCustomer(
      DeleteCustomerEvent event, Emitter<HomeState> emit) async {
    await _deleteCustomersUseCase(params: event.customer);
    add(GetCustomerEvent());
  }
}
