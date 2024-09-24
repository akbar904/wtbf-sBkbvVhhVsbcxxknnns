
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app_multiply/main.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('Main Entry Point', () {
		testWidgets('App initializes correctly and displays HomeScreen', (tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('CounterCubit', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = MockCounterCubit();
		});

		blocTest<CounterCubit, int>(
			'emits [10] when multiplyByTen is called',
			build: () => counterCubit,
			act: (cubit) => cubit.multiplyByTen(),
			expect: () => [10],
		);

		blocTest<CounterCubit, int>(
			'emits [0, 10, 100] when multiplyByTen is called twice',
			build: () => counterCubit,
			seed: () => 0,
			act: (cubit) {
				cubit.multiplyByTen();
				cubit.multiplyByTen();
			},
			expect: () => [10, 100],
		);
	});
}
