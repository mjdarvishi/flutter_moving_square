import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud_test/core/utils/validation/account.dart';
import 'package:mc_crud_test/core/utils/validation/email.dart';
import 'package:mc_crud_test/core/utils/validation/mobile.dart';
import 'package:mc_crud_test/core/utils/validation/name.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';
import 'package:mc_crud_test/injector.dart';
import 'package:mc_crud_test/presentation/add_customer/add_customer_bloc/add_customer_bloc.dart';
import 'package:mc_crud_test/presentation/add_customer/view/custom_text_field.dart';

class AddCustomerPage extends StatelessWidget {
  final Customer? customer;

  const AddCustomerPage({this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) {
            return injector<AddCustomerBloc>()..add(InitEvent(customer));
          },
          child: BlocBuilder<AddCustomerBloc, AddCustomerState>(
            builder: (context, state) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  if(state.dataInitialized)
                  Expanded(
                    child: ListView(
                      children: [
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(customer == null
                                ? 'Add New Customer'
                                : 'Update Customer'),
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
                                lastDate: DateTime.now());
                            if (picked != null && picked != selectedDate) {
                              context
                                  .read<AddCustomerBloc>()
                                  .add(OnDateOfBirthNumberChangeEvent(picked));
                            }
                          },
                          child: Text(state.dateOfBirth == null
                              ? 'Select Date Of Birth'
                              : 'Edit date of birth'),
                        ),
                        for (var item in state.err)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              item,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton(
                        onPressed: state.formZ.isValid
                            ? () {
                                if (customer == null) {
                                  context
                                      .read<AddCustomerBloc>()
                                      .add(SubmitEvent());
                                } else {
                                  context
                                      .read<AddCustomerBloc>()
                                      .add(UpdateEvent(customer!));
                                }
                              }
                            : null,
                        child: Text(customer == null
                            ? 'ADD CUSTOMER'
                            : 'UPDATE CUSTOMER')),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
