
import 'package:mc_crud_test/core/utils/exception/CustomException.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';

Customer customer=Customer('javad','darvishi', '1996-03-06', '09162392292',
    'javad@gmail.com','111111111',id: 1);

Customer updateCustomer=Customer('javad22','darvishi', '1996-03-06', '09162392292',
    'javad@gmail.com','111111111',id: 1);
CustomException exception=CustomException(['duplicate info']);