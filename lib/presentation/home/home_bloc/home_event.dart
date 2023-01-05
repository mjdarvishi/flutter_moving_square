part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable{

@override
List<Object> get props => [];

const HomeEvent();
}
//get customer event
class GetCustomerEvent extends HomeEvent{}
