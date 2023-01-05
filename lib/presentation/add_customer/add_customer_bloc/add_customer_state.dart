part of 'add_customer_bloc.dart';

class AddCustomerState extends Equatable {
  final Name? firstName;
  final Name? lastName;
  final Account? accountNumber;
  final Email? email;
  final Mobile? mobile;
  final String dateOfBirth;

  @override
  List<Object?> get props =>
      [firstName, lastName, accountNumber, email, mobile, dateOfBirth];

  const AddCustomerState(
      {this.dateOfBirth = '',
      this.mobile,
      this.email,
      this.accountNumber,
      this.lastName,
      this.firstName});

  AddCustomerState copyWith({
    Name? firstName,
    Name? lastName,
    Account? accountNumber,
    Email? email,
    Mobile? mobile,
    String? dateOfBirth,
  }) {
    return AddCustomerState(
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        accountNumber: accountNumber ?? this.accountNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }
}
