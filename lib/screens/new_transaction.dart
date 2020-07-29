import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    // var titleInput;
    // var amountInput;
    final titleController = TextEditingController();
    final amountController = TextEditingController();

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
              // onChanged: (str) => titleInput = str
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              // onChanged: (str) => amountInput = str
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.pinkAccent,
              onPressed: () {
                // print("Title: ${titleInput} | Amount: ${amountInput}");
                print(
                    "Title: ${titleController.text} | Amount: ${amountController.text}");
                addTx(
                    titleController.text, double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
