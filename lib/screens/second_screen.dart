import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'third_screen.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.name});
  final String name;

  void _chooseUser(context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ThirdScreen(),
      ),
    );
    if (result != null) {
      Provider.of<UserProvider>(context, listen: false).selectUser(result);
    }
  }

  @override
  Widget build( context) {
    String selectedUserName =
        Provider.of<UserProvider>(context).selectedUserName;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // Tinggi garis pemisah
          child: Container(
            color:
                const Color.fromARGB(125, 206, 206, 206), // Warna garis pemisah
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Welcome'),

            // Menampilkan nama yang diterima dari layar pertama
            Text(name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const Spacer(),

            // Menampilkan nama pengguna yang dipilih atau default
            Center(
              child: Text(
                selectedUserName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),

            // Tombol untuk berpindah ke layar ketiga
            Center(
              child: ElevatedButton(
                onPressed: () => _chooseUser(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 88, 109),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  minimumSize: const Size(360, 50),
                  textStyle: GoogleFonts.poppins(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('Choose a User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
