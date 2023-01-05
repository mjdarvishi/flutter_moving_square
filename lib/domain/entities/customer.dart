import 'package:floor/floor.dart';

@entity
class Customer {
  @primaryKey
  final int id;
  final String firstname;
  final String lastname;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;

  Customer(this.id, this.firstname, this.lastname, this.dateOfBirth,
      this.phoneNumber, this.email, this.bankAccountNumber);
}