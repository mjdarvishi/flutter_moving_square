import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/data/data_sources/repositories/customer_repository_impl.dart';
import 'package:mc_crud_test/domain/repositories/customer_repository.dart';
import 'package:mc_crud_test/domain/usecase/get_customers_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'data_layer_test.mocks.dart';
import 'mock/mock_customer_entity.dart';

@GenerateMocks([CustomerRepositoryImpl,CustomerRepository])
void main() async {
  //*********************DECLARE VARIABLE**************************************
  late CustomerRepositoryImpl customerRepositoryImpl;
  late CustomerRepository customerRepository;
  late GetCustomersUseCase getCustomersUseCase;

  //****************************SETUP******************************************
  setUp(() {
    customerRepositoryImpl = MockCustomerRepositoryImpl();
    customerRepository=MockCustomerRepository();
    getCustomersUseCase=GetCustomersUseCase(customerRepository);
  });

  //************************TEST PART*******************************************
  //testing data layer
  test('get customer', () async {
    when(customerRepositoryImpl.getCustomers()).thenAnswer((realInvocation) async=> [customer]);
    var result=await customerRepositoryImpl.getCustomers();
    expect(result,[customer]);
  });

  //testing domain layer
  test('get customers in domain layer', () async {
    when(getCustomersUseCase()).thenAnswer((realInvocation) async=> [customer]);
    var result= await getCustomersUseCase();
    verify(getCustomersUseCase()).called(1);
    expect(result,[customer]);
  });

}
