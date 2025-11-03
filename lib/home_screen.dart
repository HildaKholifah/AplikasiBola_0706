import 'package:flutter/material.dart';
import 'package:quess1/tambah_pemain.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('IF FOUNDER'),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset('assets/logo.png', fit: BoxFit.contain),
          ),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Menu Setting diklik')));
            },
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jadwal Pertandingan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.sports_soccer),
                      title: Text(
                        'IF FOUNDER vs TEKLOG FC',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Tanggal: Sabtu, 5 November 2025 \nWaktu: 15.00 WIB \nLokasi: Stadiun Gelora Joko Samudro',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              Text(
                'Menu Utama',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMenuCard(
                      context,
                      Icons.person,
                      'Player',
                      Colors.green,
                    ),
                    _buildMenuCard(
                      context,
                      Icons.calendar_month,
                      'Jadwal',
                      Colors.orange,
                    ),
                    _buildMenuCard(
                      context,
                      Icons.bar_chart,
                      'Klasemen',
                      Colors.blue,
                    ),
                    _buildMenuCard(
                      context,
                      Icons.shopping_bag,
                      'Merchandise',
                      Colors.purple,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              Text(
                'Berita Terbaru',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildNewsCard(
                      'IF FOUNDER menghadiri Inagurasi IF-10!',
                      'Kegiatan tahunan untuk mahasiswa baru Program Studi Informatika.',
                      'assets/if9.jpg',
                    ),
                    _buildNewsCard(
                      'Merayakan Idul Fitri 1445',
                      'Acara dilakukan di Kampus B UISI yang dihadiri dari berbagai angkatan aktif dan bapak/ibu dosen Informatika',
                      'assets/image.png',
                    ),
                    _buildNewsCard(
                      'Kegiatan Makrab IF-9',
                      'Kegiatan yang wajib dilakukan oleh mahasiswa baru agar saling kenal sesama teman angkatan.',
                      'assets/image1.png',
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

  Widget _buildMenuCard(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        if (title == 'Player') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahPemain()),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Menu "$title" diklik')));
        }
      },

      child: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.all(16),
        width: 80,
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(String title, String subtitle, String imagePath) {
    return Container(
      width: 240,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(subtitle, style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
