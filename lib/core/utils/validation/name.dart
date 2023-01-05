import 'package:formz/formz.dart';

enum NameValidationError { empty,min}

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty({String value = ''}) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    String input=value??'';
    if(input.isEmpty){
      return NameValidationError.empty;
    }
    if(input.length<2){
      return NameValidationError.min;
    }
    return null;
  }
}

extension Explanation on NameValidationError {
  String get errDescription {
    switch(this){
      case NameValidationError.min:
        return 'length must be at list 2';
      case NameValidationError.empty:
        return 'input should not be empty';
    }
  }
}

