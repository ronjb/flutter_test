import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage(
      showWebView: false,
      level: 0,
    ));
  }
}

class MyHomePage extends StatelessWidget {
  final bool showWebView;
  final int level;

  const MyHomePage({Key key, this.showWebView, this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildButton(String title, bool showWebView) => FlatButton(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(
                showWebView: showWebView,
                level: level + 1,
              ),
            ),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('$level'),
        actions: <Widget>[
          buildButton('+ webview', true),
          buildButton('+ regular', false),
        ],
      ),
      body: Stack(
        children: <Widget>[
          showWebView
              ? WebView(
                  initialUrl:
                      'https://pub.dev/packages/webview_flutter#-readme-tab-')
              : Center(
                  child: Text(
                    'Text widget',
                    textScaleFactor: 3,
                  ),
                ),
          const Placeholder(),
        ],
      ),
    );
  }
}
