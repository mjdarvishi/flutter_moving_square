part of 'add_customer_bloc.dart';

abstract class AddCustomerEvent extends Equatable {
  @override
  List<Object> get props => [];

  const AddCustomerEvent();
}

class OnFirstNameChangeEvent extends AddCustomerEvent {
  final String value;

  const OnFirstNameChangeEvent(this.value);
}

class OnLastNameChangeEvent extends AddCustomerEvent {
  final String value;

  const OnLastNameChangeEvent(this.value);
}

class OnMobileChangeEvent extends AddCustomerEvent {
  final String value;

  const OnMobileChangeEvent(this.value);
}

class OnEmailChangeEvent extends AddCustomerEvent {
  final String value;

  const OnEmailChangeEvent(this.value);
}

class OnBackNumberChangeEvent extends AddCustomerEvent {
  final String value;

  const OnBackNumberChangeEvent(this.value);
}

class OnDateOfBirthNumberChangeEvent extends AddCustomerEvent {
  final DateTime value;

  const OnDateOfBirthNumberChangeEvent(this.value);
}
class SubmitEvent extends AddCustomerEvent{
}
class UpdateEvent extends AddCustomerEvent{
  final Customer customer;

  UpdateEvent(this.customer);
}
class InitEvent extends AddCustomerEvent{
  final Customer customer;

  InitEvent(this.customer);
}

