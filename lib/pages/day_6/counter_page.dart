import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_6/bloc/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  
  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, int>(
      bloc: counterCubit,
      listener: (context, state) {
        if(state % 5 != 0) return;
        SnackBar snackBar = SnackBar(
          content: Text('Counter Value: $state'),
          duration: const Duration(milliseconds: 300),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Page'),
        ),
        body: BlocBuilder<CounterCubit, int>(
          bloc: counterCubit,
          builder: (context, state) {
            return Center(
              child: Text('Counter Value: $state'),
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: counterCubit.increment,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}