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
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog10', breed: 'breed10', age: 3),
      child: MaterialApp(
        title: 'Provider10',
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(title: Text("Provider 10")),
      body: Selector<Dog, String>(
        selector: (BuildContext context, Dog dog) => dog.name,
        builder: (BuildContext context, String name, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                SizedBox(height: 10),
                Text('- name: $name', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                BreedAndAge(),
              ],
            ),
          );
        },
        child: Text('I like dogs very much', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({super.key});
  @override
  Widget build(BuildContext context) {
    return Selector<Dog, String>(
      selector: ((BuildContext context, Dog dog) => dog.breed),
      builder: (BuildContext _, String breed, Widget? __) {
        return Column(
          children: [
            Text('- breed: $breed', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Age(),
          ],
        );
      },
    );
  }
}

class Age extends StatelessWidget {
  const Age({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, int>(
      selector: (BuildContext context, Dog dog) => dog.age,
      builder: (BuildContext _, int age, Widget? __) {
        return Column(
          children: [
            Text('- age: $age', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<Dog>().grow(),
              child: Text('Grow', style: TextStyle(fontSize: 20)),
            ),
          ],
        );
      },
    );
  }
}
