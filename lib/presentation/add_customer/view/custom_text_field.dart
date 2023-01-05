import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  Function(String value) onChange;
  String initValue;
  String? err;
  String hint;

  CustomTextField(this.onChange, this.initValue, this.err, this.hint);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onChanged: onChange,
        initialValue: initValue,
        decoration: InputDecoration(
          errorText: err,
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          focusColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          errorStyle: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}
