import 'package:mc_crud_test/core/usecase.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';
import 'package:mc_crud_test/domain/repositories/customer_repository.dart';



class AddCustomersUseCase implements UseCase<void, Customer> {
  final CustomerRepository _customerRepository;

  const AddCustomersUseCase(this._customerRepository);

  @override
  Future<void> call({ Customer? params}) {
    return _customerRepository.addCustomer(params!);
  }
}
