
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app_multiply/cubits/counter_cubit.dart';
import 'package:counter_app_multiply/models/counter_state.dart';

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {}

void main() {
	group('CounterCubit', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		test('initial state is CounterState(1)', () {
			expect(counterCubit.state, CounterState(1));
		});

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(10)] when multiplyByTen is called',
			build: () => counterCubit,
			act: (cubit) => cubit.multiplyByTen(),
			expect: () => [CounterState(10)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(100)] when multiplyByTen is called twice',
			build: () => counterCubit,
			act: (cubit) => cubit
				..multiplyByTen()
				..multiplyByTen(),
			expect: () => [CounterState(10), CounterState(100)],
		);
	});
}
