part of 'add_customer_bloc.dart';

class AddCustomerState extends Equatable {
  final Name? firstName;
  final Name? lastName;
  final Account? accountNumber;
  final Email? email;
  final Mobile? mobile;
  final Birth? dateOfBirth;
  final FormzStatus formZ;
  final String ?err;
  @override
  List<Object?> get props =>
      [firstName, lastName, accountNumber, email, mobile, dateOfBirth,formZ,err];

  const AddCustomerState(
      {this.dateOfBirth ,
      this.mobile,
      this.email,
      this.accountNumber,
        this.err,
        this.formZ=FormzStatus.pure,
      this.lastName,
      this.firstName});

  AddCustomerState copyWith({
    Name? firstName,
    Name? lastName,
    Account? accountNumber,
    Email? email,
    Mobile? mobile,
    FormzStatus ?formZ,
    Birth? dateOfBirth,
    String ?err
  }) {
    return AddCustomerState(
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        formZ: formZ??this.formZ,
        err: err??this.err,
        accountNumber: accountNumber ?? this.accountNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }
}
