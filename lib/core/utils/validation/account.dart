import 'package:formz/formz.dart';

enum AccountValidationError { empty,min}

class Account extends FormzInput<String, AccountValidationError> {
  const Account.pure() : super.pure('');

  const Account.dirty({String value = ''}) : super.dirty(value);

  @override
  AccountValidationError? validator(String? value) {
    String input=value??'';
    if(input.isEmpty){
      return AccountValidationError.empty;
    }
    if(input.length<8){
      return AccountValidationError.min;
    }
    return null;
  }
}

extension Explanation on AccountValidationError {
  String get errDescription {
    switch(this){
      case AccountValidationError.min:
        return 'account number must be at list 8';
      case AccountValidationError.empty:
        return 'account number input should not be empty';
    }
  }
}

