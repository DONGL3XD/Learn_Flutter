import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Translations {
  late int _value;

  void update(int newValue) {
    _value = newValue;
  }

  String get title => 'You clicked $_value times';
}

class ProxyprovCreateUpdate extends StatefulWidget {
  const ProxyprovCreateUpdate({super.key});

  @override
  State<ProxyprovCreateUpdate> createState() => _ProxyprovCreateUpdateState();
}

class _ProxyprovCreateUpdateState extends State<ProxyprovCreateUpdate> {
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
      appBar: AppBar(title: Text('ProxyProvider Create / Update')),
      // Suggested code may be subject to a license. Learn more: ~LicenseLog:187545953.
      body: Center(
        child: ProxyProvider0<Translations>(
          create: (_) => Translations(),
          update: (_, Translations? translations) {
            translations!.update(counter);
            return translations;
          },
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
    final title = context.watch<Translations>().title;
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
