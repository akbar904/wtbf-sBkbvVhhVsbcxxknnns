
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app_multiply/cubits/counter_cubit.dart';
import 'package:counter_app_multiply/widgets/counter_display.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Counter App Multiply'),
			),
			body: BlocBuilder<CounterCubit, CounterState>(
				builder: (context, state) {
					return Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								CounterDisplay(counterValue: state.value),
								SizedBox(height: 20),
								ElevatedButton(
									onPressed: () => context.read<CounterCubit>().multiplyByTen(),
									child: Text('Multiply by 10'),
								),
							],
						),
					);
				},
			),
		);
	}
}
