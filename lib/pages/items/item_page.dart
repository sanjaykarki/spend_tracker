import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemPage extends StatefulWidget {
  ItemPage({@required this.isDeposit});
  final bool isDeposit;
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Map<String, dynamic> _formData = Map<String, dynamic>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // bool _isDeposit = true;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _formData['isDeposit'] = widget.isDeposit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (String value) => value.isEmpty ? 'Required' : null,
                onSaved: (String value) => _formData['Description'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                validator: (String value) {
                  if (value.isEmpty) return 'Required';
                  if (double.tryParse(value) == null)
                    return 'Invalid number';
                  else
                    return null;
                },
                onSaved: (String value) =>
                    _formData['amount'] = double.parse(value),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _formData['isDeposit'],
                    onChanged: (bool value) {
                      setState(() {
                        _formData['isDeposit'] = value;
                      });
                    },
                  ),
                  const Text('Is Deposit'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.date_range),
                    onPressed: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: _dateTime,
                        firstDate: DateTime.now().add(Duration(days: -365)),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                      if (date == null) return;

                      setState(() {
                        _dateTime = date;
                      });
                    },
                  ),
                  Text(DateFormat('dd/MM/yyyy').format(_dateTime)),
                ],
              ),
              DropdownButtonFormField(
                value: _formData['accountId'],
                decoration: InputDecoration(labelText: 'Account'),
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: const Text('Checking'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: const Text('Credit Card'),
                  ),
                ],
                validator: (value) => value == null ? 'Required' : null,
                onChanged: (value) {
                  setState(() {
                    _formData['accountId'] = value;
                  });
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Type'),
                value: _formData['typeID'],
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: const Text('Rent'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: const Text('Dinner'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _formData['typeId'] = value;
                  });
                },
                validator: (value) => value == null ? 'Required' : null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (!_formKey.currentState.validate()) return;
          _formKey.currentState.save();
          Navigator.of(context).pop();
        },
        label: Text('Save'),
        icon: Icon(Icons.save),
        // backgroundColor: Colors.purple[700],
      ),
    );
  }
}
