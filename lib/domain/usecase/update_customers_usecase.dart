import 'package:mc_crud_test/core/usecase.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';
import 'package:mc_crud_test/domain/repositories/customer_repository.dart';

class UpdateCustomersUseCase implements UseCase<void, Customer> {
  final CustomerRepository _customerRepository;

  const UpdateCustomersUseCase(this._customerRepository);

  @override
  Future<void> call({ Customer? params}) {
     try{
       return _customerRepository.updateCustomer(params!);
     }catch(err){
       rethrow;
     }
  }
}

