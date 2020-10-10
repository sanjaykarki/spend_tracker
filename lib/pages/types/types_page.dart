import 'package:flutter/material.dart';
import 'package:spend_tracker/pages/types/type_page.dart';

class TypesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Types'),
      ),
      body: Center(child: const Text('Types')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypePage(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[700],
      ),
    );
  }
}
