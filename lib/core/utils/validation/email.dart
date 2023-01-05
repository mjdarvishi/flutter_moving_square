import 'package:formz/formz.dart';

enum EmailValidationError { invalid,empty,persian}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty({String value = ''}) : super.dirty(value);
  static final _tellRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  );

  @override
  EmailValidationError? validator(String? value) {
    String input=value??'';
    if(input.isEmpty){
      return EmailValidationError.empty;
    }
    if(RegExp(r'^[۰۱۲۳۴۵۶۷۸۹]+$').hasMatch(input)) {
      return EmailValidationError.persian;
    }
    return _tellRegex.hasMatch(input)
        ? null
        : EmailValidationError.invalid;
  }
}

extension Explanation on EmailValidationError {
  String get errDescription {
    switch(this){
      case EmailValidationError.persian:
        return 'Just use english number';
      case EmailValidationError.invalid:
        return 'invalid email  format';
      case EmailValidationError.empty:
        return 'input number should not be empty';
    }
  }
}

