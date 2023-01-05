import 'package:formz/formz.dart';

enum MobileValidationError { invalid,empty,persian}

class Mobile extends FormzInput<String, MobileValidationError> {
  const Mobile.pure() : super.pure('');

  const Mobile.dirty({String value = ''}) : super.dirty(value);
  static final _tellRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  );

  @override
  MobileValidationError? validator(String? value) {
    String input=value??'';
    if(input.isEmpty){
      return MobileValidationError.empty;
    }
    if(RegExp(r'^[۰۱۲۳۴۵۶۷۸۹]+$').hasMatch(input)) {
      return MobileValidationError.persian;
    }
    return _tellRegex.hasMatch(input)
        ? null
        : MobileValidationError.invalid;
  }
}

extension Explanation on MobileValidationError {
  String get name {
    switch(this){
      case MobileValidationError.persian:
        return 'Just use english number';
      case MobileValidationError.invalid:
        return 'invalid email  format';
      case MobileValidationError.empty:
        return 'input number should not be empty';
    }
  }
}

