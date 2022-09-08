import 'package:flutter/material.dart';
import './Transaction.dart';
import 'package:intl/intl.dart';

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
      title: "New shoes",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Grociers",
      amount: 69.99,
      date: DateTime.now(),
    ),
  ];

  // String title;
  // String amount;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Title",
                      ),
                      // onChanged: (value) => title = value,
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Amount",
                      ),
                      // onChanged: (value) => amount = value,
                      controller: amountController,
                    ),
                    OutlinedButton(
                      onPressed: (() => print(
                          "${titleController.text} ${amountController.text}")),
                      child: Text("Add Transaction"),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.purple),
                    )
                  ],
                ),
              ),
              elevation: 5),
          Column(
              children: transactions.map((tx) {
            return Card(
              child: Row(
                children: [
                  Container(
                    //amount container
                    child: Text("\$${tx.amount}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        )),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                            .format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}
