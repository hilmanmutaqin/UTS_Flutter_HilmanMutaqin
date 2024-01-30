import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uts_hilmanmutaqin/globals.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Method to launch a URL
  Future<void> _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');

    }
  }

 
  Future<void> _launchInstagram(String url) async {
    
    String instagramUrl = 'instagram://user?username=hilman_mutaqin4';
    
    String fallbackUrl = 'https://www.instagram.com/hilman_mutaqin4';

    try {
      
      if (await canLaunch(instagramUrl)) {
        await launch(instagramUrl);
      } else {
      
        await launch(fallbackUrl);
      }
    } catch (e) {
      print('Error launching Instagram: $e');
    
    }
  }

  Future<void> _launchGitHub(String url) async {
    
    String gitHubUrl = 'github://hilmanmutaqin';
    
    String fallbackUrl = 'https://github.com/hilmanmutaqin';

    try {
      
      if (await canLaunch(gitHubUrl)) {
        await launch(gitHubUrl);
      } else {
        
        await launch(fallbackUrl);
      }
    } catch (e) {
      print('Error launching GitHub: $e');
      
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
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('asset/icon_profil.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Hilman Mutaqin',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'NPM : 21552011107',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mahasiswa Teknik Informatika',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sekolah Tinggi Teknologi Bandung',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            // Instagram Button
            ElevatedButton.icon(
              onPressed: () {
                _launchInstagram('https://www.instagram.com/hilman_mutaqin4');
              },
              icon: Image.asset(
                'asset/icon_ig.png',
                width: 30,
                height: 30,
              ),
              label: Text('Instagram', style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300, color: Colors.white, fontSize: 12)),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigoAccent,
              ),
            ),
            const SizedBox(height: 20),
            // GitHub Button
            ElevatedButton.icon(
              onPressed: () {
                _launchGitHub('https://github.com/hilmanmutaqin');
              },
              icon: Image.asset(
                'asset/icon_github.png',
                width: 30,
                height: 30,
              ),
              label: Text('GitHub', style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300, color: Colors.white, fontSize: 12)),
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
