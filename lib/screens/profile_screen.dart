import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uts_hilmanmutaqin/globals.dart'; // Assuming you have a file for globals

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Method to launch a URL
  _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Tidak dapat membuka $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('asset/icon_profil.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Hilman Mutaqin',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(height: 20),
            Text(
              'NPM : 21552011107',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Mahasiswa Teknik Informatika',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sekolah Tinggi Teknologi Bandung',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),
            ),
            SizedBox(height: 30),
            // Instagram Button
            ElevatedButton.icon(
              onPressed: () {
                _launchURL('https://www.instagram.com/hilman_mutaqin4');
              },
              icon: Image.asset(
                'asset/icon_ig.png',
                width: 30,
                height: 30,
              ),
              label: Text('Instagram' , style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300, color: Colors.white,fontSize: 12)),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigoAccent,
              ),
            ),
            SizedBox(height: 20),
            // GitHub Button
            ElevatedButton.icon(
              onPressed: () {
                _launchURL('https://github.com/hilmanmutaqin');
              },
              icon: Image.asset(
                'asset/icon_github.png',
                width: 30,
                height: 30,
              ),
              label: Text('GitHub' , style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300, color: Colors.white,fontSize: 12)),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigoAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
