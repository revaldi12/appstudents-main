import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  final Function(Map<String, String>) onSubmit;

  const FormScreen({
    super.key,
    required this.onSubmit,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _emailController = TextEditingController();
  final _teleponController = TextEditingController();

  // TAMBAHAN KELAS & SEMESTER
  final _kelasController = TextEditingController();
  final _semesterController = TextEditingController();

  String? _selectedJurusan;

  final List<String> jurusanList = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Manajemen Informatika',
  ];

  void _simpanData() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit({
        'nama': _namaController.text,
        'nim': _nimController.text,
        'kelas': _kelasController.text,
        'semester': _semesterController.text,
        'email': _emailController.text,
        'jurusan': _selectedJurusan ?? '',
        'telepon': _teleponController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data berhasil disimpan'),
        ),
      );

      _resetForm();
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();

    _namaController.clear();
    _nimController.clear();
    _emailController.clear();
    _teleponController.clear();
    _kelasController.clear();
    _semesterController.clear();

    setState(() {
      _selectedJurusan = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Mahasiswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: ListView(
            children: [
              // NAMA
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),

                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // NIM
              TextFormField(
                controller: _nimController,
                keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                ),

                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'NIM wajib diisi';
                  }

                  if (!RegExp(r'^[0-9]+$').hasMatch(val)) {
                    return 'NIM hanya boleh angka';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              // KELAS
              TextFormField(
                controller: _kelasController,

                decoration: const InputDecoration(
                  labelText: 'Kelas',
                  border: OutlineInputBorder(),
                ),

                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Kelas wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // SEMESTER
              TextFormField(
                controller: _semesterController,

                decoration: const InputDecoration(
                  labelText: 'Semester',
                  border: OutlineInputBorder(),
                ),

                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Semester wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // EMAIL
              TextFormField(
                controller: _emailController,

                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // DROPDOWN JURUSAN
              DropdownButtonFormField<String>(
                value: _selectedJurusan,

                decoration: const InputDecoration(
                  labelText: 'Jurusan',
                  border: OutlineInputBorder(),
                ),

                items: jurusanList.map((jurusan) {
                  return DropdownMenuItem(
                    value: jurusan,
                    child: Text(jurusan),
                  );
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    _selectedJurusan = value;
                  });
                },

                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Jurusan wajib dipilih';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // TELEPON
              TextFormField(
                controller: _teleponController,

                decoration: const InputDecoration(
                  labelText: 'Telepon',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              // BUTTON SIMPAN
              SizedBox(
                height: 50,

                child: ElevatedButton(
                  onPressed: _simpanData,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),

                  child: const Text(
                    'SIMPAN',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}