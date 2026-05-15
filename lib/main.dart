import 'package:appstudents/detail_screen.dart';
import 'package:appstudents/form_screen.dart';
import 'package:appstudents/home_screen.dart';
import 'package:appstudents/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ================= APP =================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const SplashScreen(),
    );
  }
}

// ================= HALAMAN SPLASH =================
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          // POSTER FULL LAYAR
          Image.asset(
            'assets/poster.png',

            width: double.infinity,
            height: double.infinity,

            // AGAR FULL LAYAR DAN TIDAK TERPOTONG
            fit: BoxFit.fill,
          ),

          // EFEK CERAH
          Container(
            color: Colors.white.withOpacity(0.08),
          ),

          // TOMBOL TENGAH
          Center(
            child: Container(
              width: 230,
              height: 55,

              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                borderRadius: BorderRadius.circular(15),

                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MainHome(),
                    ),
                  );
                },

                child: const Text(
                  'Lanjutkan Pengisian',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= MAIN HOME =================
class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;

  // DATA MAHASISWA
  final List<Map<String, String>> _daftarMahasiswa = [
    {
      'nama': 'Tengku Revaldi Wardika',
      'nim': '23105111082',
      'kelas': '05',
      'semester': '06',
      'jurusan': 'Teknik Informatika',
      'email': 'rrevaldi967@gmail.com',
      'telepon': '085297955704',
    },
  ];

  // TAMBAH DATA
  void tambahMahasiswa(Map<String, String> data) {
    setState(() {
      _daftarMahasiswa.add(data);
    });
  }

  // HALAMAN
  late final List<Widget> _pages = [
    HomeScreen(
      daftarMahasiswa: _daftarMahasiswa,
    ),

    FormScreen(
      onSubmit: tambahMahasiswa,
    ),

    const ProfileScreen(),
  ];

  // PINDAH MENU
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Form',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}