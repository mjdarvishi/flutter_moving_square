
import 'package:floor/floor.dart';
import 'package:mc_crud_test/core/utils/constants.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';

// the queries are here
@dao
abstract class CustomerDoa {

  @Query('SELECT * FROM $customerTableName')
  Future<List<Customer>> getAllArticles();

}