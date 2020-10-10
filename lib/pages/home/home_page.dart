import 'package:flutter/material.dart';
import 'package:spend_tracker/pages/home/widgets/menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var amount = '1,203.00';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'add',
            onPressed: () => print('click'),
          ),
        ],
      ),
      drawer: Menu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TotalBudget(amount: amount),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            height: MediaQuery.of(context).size.height - 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BarLine(100, Colors.red, 'Withdraw', 506),
                _BarLine(400, Colors.green, 'Deposit', 1709),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BarLine extends StatelessWidget {
  const _BarLine(
    this.height,
    this.color,
    this.label,
    this.amount, {
    Key key,
  }) : super(key: key);
  final double height;
  final String label;
  final Color color;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: height,
          width: 100,
          color: color,
        ),
        Text(label),
        Text('\$$amount'),
      ],
    );
  }
}

class _TotalBudget extends StatelessWidget {
  const _TotalBudget({
    Key key,
    @required this.amount,
  }) : super(key: key);

  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      alignment: Alignment.center,
      child: Text(
        '\$$amount',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.green,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple[700],
            Colors.purple[600],
            Colors.purple[500],
            Colors.purple[400],
          ],
        ),
        // boxShadow: [
        //   BoxShadow(color: Colors.purple[300], offset: Offset(4, 4)),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
