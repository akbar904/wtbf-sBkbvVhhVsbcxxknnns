
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app_multiply/widgets/counter_display.dart';

void main() {
	group('CounterDisplay Widget Tests', () {
		testWidgets('should display the counter value', (WidgetTester tester) async {
			const int testCounterValue = 10;
			
			// Build the CounterDisplay widget
			await tester.pumpWidget(
				const MaterialApp(
					home: Scaffold(
						body: CounterDisplay(counterValue: testCounterValue),
					),
				),
			);
			
			// Verify if the counter value is displayed correctly
			expect(find.text('10'), findsOneWidget);
		});
		
		testWidgets('should display counter value with styles', (WidgetTester tester) async {
			const int testCounterValue = 20;
			
			// Build the CounterDisplay widget
			await tester.pumpWidget(
				const MaterialApp(
					home: Scaffold(
						body: CounterDisplay(counterValue: testCounterValue),
					),
				),
			);
			
			// Verify if the counter value is displayed correctly with Text widget
			final textWidget = find.text('20').evaluate().single.widget as Text;
			expect(textWidget.style, isNotNull);
			expect(textWidget.style!.fontSize, isNotNull);
		});
	});
}
