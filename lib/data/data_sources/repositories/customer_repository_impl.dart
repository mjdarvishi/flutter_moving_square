import 'package:mc_crud_test/data/data_sources/local/database.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';
import 'package:mc_crud_test/domain/repositories/customer_repository.dart';

//implementation of CustomerRepository
class CustomerRepositoryImpl implements CustomerRepository{
  final AppDatabase _database;

  const CustomerRepositoryImpl( this._database);

  @override
  Future<void> addCustomer(Customer customer) {
    // TODO: implement addCustomer
    throw UnimplementedError();
  }

  @override
  Future<List<Customer>> getCustomers() async{
    List<Customer> customers=await _database.personDao.getAllArticles();
    return customers;
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