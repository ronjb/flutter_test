import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => SizedBox(height: 100, child: Card(index)),
                childCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.5, color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        child: Container(color: Colors.yellow, child: Center(child: Text('child $index'))),
      ),
    );
  }
}
