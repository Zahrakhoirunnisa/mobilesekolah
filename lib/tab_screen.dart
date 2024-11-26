import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'main.dart';
import 'dart:convert';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1565C0),
          title: Text(
            'SMKN 4 BOGOR',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
          ),
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            UsersTab(),
            InfoTab(),
            GalleryTab(),
            AgendaTab(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: TabBar(
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            indicatorColor: Color(0xFF1565C0),
            labelColor: Color(0xFF1565C0),
            unselectedLabelColor: Colors.grey[600],
            indicatorWeight: 3,
            tabs: [
              Tab(
                icon: Icon(Icons.home_rounded),
                text: 'Beranda',
              ),
              Tab(
                icon: Icon(Icons.info_rounded), 
                text: 'Info',
              ),
              Tab(
                icon: Icon(Icons.photo_library_rounded),
                text: 'Galeri',
              ),
              Tab(
                icon: Icon(Icons.calendar_today_rounded),
                text: 'Agenda',
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class UsersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1565C0),
              Color(0xFF1976D2).withOpacity(0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Selamat Datang di',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'SMKN 4 BOGOR',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              // Menu Grid
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        'Menu Utama',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1565C0),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: [
                            _buildMenuCard(
                              context,
                              icon: Icons.info_outline_rounded,
                              title: 'Informasi',
                              description: 'Informasi terbaru sekolah',
                              color: Color(0xFF1565C0),
                              onTap: () => DefaultTabController.of(context)?.animateTo(1),
                            ),
                            _buildMenuCard(
                              context,
                              icon: Icons.photo_library_rounded,
                              title: 'Galeri',
                              description: 'Dokumentasi kegiatan sekolah',
                              color: Color(0xFF1E88E5),
                              onTap: () => DefaultTabController.of(context)?.animateTo(2),
                            ),
                            _buildMenuCard(
                              context,
                              icon: Icons.calendar_today_rounded,
                              title: 'Agenda',
                              description: 'Jadwal kegiatan sekolah',
                              color: Color(0xFF2196F3),
                              onTap: () => DefaultTabController.of(context)?.animateTo(3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                bottom: -20,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        size: 30,
                        color: color,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class InfoTab extends StatelessWidget {
  // Function to fetch information data with kategori_id = 3 (Informasi)
  Future<List<dynamic>> fetchInfoData() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/posts?kategori_id=3'), // API call with kategori_id = 3 (Informasi)
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Filtering the posts to only include kategori_id = 3
      return data['data'].where((item) => item['kategori_id'] == 3).toList();
    } else {
      throw Exception('Failed to load information data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchInfoData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No information available'));
        }

        return ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final berita = snapshot.data![index];
            String formattedDate = berita['created_at'] != null
                ? DateFormat('dd MMM yyyy').format(DateTime.parse(berita['created_at']))
                : 'Tanggal tidak tersedia';

            return Card(
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Color(0xFF1565C0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 14,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6),
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      berita['judul'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      berita['isi'],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(berita: berita),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: Color(0xFF1565C0),
                          ),
                          label: Text(
                            'Baca Selengkapnya',
                            style: TextStyle(
                              color: Color(0xFF1565C0),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> berita;

  DetailPage({required this.berita});

  @override
  Widget build(BuildContext context) {
    String formattedDate = berita['created_at'] != null
        ? DateFormat('dd MMMM yyyy').format(DateTime.parse(berita['created_at']))
        : 'Tanggal tidak tersedia';

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Informasi'),
        backgroundColor: Color(0xFF1565C0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Color(0xFF1565C0).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Color(0xFF1565C0),
                  ),
                  SizedBox(width: 8),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      color: Color(0xFF1565C0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              berita['judul'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                height: 1.3,
              ),
            ),
            SizedBox(height: 20),
            Text(
              berita['isi'],
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}





class GalleryTab extends StatefulWidget {
  @override
  _GalleryTabState createState() => _GalleryTabState();
}

class _GalleryTabState extends State<GalleryTab> {
  List<dynamic> galleryData = [];

  @override
  void initState() {
    super.initState();
    fetchGalleryData();
  }

  Future<void> fetchGalleryData() async {
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/galleries'),
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print('Gallery Response: ${response.body}'); // Untuk debugging
        setState(() {
          galleryData = jsonData['data'] ?? [];
        });
      } else {
        print('Error status code: ${response.statusCode}');
        throw Exception('Failed to load gallery data');
      }
    } catch (e) {
      print('Error fetching gallery data: $e');
      setState(() {
        galleryData = [];
      });
    }
  }

  String getImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return ''; 
    }
    final cleanPath = imagePath.replaceAll(r'\/', '/');
    return 'http://127.0.0.1:8000/storage/$cleanPath';
  }

  void _showImageDialog(String imagePath, String title) {
    print('Image path: $imagePath');
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imagePath.isNotEmpty)
                Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return Icon(Icons.broken_image, size: 100, color: Colors.grey);
                  },
                )
              else
                Icon(Icons.broken_image, size: 100, color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeri'),
        backgroundColor: Color(0xFF1565C0),
      ),
      body: galleryData.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1565C0)),
                  ),
                  SizedBox(height: 16),
                  Text('Memuat galeri...'),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: fetchGalleryData,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: galleryData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final item = galleryData[index];
                    final images = item['images'] as List?;
                    final imageFile = images?.isNotEmpty == true ? images![0]['file'] : null;
                    final title = images?.isNotEmpty == true ? images![0]['judul'] : 'No Title';

                    return Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (imageFile != null) {
                            _showImageDialog(getImageUrl(imageFile), title);
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15.0),
                                ),
                                child: imageFile != null
                                    ? Image.network(
                                        getImageUrl(imageFile),
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress.expectedTotalBytes != null
                                                  ? loadingProgress.cumulativeBytesLoaded / 
                                                    loadingProgress.expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                        errorBuilder: (context, error, stackTrace) {
                                          print('Error loading image: $error');
                                          return Container(
                                            color: Colors.grey[200],
                                            child: Icon(
                                              Icons.image_not_supported_rounded,
                                              size: 50,
                                              color: Colors.grey[400],
                                            ),
                                          );
                                        },
                                      )
                                    : Container(
                                        color: Colors.grey[200],
                                        child: Icon(
                                          Icons.image_not_supported_rounded,
                                          size: 50,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1565C0),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}







