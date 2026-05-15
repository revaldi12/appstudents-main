import 'package:appstudents/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Map<String, String>> daftarMahasiswa;

  const HomeScreen({
    super.key,
    required this.daftarMahasiswa,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController =
      TextEditingController();

  List<Map<String, String>> filteredMahasiswa = [];

  @override
  void initState() {
    super.initState();
    filteredMahasiswa = widget.daftarMahasiswa;
  }

  // FITUR PENCARIAN
  void _searchMahasiswa(String keyword) {
    final results = widget.daftarMahasiswa.where((mhs) {
      final nama =
          mhs['nama']!.toLowerCase();

      final input =
          keyword.toLowerCase();

      return nama.contains(input);
    }).toList();

    setState(() {
      filteredMahasiswa = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🎓 StudentApp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const NetworkImage(
              'https://assets.nsd.co.id/images/kampus/logo/Unigha.png',
            ),

            fit: BoxFit.contain,
            alignment: Alignment.center,
            opacity: 1.0,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                'Daftar Mahasiswa',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                      FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 16),

              // SEARCH BAR
              TextField(
                controller:
                    _searchController,
                onChanged:
                    _searchMahasiswa,
                decoration:
                    InputDecoration(
                  hintText:
                      'Cari nama mahasiswa...',
                  prefixIcon:
                      const Icon(
                    Icons.search,
                  ),

                  filled: true,
                  fillColor:
                      Colors.white,

                  border:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius
                            .circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // LIST DATA
              Expanded(
                child: ListView.builder(
                  itemCount:
                      filteredMahasiswa
                          .length,

                  itemBuilder:
                      (context, index) {
                    final mhs =
                        filteredMahasiswa[
                            index];

                    return Card(
                      elevation: 5,
                      color: Colors.white
                          .withOpacity(
                              0.9),

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                                    15),
                      ),

                      margin:
                          const EdgeInsets
                              .only(
                        bottom: 12,
                      ),

                      child: ListTile(
                        contentPadding:
                            const EdgeInsets
                                .all(12),

                        leading:
                            CircleAvatar(
                          radius: 25,
                          backgroundColor:
                              Colors.blue,

                          child: Text(
                            mhs['nama']![0],
                            style:
                                const TextStyle(
                              color: Colors
                                  .white,
                              fontWeight:
                                  FontWeight
                                      .bold,
                              fontSize:
                                  20,
                            ),
                          ),
                        ),

                        title: Text(
                          mhs['nama']!,
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight
                                    .bold,
                            fontSize: 18,
                          ),
                        ),

                        subtitle: Text(
                          'NIM: ${mhs['nim']}\n'
                          'Kelas: ${mhs['kelas']}\n'
                          'Semester: ${mhs['semester']}\n'
                          '${mhs['jurusan']}',
                          style:
                              const TextStyle(
                            fontSize: 15,
                          ),
                        ),

                        trailing:
                            const Icon(
                          Icons
                              .arrow_forward_ios,
                          color:
                              Colors.blue,
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  DetailScreen(
                                mahasiswa:
                                    mhs,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}