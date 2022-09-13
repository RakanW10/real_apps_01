import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);

  void submitData() {
    String enteredTitle = titleController.text;
    double enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                onSubmitted: (_) => submitData(),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Amount",
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                // onChanged: (value) => amount = value,
                controller: amountController,
              ),
              OutlinedButton(
                onPressed: submitData,
                child: Text("Add Transaction"),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.purple),
              )
            ],
          ),
        ),
        elevation: 5);
  }
}
