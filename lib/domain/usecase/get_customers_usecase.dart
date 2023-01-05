import 'package:mc_crud_test/core/usecase.dart';
import 'package:mc_crud_test/domain/entities/customer.dart';
import 'package:mc_crud_test/domain/repositories/customer_repository.dart';



class GetCustomersUseCase implements UseCase<List<Customer>, void> {
  final CustomerRepository _customerRepository;

  const GetCustomersUseCase(this._customerRepository);

  @override
  Future<List<Customer>> call({void params}) {
    return _customerRepository.getCustomers();
  }
}
