import 'package:flutter/material.dart';
import 'package:myapp/providers/counter.dart';
import 'package:provider/provider.dart';

class HandleDialogPage extends StatefulWidget {
  const HandleDialogPage({super.key});

  @override
  State<HandleDialogPage> createState() => _HandleDialogPageState();
}

class _HandleDialogPageState extends State<HandleDialogPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text('Be Careful!'));
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<Counter>().counter == 3) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text('Be Careful!'));
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Handle Dialog')),
      body: Center(
        child: Text(
          'counter ${context.watch<Counter>().counter}',
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
