import 'package:floor/floor.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';
import 'package:mc_crud_test/domain/repositories/customer_repository.dart';

//implementation of CustomerRepository
class CustomerRepositoryImpl implements CustomerRepository{
  final Database database;

  const CustomerRepositoryImpl({required this.database});

  @override
  Future<void> addCustomer(Customer customer) {
    // TODO: implement addCustomer
    throw UnimplementedError();
  }

  @override
  Future<List<Customer>> getCustomers() {
    // TODO: implement getCustomers
    throw UnimplementedError();
  }

  @override
  Future<Customer> getOneCustomer(int id) {
    // TODO: implement getOneCustomer
    throw UnimplementedError();
  }

  @override
  Future<void> removeCustomer(Customer customer) {
    // TODO: implement removeCustomer
    throw UnimplementedError();
  }

}