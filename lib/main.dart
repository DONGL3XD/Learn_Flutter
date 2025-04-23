// "editor.codeActionsOnSave": {
//       "source.fixAll": true
//     },
//     "dart.previewFlutterUiGuides": true,

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/models/dog.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider03',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dog = Dog(name: 'dog03', breed: 'breed03');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dog.addListener(dogListener);
  }

  void dogListener() {
    print('age: ${dog.age}');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dog.removeListener(dogListener);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(title: Text("Provider 03")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('- name: ${dog.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            BreedAndAge(dog: dog),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({super.key, required this.dog});

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('- breed: ${dog.breed}', style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        Age(dog: dog),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({super.key, required this.dog});

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('- age: ${dog.age}', style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => dog.grow(),
          child: Text('Grow', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
