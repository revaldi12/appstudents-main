import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, String> mahasiswa;

  const DetailScreen({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Mahasiswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mahasiswa['nama']!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                Text('NIM : ${mahasiswa['nim']}'),
                const SizedBox(height: 8),

                Text('Kelas : ${mahasiswa['kelas']}'),
                const SizedBox(height: 8),

                Text('Semester : ${mahasiswa['semester']}'),
                const SizedBox(height: 8),


                Text('Jurusan : ${mahasiswa['jurusan']}'),
                const SizedBox(height: 8),

                Text('Email : ${mahasiswa['email']}'),
                const SizedBox(height: 8),

                Text('Telepon : ${mahasiswa['telepon']}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}