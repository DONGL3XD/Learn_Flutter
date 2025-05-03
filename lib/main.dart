// "editor.codeActionsOnSave": {
//       "source.fixAll": true
//     },
//     "dart.previewFlutterUiGuides": true,

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/pages/counter_page.dart';
import 'package:myapp/pages/handle_dialog_page.dart';
import 'package:myapp/pages/navigate_page.dart';
import 'package:myapp/providers/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      child: MaterialApp(
        title: 'addPostFrameCallback',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            shrinkWrap: true,
            children: [
              ElevatedButton(
                child: Text('Counter Page', style: TextStyle(fontSize: 20)),
                onPressed:
                    (() => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CounterPage()),
                    )),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text(
                  'Handle Dialog Page',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed:
                    (() => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HandleDialogPage()),
                    )),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Navigate Page', style: TextStyle(fontSize: 20)),
                onPressed:
                    (() => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NavigatePage()),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
