
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app_multiply/models/counter_state.dart';

void main() {
	group('CounterState', () {
		// Test the initial state
		test('initial state', () {
			final state = CounterState(0);
			expect(state.value, 0);
		});

		// Test changing state value
		test('state value change', () {
			final state = CounterState(10);
			expect(state.value, 10);
		});

		// Test serialization and deserialization
		test('serialization and deserialization', () {
			final state = CounterState(5);
			final serialized = state.toJson();
			final deserialized = CounterState.fromJson(serialized);

			expect(deserialized.value, 5);
		});
	});
}
