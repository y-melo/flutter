import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  @override
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    print("Title: $enteredTitle | Amount: $enteredAmount");
    // if (enteredTitle.isEmpty || enteredAmount <= 0) {
    //   return;
    // }
    widget.addTx(enteredTitle, enteredAmount);
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              // onChanged: (str) => titleInput = str
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), // Required for IOS to see decimals
              onSubmitted: (_) => _submitData(),
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
