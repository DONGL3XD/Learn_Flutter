import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Translations {
  const Translations(this._value);
  final int _value;

  String get title => 'You clicked $_value times';
}

class ProxyprovProxyprov extends StatefulWidget {
  const ProxyprovProxyprov({super.key});

  @override
  State<ProxyprovProxyprov> createState() => _ProxyprovProxyprovState();
}

class _ProxyprovProxyprovState extends State<ProxyprovProxyprov> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
      print('counter: $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProxyProvider ProxyProvider')),
      // Suggested code may be subject to a license. Learn more: ~LicenseLog:187545953.
      body: Center(
        child: MultiProvider(
          providers: [
            ProxyProvider0<int>(update: (_, __) => counter),
            ProxyProvider<int, Translations>(
              update: (_, value, __) => Translations(value),
            ),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTranslations(),
              SizedBox(height: 20),
              IncreaseButton(increment: increment),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowTranslations extends StatelessWidget {
  ShowTranslations({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Provider.of<Translations>(context).title;
    return Text(title, style: TextStyle(fontSize: 28));
  }
}

class IncreaseButton extends StatelessWidget {
  const IncreaseButton({super.key, required this.increment});
  final VoidCallback increment;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: increment,
      child: Text('INCREASE', style: TextStyle(fontSize: 20)),
    );
  }
}
