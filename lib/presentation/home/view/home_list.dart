import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/presentation/home/home_bloc/home_bloc.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return ListView.builder(
      itemCount: bloc.state.customers.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.blueGrey, width: 1)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                      'First Name', bloc.state.customers[index].firstname),
                  customText('Last Name', bloc.state.customers[index].lastname),
                  customText(
                      'Mobile Number', bloc.state.customers[index].phoneNumber),
                  customText(
                      'Email Address', bloc.state.customers[index].email),
                  customText('Bank Account Number',
                      bloc.state.customers[index].bankAccountNumber),
                  customText(
                      'Date Of Birth', bloc.state.customers[index].dateOfBirth),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children:  [
                GestureDetector(
                  onTap: () => bloc.add(DeleteCustomerEvent(bloc.state.customers[index])),
                  child: const Icon(
                    Icons.delete_sharp,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 25,),
                const Icon(
                  Icons.edit_note_sharp,
                  color: Colors.blue,
                  size: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: RichText(
        text: TextSpan(
          text: title + ' : ',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: value,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
