import 'package:flutter/material.dart';
import 'package:spend_tracker/pages/home/widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var amount = '1,203.00';
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'add',
            onPressed: () => print('click'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
          ),
        ],
      ),
    );
  }
}
