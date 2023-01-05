import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud_test/core/utils/validation/account.dart';
import 'package:mc_crud_test/core/utils/validation/email.dart';
import 'package:mc_crud_test/core/utils/validation/mobile.dart';
import 'package:mc_crud_test/core/utils/validation/name.dart';
import 'package:mc_crud_test/injector.dart';
import 'package:mc_crud_test/presentation/add_customer/add_customer_bloc/add_customer_bloc.dart';
import 'package:mc_crud_test/presentation/add_customer/view/custom_text_field.dart';

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
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const Align(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Add New Customer'),
                          ),
                        ),
                        // First name
                        CustomTextField(
                            (value) => context
                                .read<AddCustomerBloc>()
                                .add(OnFirstNameChangeEvent(value)),
                            state.firstName?.value ?? '',
                            state.firstName?.error?.errDescription,
                            'First Name'),
                        // Last name
                        CustomTextField(
                            (value) => context
                                .read<AddCustomerBloc>()
                                .add(OnLastNameChangeEvent(value)),
                            state.lastName?.value ?? '',
                            state.lastName?.error?.errDescription,
                            'Last Name'),
                        // MobileNumber
                        CustomTextField(
                            (value) => context
                                .read<AddCustomerBloc>()
                                .add(OnMobileChangeEvent(value)),
                            state.mobile?.value ?? '',
                            state.mobile?.error?.errDescription,
                            'mobile like: 0913*******'),
                        // Email
                        CustomTextField(
                            (value) => context
                                .read<AddCustomerBloc>()
                                .add(OnEmailChangeEvent(value)),
                            state.email?.value ?? '',
                            state.email?.error?.errDescription,
                            'Email'),
                        // BankAccountNumber
                        CustomTextField(
                            (value) => context
                                .read<AddCustomerBloc>()
                                .add(OnBackNumberChangeEvent(value)),
                            state.accountNumber?.value ?? '',
                            state.accountNumber?.error?.errDescription,
                            'BankAccountNumber'),
                        if (state.dateOfBirth != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Date of birth is: ${state.dateOfBirth!.value.toString().split(' ')[0]}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        OutlinedButton(
                          onPressed: () async {
                            final DateTime selectedDate =
                                state.dateOfBirth?.value ?? DateTime.now();
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(1920, 8),
                                lastDate: DateTime(2021, 8));
                            if (picked != null && picked != selectedDate) {
                              context
                                  .read<AddCustomerBloc>()
                                  .add(OnDateOfBirthNumberChangeEvent(picked));
                            }
                          },
                          child: Text(state.dateOfBirth == null
                              ? 'Select Date Of Birth'
                              : 'Edit date of birth'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton(
                        onPressed: state.formZ.isValid ? ()=>context.read<AddCustomerBloc>().add(SubmitEvent()) : null,
                        child: const Text('ADD CUSTOMER')),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
