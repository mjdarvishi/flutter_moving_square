import 'package:formz/formz.dart';
import 'package:mc_crud_test/data/data_sources/local/database.dart';
import 'package:mc_crud_test/injector.dart';

enum MobileValidationError { invalid, min, empty, persian }

class Mobile extends FormzInput<String, MobileValidationError> {
  const Mobile.pure() : super.pure('');

  const Mobile.dirty({String value = ''}) : super.dirty(value);
  static final _tellRegex = RegExp(
      r'(^(0|\+98)?([ ]|-|[()]){0,2}9[0|1|2|3|4|9]([ ]|-|[()]){0,2}(?:[0-9]([ ]|-|[()]){0,2}){8}$)');

  @override
  MobileValidationError? validator(String? value){
    String input = value ?? '';
    if (input.isEmpty) {
      return MobileValidationError.empty;
    }
    if (RegExp(r'^[۰۱۲۳۴۵۶۷۸۹]+$').hasMatch(input)) {
      return MobileValidationError.persian;
    }
    if (input.length < 11) {
      return MobileValidationError.min;
    }
    if (!_tellRegex.hasMatch(input)) {
      return MobileValidationError.invalid;
    }
    return null;
  }
}

extension Explanation on MobileValidationError {
  String get errDescription {
    switch (this) {
      case MobileValidationError.persian:
        return 'Just use english number';
      case MobileValidationError.invalid:
        return 'invalid format';
      case MobileValidationError.min:
        return 'min length must be 11';
      case MobileValidationError.empty:
        return 'input email should not be empty';
    }
  }
}
