import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/core/utils/validation/account.dart';
import 'package:mc_crud_test/core/utils/validation/email.dart';
import 'package:mc_crud_test/core/utils/validation/mobile.dart';
import 'package:mc_crud_test/core/utils/validation/name.dart';

part 'add_customer_event.dart';
part 'add_customer_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  AddCustomerBloc() : super(AddCustomerState()) {
    on<AddCustomerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
