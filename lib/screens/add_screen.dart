import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class ModelHafalan {
  final String namaSurah;
  final String description;
  final DateTime datetime;

  ModelHafalan({
    required this.namaSurah,
    required this.description,
    required this.datetime,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama_surah': namaSurah,
      'description': description,
      'datetime': DateFormat("yyyy-MM-dd HH:mm:ss").format(datetime),
    };
  }
}

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _namaSuratController = TextEditingController();
  final TextEditingController _jumlahAyatController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _namaSuratController,
              decoration: const InputDecoration(
                labelText: 'Nama Surat',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _jumlahAyatController,
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tanggalController,
              decoration: const InputDecoration(
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String namaSurah = _namaSuratController.text;
                String description = _jumlahAyatController.text;
                String tanggal = _tanggalController.text;

                ModelHafalan hafalan = ModelHafalan(
                  namaSurah: namaSurah,
                  description: description,
                  datetime: _dateFormat.parse(tanggal),
                );

                // Konversi objek menjadi Map
                Map<String, dynamic> data = hafalan.toMap();

                // Convert the map to JSON
                String jsonData = jsonEncode(data);

                // Send a POST request to the PHP script
                Uri uri = Uri.parse(
                    'https://web1hilmanmutaqin.000webhostapp.com/API/hafalan.php');
                var response = await http.post(
                  uri,
                  headers: {"Content-Type": "application/json"},
                  body: jsonData,
                );

                // Print the response from the server
                print('Response: ${response.body}');

                if (response.statusCode == 200) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hafalan berhasil ditambahkan'),
                      backgroundColor:
                          Colors.green, 
                    ),
                  );
                    //bersihkan field
                  _namaSuratController.clear();
                  _jumlahAyatController.clear();
                  _tanggalController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Gagal menambahkan hafalan'),
                      backgroundColor:
                          Colors.red, 
                    ),
                  );
                }
              },
              child: Text('Tambah Hafalan',
                  style: TextStyle(color: Colors.indigo[800])),
            ),
          ],
        ),
      ),
    );
  }
}
