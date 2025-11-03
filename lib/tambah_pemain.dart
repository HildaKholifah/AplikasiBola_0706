import 'package:flutter/material.dart';
import 'package:quess1/detail_pemain.dart';

class TambahPemain extends StatefulWidget {
  const TambahPemain({super.key});

  @override
  State<TambahPemain> createState() => _TambahPemainState();
}

class _TambahPemainState extends State<TambahPemain> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtr = TextEditingController();
  final _posisiCtr = TextEditingController();
  final _noPunggungCtr = TextEditingController();
  final _kewarganegaraanCtr = TextEditingController();
  final _usiaCtr = TextEditingController();
  final _tinggiBadanCtr = TextEditingController();
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // HEADER
      appBar: AppBar(
        title: Text(
          'IF FOUNDER',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8),

                Text(
                  "Form untuk menambahkan anggota baru yang akan masuk dalam IF FOUNDER CLUB.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: _namaCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    if (value == RegExp(r'^[a-z]+$').toString()) {
                      return 'Nama hanya boleh berisi huruf';
                    }
                    return null;
                  },

                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("Nama Pemain"),
                    hintText: "Masukkan nama pemain",
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _posisiCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Posisi pemain tidak boleh kosong";
                    }
                    if (value == RegExp(r'^[a-z]+$').toString()) {
                      return 'Posisi hanya boleh berisi huruf';
                    }
                    return null;
                  },

                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("Posisi Pemain"),
                    hintText: "Masukkan posisi pemain",
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _noPunggungCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter player number";
                    }

                    final nomor = int.tryParse(value);
                    if (nomor == null) {
                      return "Nomor punggung harus berupa angka";
                    }

                    if (nomor >= 100) {
                      return "Nomor punggung harus kurang dari 100";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    label: Text("Nomor Punggung"),
                    hintText: "Masukkan nomor punggung pemain",
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _kewarganegaraanCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter player nationality";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    label: Text("Kewarganegaraan"),
                    hintText: "Masukkan kewarganegaraan pemain",
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _usiaCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter player age";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    label: Text("Usia Pemain"),
                    hintText: "Masukkan usia pemain",
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _tinggiBadanCtr,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter player height";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    label: Text("Tinggi Pemain (cm)"),
                    hintText: "Masukkan tinggi pemain",
                  ),
                ),

                SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Jenis Kelamin"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: Text("Laki-laki"),
                        value: "Laki-laki",
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() => _gender = value);
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Text("Perempuan"),
                        value: "Perempuan",
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() => _gender = value);
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPemain(
                              nama: _namaCtr.text,
                              posisi: _posisiCtr.text,
                              noPunggung: _noPunggungCtr.text,
                              kewarganegaraan: _kewarganegaraanCtr.text,
                              usia: _usiaCtr.text,
                              tinggi: _tinggiBadanCtr.text,
                              gender: _gender ?? '',
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                    ),
                    child: Text("Tambah Pemain"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
