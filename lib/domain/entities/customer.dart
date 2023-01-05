import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';

@entity
class Customer {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String firstname;
  final String lastname;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;

  Customer(this.firstname, this.lastname, this.dateOfBirth,
      this.phoneNumber, this.email, this.bankAccountNumber,{this.id});
}