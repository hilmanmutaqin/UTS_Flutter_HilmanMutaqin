import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_hilmanmutaqin/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Tulisan "Aplikasi Pembelajaran" bold
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: Center(
                child: Text(
                  'Aplikasi Pembelajaran',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, color: Colors.white , fontSize: 16)
                ),
              ),
            ),
            // Gambar Alquran
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Image.asset(
                'asset/alquran.png',
                width: 250,
                height: 250,
              ),
            ),

            // Tulisan "Buku dan Juz Amma" bold dan di bagian bawah
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: Center(
                    child: Text(
                      'Buku dan Al-quran',
                      style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, color: Colors.white , fontSize: 16)
                    ),
                  ),
                ),
              ),
            ),

            // Copyright
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Copyright by: Hilman Mutaqin',
                     style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w100, color: Colors.white , fontSize: 8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
