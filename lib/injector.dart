import 'package:get_it/get_it.dart';
import 'package:mc_crud_test/core/utils/constants.dart';
import 'package:mc_crud_test/data/data_sources/local/database.dart';
import 'package:mc_crud_test/data/data_sources/repositories/customer_repository_impl.dart';
import 'package:mc_crud_test/domain/repositories/customer_repository.dart';
import 'package:mc_crud_test/domain/usecase/get_customers_usecase.dart';
import 'package:mc_crud_test/presentation/add_customer/add_customer_bloc/add_customer_bloc.dart';
import 'package:mc_crud_test/presentation/home/home_bloc/home_bloc.dart';
final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // data base
  final database = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  injector.registerSingleton<AppDatabase>(database);


  // *
  injector.registerSingleton<CustomerRepository>(
    CustomerRepositoryImpl(injector()),
  );


  // UseCases
  injector.registerSingleton<GetCustomersUseCase>(GetCustomersUseCase(injector()));

  //Bloc
  injector.registerFactory<HomeBloc>(
        () => HomeBloc( injector()),
  );
  injector.registerFactory<AddCustomerBloc>(
        () => AddCustomerBloc(),
  );
}
