part of 'home_bloc.dart';

enum HomePageState { loading, home, err }

class HomeState extends Equatable {
  //store the page state
  final HomePageState state;
  //store list of customer
  final List<Customer> customers;

  @override
  List<Object?> get props => [state, customers];

  const HomeState(
      {this.state = HomePageState.loading, this.customers = const []});

  HomeState copyWith({HomePageState? state, List<Customer>? customers}) {
    return HomeState(
        state: state ?? this.state, customers: customers ?? this.customers);
  }
}
