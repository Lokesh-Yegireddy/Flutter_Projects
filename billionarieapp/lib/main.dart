import 'package:billionarieapp/add_money_button.dart';
import 'package:billionarieapp/balanceview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0;

  void addMoney() async {
    setState(() {
      balance += 500.0;
    });

    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setDouble('balance', balance);
  }

  @override
  void initState() {
    loadbalance();
    super.initState();
  }

  void loadbalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      balance = prefs.getDouble('balance') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Billionarie App!'),
          backgroundColor: const Color.fromARGB(255, 46, 45, 45),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          color: Colors.blueGrey[700],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              BalanceView(balance: balance),
              AddMoneyButton(addMoneyFunction: addMoney),
            ],
          ),
        ),
      ),
    );
  }
}
