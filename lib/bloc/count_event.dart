part of 'count_bloc.dart';

abstract class CountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddEvent extends CountEvent {}

class RemoveEvent extends CountEvent {}
