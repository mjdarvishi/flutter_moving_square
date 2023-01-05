import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_customer_event.dart';
part 'add_customer_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  AddCustomerBloc() : super(AddCustomerState()) {
    on<AddCustomerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
