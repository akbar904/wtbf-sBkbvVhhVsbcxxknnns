
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app_multiply/models/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
	CounterCubit() : super(CounterState(1));

	void multiplyByTen() {
		emit(CounterState(state.value * 10));
	}
}
