import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    void _submitData() {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);
      print("Title: $enteredTitle | Amount: $enteredAmount");
      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
      }
      widget.addTx(enteredTitle, enteredAmount);
    }

    return Card(
      elevation: 2,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (str) => titleInput = str
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), // Required for IOS to see decimals
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              // onChanged: (str) => amountInput = str
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.pinkAccent,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
