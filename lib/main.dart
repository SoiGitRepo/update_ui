import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  //define valueNotifier
  final ValueNotifier<String> nameNotifier = ValueNotifier("siqiao");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have changed the name to this:',
            ),
            //use valueNotifier's value
            ValueListenableBuilder(
                valueListenable: nameNotifier,
                builder: (context, value, child) {
                  return Text(
                    value,
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onSubmitted: (value) {
                  //change value of notifier
                  nameNotifier.value = value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
