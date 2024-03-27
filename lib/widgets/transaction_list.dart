import 'package:expance_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  const TransactionList(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? const Center(
            child: Text(
              'No transactions added yet!',
              style:
                  TextStyle(fontSize: 20, wordSpacing: 5, letterSpacing: 1.5),
            ),
          )
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '\$${transaction[index].amount.toStringAsFixed(1)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          //color:
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(transaction[index].date),
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
  }
}
