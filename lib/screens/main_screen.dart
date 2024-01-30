import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_hilmanmutaqin/screens/add_screen.dart';
import 'package:uts_hilmanmutaqin/screens/books_screen.dart';
import 'package:uts_hilmanmutaqin/screens/home_screen.dart';
import 'package:uts_hilmanmutaqin/screens/list_screen.dart';
import 'package:uts_hilmanmutaqin/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Center(
            child: Text('Aplikasi Uts - Hilman Mutaqin',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 12))),
      ),
      body: Center(
        child: _buildScreenForIndex(_currentIndex),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.indigo[800],
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Hafalan'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Al-quran'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }


  Widget _buildScreenForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const DataHafalanScreen();
      case 2:
        return const AddScreen();
      case 3:
        return const ListScreen();
      case 4:
        return const ProfileScreen();
      default:
        return Container();
    }
  }
}
