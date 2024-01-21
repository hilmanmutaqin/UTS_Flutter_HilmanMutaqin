import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts_hilmanmutaqin/globals.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _namaSuratController = TextEditingController();
  final TextEditingController _jumlahAyatController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _namaSuratController,
              decoration: InputDecoration(
                labelText: 'Nama Surat',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _jumlahAyatController,
              decoration: InputDecoration(
                labelText: 'Jumlah Ayat',
                labelStyle: TextStyle(color: Colors.white),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _tanggalController,
              decoration: InputDecoration(
                labelText: 'Tanggal',
                labelStyle: TextStyle(color: Colors.white),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  _tanggalController.text = _dateFormat.format(pickedDate);
                }
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String namaSurat = _namaSuratController.text;
                String jumlahAyat = _jumlahAyatController.text;
                String tanggal = _tanggalController.text;

                // Now you can use the entered data as needed.
              },
              child: Text('Tambah Hafalan' , style: TextStyle(color: Colors.indigo[800]),),
            ),
          ],
        ),
      ),
    );
  }
}
