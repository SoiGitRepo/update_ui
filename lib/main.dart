import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:update_ui/name_change_nofitier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NameChangeNofifier()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
            //use changeNotifier's value
            Consumer<NameChangeNofifier>(
                builder: (context, nameChangeNofifier, child) {
              return Text(
                nameChangeNofifier.name,
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onSubmitted: (value) {
                  //change value of changeNotifier
                  context.read<NameChangeNofifier>().name = value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
