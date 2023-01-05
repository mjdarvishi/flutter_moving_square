import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/injector.dart';
import 'package:mc_crud_test/presentation/add_customer/add_customer_bloc/add_customer_bloc.dart';

class AddCustomerPage extends StatelessWidget {
  const AddCustomerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => injector<AddCustomerBloc>(),
          child: BlocBuilder<AddCustomerBloc, AddCustomerState>(
            builder: (context, state) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  // First name
                  customTextField((value) {}, '', 'err', 'First Name'),
                  // Last name
                  customTextField((value) {}, '', 'err', 'Last Name'),
                  // PhoneNumber
                  customTextField((value) {}, '', 'err', '0913*******'),
                  // Email
                  customTextField((value) {}, '', 'err', 'Email'),
                  // BankAccountNumber
                  customTextField((value) {}, '', 'err', 'BankAccountNumber'),
                  OutlinedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('Select Date Of Birth'),
                  ),
                ],
              ),
            ),
          )),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {

    }
  }


  Widget customTextField(Function(String value) onChange, String initValue,
      String err, String hint) {
    return TextFormField(
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
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        errorStyle: const TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
        fillColor: Colors.transparent,
      ),
    );
  }
}
