import 'package:flutter/material.dart';
import 'package:myapp/counter.dart';
import 'package:provider/provider.dart';

class ShowCounter extends StatelessWidget {
  const ShowCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          style: TextStyle(fontSize: 52),
        ),
      ),
    );
  }
}
