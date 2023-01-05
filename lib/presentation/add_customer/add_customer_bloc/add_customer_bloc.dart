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
    on<OnFirstNameChangeEvent>(_fistNameChange);
    on<OnLastNameChangeEvent>(_lastNameChange);
    on<OnMobileChangeEvent>(_mobileChange);
    on<OnEmailChangeEvent>(_emailChange);
    on<OnBackNumberChangeEvent>(_accountChange);
    on<OnDateOfBirthNumberChangeEvent>(_birthChange);
  }
  void _fistNameChange(OnFirstNameChangeEvent event,Emitter<AddCustomerState> emit){

  }
    void _lastNameChange(OnLastNameChangeEvent event,Emitter<AddCustomerState> emit){

  }
    void _mobileChange(OnMobileChangeEvent event,Emitter<AddCustomerState> emit){

  }
    void _emailChange(OnEmailChangeEvent event,Emitter<AddCustomerState> emit){

  }
    void _accountChange(OnBackNumberChangeEvent event,Emitter<AddCustomerState> emit){

  }
    void _birthChange(OnDateOfBirthNumberChangeEvent event,Emitter<AddCustomerState> emit){

  }

}
