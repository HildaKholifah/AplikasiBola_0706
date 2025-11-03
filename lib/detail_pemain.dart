import 'package:flutter/material.dart';
import 'package:quess1/home_screen.dart';
import 'package:quess1/tambah_pemain.dart';

class DetailPemain extends StatelessWidget {
  final String nama;
  final String posisi;
  final String noPunggung;
  final String kewarganegaraan;
  final String usia;
  final String tinggi;
  final String gender;

  const DetailPemain({
    super.key,
    required this.nama,
    required this.posisi,
    required this.noPunggung,
    required this.kewarganegaraan,
    required this.usia,
    required this.tinggi,
    required this.gender,
  });

  double _konversiTinggiKeMeter(String tinggiCm) {
    final cm = double.tryParse(tinggiCm) ?? 0;
    return cm / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Pemain',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfo("Nama Pemain", nama),
            _buildInfo("Posisi Pemain", posisi),
            _buildInfo("Nomor Punggung", noPunggung),
            _buildInfo("Kewarganegaraan", kewarganegaraan),
            _buildInfo("Usia Pemain", "$usia tahun"),
            _buildInfo(
              "Tinggi Badan",
              "${_konversiTinggiKeMeter(tinggi).toStringAsFixed(2)} meter",
            ),
            _buildInfo("Jenis Kelamin", gender),

            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 140,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => TambahPemain()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Cancel"),
                  ),
                ),

                SizedBox(
                  width: 140,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Save"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              "$label:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(child: Text(value, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
