import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Impeller Text Decoration Test'),
      ),
      body: ListView(
        children: const <Widget>[
          DecoratedText(TextDecoration.underline, TextDecorationStyle.solid),
          DecoratedText(TextDecoration.underline, TextDecorationStyle.dashed),
          DecoratedText(TextDecoration.underline, TextDecorationStyle.dotted),
          DecoratedText(TextDecoration.underline, TextDecorationStyle.double),
          DecoratedText(TextDecoration.underline, TextDecorationStyle.wavy),
        ],
      ),
    );
  }
}

class DecoratedText extends StatelessWidget {
  const DecoratedText(this.decoration, this.decorationStyle, {super.key});

  final TextDecoration decoration;
  final TextDecorationStyle decorationStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${decoration.desc}, ${decorationStyle.desc}',
        style: TextStyle(
          fontSize: 22,
          decoration: decoration,
          decorationStyle: decorationStyle,
        ),
      ),
    );
  }
}

extension on Object {
  String get desc => toString().split('.').last;
}
