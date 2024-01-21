import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uts_hilmanmutaqin/globals.dart';
import 'package:uts_hilmanmutaqin/models/model_hafalan.dart';

class DataHafalanScreen extends StatefulWidget {
  const DataHafalanScreen({Key? key}) : super(key: key);

  @override
  State<DataHafalanScreen> createState() => _DataHafalanScreenState();
}

class _DataHafalanScreenState extends State<DataHafalanScreen> {
  final List<ModelHafalan> hafalanList = [];
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

        for (var item in data) {
          ModelHafalan hafalan = ModelHafalan.fromJson(item);
          hafalanList.add(hafalan);
        }
      } else {
        error = 'Gagal memuat data';
      }
    } catch (e) {
      error = 'Error: $e';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Data Hafalan',
            style: GoogleFonts.poppins(
                color: background, fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : error.isNotEmpty
              ? Center(child: Text(error))
              : ListView.builder(
                  itemCount: hafalanList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        hafalanList[index].namaSurah,
                        style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID: ${hafalanList[index].id}',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          Text(
                            'Deskripsi: ${hafalanList[index].description}',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          Text(
                            'Waktu: ${DateFormat("yyyy-MM-dd HH:mm:ss").format(hafalanList[index].datetime)}',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
