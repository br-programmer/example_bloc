import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'count_event.dart';

class CountBLoC extends Bloc<CountEvent, int> {
  CountBLoC() : super(0);

  @override
  Stream<int> mapEventToState(CountEvent event) async* {
    if (event is AddEvent) {
      yield state + 1;
    } else if (event is RemoveEvent) {
      yield state - 1;
    }
  }
}
