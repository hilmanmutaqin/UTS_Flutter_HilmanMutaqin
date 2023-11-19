import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  style: TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
                      'Buku dan Juz Amma',
                      style: TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
                    style: TextStyle(fontSize: 12),
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
