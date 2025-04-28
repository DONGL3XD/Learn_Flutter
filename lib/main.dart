// "editor.codeActionsOnSave": {
//       "source.fixAll": true
//     },
//     "dart.previewFlutterUiGuides": true,

import 'package:flutter/material.dart';
import 'package:myapp/ShowCounter.dart';
import 'package:myapp/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Counter _counter = Counter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anonymous Route',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder:
                  (context) => ChangeNotifierProvider.value(
                    value: _counter,
                    child: MyHomePage(),
                  ),
            );
          case '/counter':
            return MaterialPageRoute(
              builder:
                  (context) => ChangeNotifierProvider.value(
                    value: _counter,
                    child: ShowCounter(),
                  ),
            );
          default:
            return null;
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counter.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              child: Text('Show Counter', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: context.read<Counter>().increment,
              child: Text('Increment Counter', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
