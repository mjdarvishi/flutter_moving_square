import 'package:formz/formz.dart';

enum BirthValidationError {empty}

class Birth extends FormzInput<String, BirthValidationError> {
  const Birth.pure() : super.pure('');

  const Birth.dirty({String value = ''}) : super.dirty(value);

  @override
  BirthValidationError? validator(String? value) {
    String input=value??'';
    if(input.isEmpty){
      return BirthValidationError.empty;
    }
    return null;
  }
}

extension Explanation on BirthValidationError {
  String get errDescription {
    switch(this){
      case BirthValidationError.empty:
        return 'Birth Day should not be empty';
    }
  }
}

