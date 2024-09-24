
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app_multiply/screens/home_screen.dart';
import 'package:counter_app_multiply/cubits/counter_cubit.dart';
import 'package:counter_app_multiply/models/counter_state.dart';

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {}

void main() {
  group('HomeScreen', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = MockCounterCubit();
    });

    testWidgets('displays CounterDisplay with initial counter value', (WidgetTester tester) async {
      when(() => counterCubit.state).thenReturn(CounterState(1)); // Assuming initial state is 1

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: HomeScreen(),
          ),
        ),
      );

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('displays Multiply by 10 button', (WidgetTester tester) async {
      when(() => counterCubit.state).thenReturn(CounterState(1));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: HomeScreen(),
          ),
        ),
      );

      expect(find.text('Multiply by 10'), findsOneWidget);
    });

    testWidgets('calls multiplyByTen when button is pressed', (WidgetTester tester) async {
      when(() => counterCubit.state).thenReturn(CounterState(1));
      when(() => counterCubit.multiplyByTen()).thenReturn(null);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: HomeScreen(),
          ),
        ),
      );

      await tester.tap(find.text('Multiply by 10'));
      verify(() => counterCubit.multiplyByTen()).called(1);
    });

    testWidgets('displays updated counter value after multiplication', (WidgetTester tester) async {
      whenListen(counterCubit, Stream.fromIterable([CounterState(1), CounterState(10)]), initialState: CounterState(1));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: HomeScreen(),
          ),
        ),
      );

      expect(find.text('1'), findsOneWidget);
      await tester.tap(find.text('Multiply by 10'));
      await tester.pump();
      expect(find.text('10'), findsOneWidget);
    });
  });
}
