import 'package:mc_crud_test/core/utils/exception/CustomException.dart';
import 'package:mc_crud_test/data/data_sources/local/database.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';
import 'package:mc_crud_test/domain/repositories/customer_repository.dart';

//implementation of CustomerRepository
class CustomerRepositoryImpl implements CustomerRepository {
  final AppDatabase _database;

  const CustomerRepositoryImpl(this._database);

  @override
  Future<void> addCustomer(Customer customer) async {
    List<String> errors = [];
    if (await _database.customerDao
            .checkBankAccountNumber(customer.bankAccountNumber) !=
        null) {
      errors.add('* bank count number is duplicate');
    }
    if (await _database.customerDao.checkEmail(customer.email) != null) {
      errors.add('* email address is duplicate');
    }
    if (await _database.customerDao.checkMobile(customer.phoneNumber) != null) {
      errors.add('* mobile number is duplicate');
    }
    if (await _database.customerDao.checkInfo(
            customer.firstname, customer.lastname, customer.dateOfBirth) !=
        null) {
      errors.add('* user info is duplicate');
    }
    if (errors.isNotEmpty) {
      throw CustomException(errors);
    }
    await _database.customerDao.insertCustomer(customer);
  }

  @override
  Future<List<Customer>> getCustomers() async {
    List<Customer> customers = await _database.customerDao.getAllArticles();
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
