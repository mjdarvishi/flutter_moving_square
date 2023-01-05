import 'package:floor/floor.dart';
import 'package:mc_crud_test/core/utils/constants.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';

// the queries are here
@dao
abstract class CustomerDoa {
  @Query('SELECT * FROM $customerTableName ORDER BY id DESC')
  Future<List<Customer>> getAllArticles();

  @Query(
      'SELECT * FROM $customerTableName WHERE bankAccountNumber= :bankAccountNumber')
  Future<Customer?> checkBankAccountNumber(String bankAccountNumber);

  @Query('SELECT * FROM $customerTableName WHERE email= :email')
  Future<Customer?> checkEmail(String email);

  @Query('SELECT * FROM $customerTableName WHERE phoneNumber= :mobile')
  Future<Customer?> checkMobile(String mobile);

  @Query(
      'SELECT * FROM $customerTableName WHERE firstname= :firstname AND lastname=:lastname AND dateOfBirth=:dateOfBirth')
  Future<Customer?> checkInfo(
      String firstname, String lastname, String dateOfBirth);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCustomer(Customer article);

  @delete
  Future<void> deleteCustomer(Customer article);
}
