import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionList({required this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: userTransactions.isEmpty ? 
      Column(
        children: [
          Text('No transactions yet!', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 20),
          Container(height: 200, child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover))
        ],
      )
       : ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(padding: EdgeInsets.all(6),child: FittedBox(child: Text('\$${userTransactions[index].amount}'))),
              ),
              title: Text(userTransactions[index].title, style: Theme.of(context).textTheme.titleSmall),
              subtitle: Text(DateFormat.yMMMd().format(userTransactions[index].date)),
            ),
          );
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
