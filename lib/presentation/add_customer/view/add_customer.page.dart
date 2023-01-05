import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/utils/validation/account.dart';
import 'package:mc_crud_test/core/utils/validation/email.dart';
import 'package:mc_crud_test/core/utils/validation/mobile.dart';
import 'package:mc_crud_test/core/utils/validation/name.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Add New Customer'),
                    ),
                    // First name
                    customTextField(
                        (value) => context
                            .read<AddCustomerBloc>()
                            .add(OnFirstNameChangeEvent(value)),
                        state.firstName?.value??'',
                        state.firstName?.error?.errDescription,
                        'First Name'),
                    // Last name
                    customTextField(
                            (value) => context
                            .read<AddCustomerBloc>()
                            .add(OnLastNameChangeEvent(value)),
                        state.lastName?.value??'',
                        state.lastName?.error?.errDescription, 'Last Name'),
                    // MobileNumber
                    customTextField(  (value) => context
                        .read<AddCustomerBloc>()
                        .add(OnMobileChangeEvent(value)),
                        state.mobile?.value??'',
                        state.mobile?.error?.errDescription, 'mobile like: 0913*******'),
                    // Email
                    customTextField(  (value) => context
                        .read<AddCustomerBloc>()
                        .add(OnEmailChangeEvent(value)),
                        state.email?.value??'',
                        state.email?.error?.errDescription, 'Email'),
                    // BankAccountNumber
                    customTextField(  (value) => context
                        .read<AddCustomerBloc>()
                        .add(OnBackNumberChangeEvent(value)),
                        state.accountNumber?.value??'',
                        state.accountNumber?.error?.errDescription, 'BankAccountNumber'),
                    OutlinedButton(
                      onPressed: () => _selectDate(context),
                      child: const Text('Select Date Of Birth'),
                    ),
                  ],
                ),
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
      print(picked);
    }
  }

  Widget customTextField(Function(String value) onChange, String initValue,
      String ?err, String hint) {
    return Padding(
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
