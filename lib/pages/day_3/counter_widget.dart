import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  
  final int count;

  const CounterWidget({
    super.key, 
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('You have pushed the button this many times:'),
        Text(
          '$count',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}