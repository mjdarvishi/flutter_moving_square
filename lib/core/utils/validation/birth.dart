import 'package:formz/formz.dart';

enum BirthValidationError {empty}

class Birth extends FormzInput<DateTime, BirthValidationError> {

  const Birth.dirty(DateTime value) : super.dirty(value);

  @override
  BirthValidationError? validator(DateTime? value) {
    if(value==null){
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

