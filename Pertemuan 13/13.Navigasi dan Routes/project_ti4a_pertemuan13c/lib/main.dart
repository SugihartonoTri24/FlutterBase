import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Minggu 10',
      // Mendefinisikan Named Routes di sini
      initialRoute: '/', // Rute awal adalah MainScreen
      routes: {
        '/': (context) => const MainScreen(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}

// Widget ini bertanggung jawab untuk menampilkan Bottom Navigation Bar
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Menyimpan indeks tab yang sedang aktif

  // Daftar halaman yang akan ditampilkan
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  // Fungsi untuk mengubah halaman saat tab diklik
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Kita tidak perlu Scaffold di sini karena setiap halaman sudah punya Scaffold
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}