import 'package:flutter/material.dart';
import 'package:myapp/providers/counter.dart';
import 'package:provider/provider.dart';

class NavigatePage extends StatefulWidget {
  const NavigatePage({super.key});

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigate')),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<Counter>().increment();
        },
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Other Page')),
      body: Center(
        child: Text(
          'Other',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
