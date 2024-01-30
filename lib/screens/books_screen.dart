import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uts_hilmanmutaqin/globals.dart';
import 'package:uts_hilmanmutaqin/models/model_hafalan.dart';
import 'edit_hafalan_screen.dart';

class DataHafalanScreen extends StatefulWidget {
  const DataHafalanScreen({Key? key}) : super(key: key);

  @override
  State<DataHafalanScreen> createState() => _DataHafalanScreenState();
}

class _DataHafalanScreenState extends State<DataHafalanScreen> {
  List<ModelHafalan> hafalanList = [];
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchHafalanData();
  }

  Future<void> fetchHafalanData() async {
    try {
      final response = await Dio()
          .get('https://web1hilmanmutaqin.000webhostapp.com/API/hafalan.php');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        setState(() {
          hafalanList.clear();

          for (var item in data) {
            ModelHafalan hafalan = ModelHafalan.fromJson(item);
            hafalanList.add(hafalan);
          }
        });
      } else {
        showSnackbar('Gagal memuat data');
      }
    } catch (e) {
      showSnackbar('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> deleteHafalan(int index) async {
    try {
      final response = await Dio().post(
        'https://web1hilmanmutaqin.000webhostapp.com/API/delete_hafalan.php',
        data: {'id': hafalanList[index].id.toString()},
      );

      print(response);

      if (response.statusCode == 200) {
        setState(() {
          hafalanList.removeAt(index);
        });
        showSnackbar('Item deleted successfully');
      } else {
        showSnackbar('Failed to delete');
      }
    } catch (e) {
      showSnackbar('Error deleting record: $e');
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Center(
          child: Text(
            'Data Hafalan',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : error.isNotEmpty
              ? Center(child: Text(error))
              : hafalanList.isEmpty
                  ? Center(child: Text('Tidak ada data'))
                  : ListView.builder(
                      itemCount: hafalanList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            hafalanList[index].namaSurah,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ID: ${hafalanList[index].id}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Deskripsi: ${hafalanList[index].description}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Waktu: ${DateFormat("yyyy-MM-dd HH:mm:ss").format(hafalanList[index].datetime)}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  // Navigate to the edit screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditHafalanScreen(
                                        hafalan: hafalanList[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Delete Confirmation'),
                                        content: Text(
                                          'Are you sure you want to delete this item?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // Call deleteHafalan function
                                              deleteHafalan(index);
                                              Navigator.pop(context);
                                            },
                                            child: Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
    );
  }
}
