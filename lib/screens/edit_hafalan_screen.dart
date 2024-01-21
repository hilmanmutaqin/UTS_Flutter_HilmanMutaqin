import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uts_hilmanmutaqin/models/model_hafalan.dart';

class EditHafalanScreen extends StatefulWidget {
  final ModelHafalan hafalan;

  const EditHafalanScreen({Key? key, required this.hafalan}) : super(key: key);

  @override
  _EditHafalanScreenState createState() => _EditHafalanScreenState();
}

class _EditHafalanScreenState extends State<EditHafalanScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  void initState() {
    super.initState();
    _descriptionController.text = widget.hafalan.description;
    _tanggalController.text = _dateFormat.format(widget.hafalan.datetime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Hafalan'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _tanggalController,
              decoration: InputDecoration(
                labelText: 'Tanggal',
                labelStyle: TextStyle(color: Colors.black),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _tanggalController.text = _dateFormat.format(pickedDate);
                  });
                }
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  String description = _descriptionController.text;
                  String tanggal = _tanggalController.text;

                  widget.hafalan.description = description;
                  widget.hafalan.datetime = _dateFormat.parse(tanggal);

                  Map<String, dynamic> data = widget.hafalan.toMap();

                  String jsonData = jsonEncode(data);

                  Uri uri = Uri.parse(
                      'https://web1hilmanmutaqin.000webhostapp.com/API/hafalan.php');
                  var response = await http.put(
                    uri,
                    headers: {"Content-Type": "application/json"},
                    body: jsonData,
                  );

                  print('Response: ${response.body}');

                  if (response.statusCode == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Data updated successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to update data'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                } catch (e) {
                  // Handle different types of exceptions here
                  print('Error: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('An error occurred. Please try again.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('Update Hafalan',
                  style: TextStyle(color: Colors.indigo[800])),
            ),
          ],
        ),
      ),
    );
  }
}
