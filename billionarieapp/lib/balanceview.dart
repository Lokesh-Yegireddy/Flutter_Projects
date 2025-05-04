import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceView extends StatelessWidget {
  final double balance;
  const BalanceView({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bank Balance:'),
          SizedBox(height: 10),
          Text(
            "\$ ${NumberFormat.simpleCurrency(name: '').format(balance)}",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
