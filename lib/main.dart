import 'package:flutter/material.dart';
import './Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "new shoes",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "weekly Grociers",
      amount: 69.99,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text("Chart!"),
              color: Colors.blue,
            ),
          ),
          Card(
            child: Text("List of TX"),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
