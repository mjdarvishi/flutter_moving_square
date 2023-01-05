import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud_test/core/utils/validation/account.dart';
import 'package:mc_crud_test/core/utils/validation/birth.dart';
import 'package:mc_crud_test/core/utils/validation/email.dart';
import 'package:mc_crud_test/core/utils/validation/mobile.dart';
import 'package:mc_crud_test/core/utils/validation/name.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';
import 'package:mc_crud_test/domain/usecase/add_customers_usecase.dart';

part 'add_customer_event.dart';

part 'add_customer_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  final AddCustomersUseCase _addCustomersUseCase;

  AddCustomerBloc(this._addCustomersUseCase) : super(AddCustomerState()) {
    on<OnFirstNameChangeEvent>(_fistNameChange);
    on<OnLastNameChangeEvent>(_lastNameChange);
    on<OnMobileChangeEvent>(_mobileChange);
    on<OnEmailChangeEvent>(_emailChange);
    on<OnBackNumberChangeEvent>(_accountChange);
    on<OnDateOfBirthNumberChangeEvent>(_birthChange);

    on<SubmitEvent>(_submit);
  }

  void _submit(SubmitEvent event, Emitter<AddCustomerState> emit) {
    _addCustomersUseCase(
        params: Customer(
            state.firstName!.value,
            state.lastName!.value,
            state.dateOfBirth!.value.toString().split(' ')[0],
            state.mobile!.value,
            state.email!.value,
            state.accountNumber!.value));
  }

  void _fistNameChange(
      OnFirstNameChangeEvent event, Emitter<AddCustomerState> emit) {
    final firstName = Name.dirty(value: event.value);
    emit(state.copyWith(firstName: firstName));
    emit(state.copyWith(formZ: _validation()));
  }

  void _lastNameChange(
      OnLastNameChangeEvent event, Emitter<AddCustomerState> emit) {
    final lastName = Name.dirty(value: event.value);
    emit(state.copyWith(lastName: lastName));
    emit(state.copyWith(formZ: _validation()));
  }

  void _mobileChange(
      OnMobileChangeEvent event, Emitter<AddCustomerState> emit) {
    final mobile = Mobile.dirty(value: event.value);
    emit(state.copyWith(mobile: mobile));
    emit(state.copyWith(formZ: _validation()));
  }

  void _emailChange(OnEmailChangeEvent event, Emitter<AddCustomerState> emit) {
    final email = Email.dirty(value: event.value);
    emit(state.copyWith(email: email));
    emit(state.copyWith(formZ: _validation()));
  }

  void _accountChange(
      OnBackNumberChangeEvent event, Emitter<AddCustomerState> emit) {
    final account = Account.dirty(value: event.value);
    emit(state.copyWith(accountNumber: account));
    emit(state.copyWith(formZ: _validation()));
  }

  void _birthChange(
      OnDateOfBirthNumberChangeEvent event, Emitter<AddCustomerState> emit) {
    final birthDay = Birth.dirty(event.value);
    emit(state.copyWith(dateOfBirth: birthDay));
    emit(state.copyWith(formZ: _validation()));
  }

  FormzStatus _validation() {
    if (state.dateOfBirth?.value == null) {
      return FormzStatus.invalid;
    }
    return Formz.validate([
      state.firstName ?? const Name.pure(),
      state.lastName ?? const Name.pure(),
      state.mobile ?? const Mobile.pure(),
      state.email ?? const Email.pure(),
      state.accountNumber ?? const Account.pure(),
    ]);
  }
}
