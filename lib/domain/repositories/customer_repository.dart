import 'package:mc_crud_test/domain/entities/customer.dart';

abstract class CustomerRepository {

  Future<List<Customer>> getCustomers();

  Future<Customer> getOneCustomer(int id);

  Future<void> addCustomer(Customer customer);

  Future<void> removeCustomer(Customer customer);
}