class AgendaTab extends StatelessWidget {
  // Function to fetch data from the API with kategori_id = 1 (Agenda)
  Future<List<dynamic>> fetchAgendaData() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/posts?kategori_id=1'), // Fetching data with kategori_id = 1 (Agenda)
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Check if the data contains a valid 'data' key with agenda items
      if (data['data'] != null) {
        return data['data'].where((item) {
          return item['kategori_id'] == 1; // Filter data for kategori_id = 1 (Agenda)
        }).map((item) {
          return {
            'id': item['id'],
            'judul': item['judul'],
            'isi': item['isi'],
            'status': item['status'],
            'created_at': item['created_at'],
            'kategori': item['kategori']['judul'], // Extracting category name
            'petugas': item['petugas']['username'], // Extracting petugas (username)
          };
        }).toList();
      } else {
        throw Exception('No data available');
      }
    } else {
      throw Exception('Failed to load agenda data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
        backgroundColor: Colors.blue, // Warna AppBar biru
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchAgendaData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          }

          // Build the agenda-style layout
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: Colors.blue,
                        width: 1.5), // Ganti warna border menjadi biru
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bagian Tanggal
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.blue, // Warna latar belakang tanggal
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Text(
                              data['created_at'].split(' ')[0].split('-')[2], // Hari dari tanggal
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              data['created_at'].split(' ')[0].split('-')[1], // Bulan dari tanggal
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.0),
                      // Bagian Detail Agenda
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['judul'],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue, // Ganti warna judul menjadi biru
                              ),
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              'Tanggal: ${data['created_at']}',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              data['isi'],
                              style: TextStyle(
                                color: Colors.black87,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[100], // Background abu-abu muda
    );
  }
}
