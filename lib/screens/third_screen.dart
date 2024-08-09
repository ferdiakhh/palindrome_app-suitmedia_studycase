import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';
import '../widgets/user_list_tile.dart';

// Stateful widget untuk layar ketiga
class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  ThirdScreenState createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  List users = [];
  int currentPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  // Fungsi untuk mengambil data pengguna dari API
  Future<void> _fetchUsers() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$currentPage'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        users.addAll((data['data'] as List).map((json) => User(
          firstName: json['first_name'],
          lastName: json['last_name'],
          email: json['email'],
          avatar: json['avatar'],
        )).toList());
        currentPage++;
        isLoading = false;
      });
    }
  }

  // Fungsi untuk menrefresh data pengguna
  Future<void> _refreshUsers() async {
    setState(() {
      users.clear();
      currentPage = 1;
    });
    await _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen',
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: const Color.fromARGB(125, 206, 206, 206),
          height: 1.0,
        ),
      ),
      ),
      // Menampilkan indikator loading jika sedang memuat data dan data kosong
      body: isLoading && users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refreshUsers,
              child: ListView.builder(
                itemCount: users.length + 1, 
                itemBuilder: (context, index) {
                  // Menampilkan indikator loading di akhir daftar
                  if (index == users.length) {
                    return isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox.shrink();
                  }
                  final user = users[index];
                  // Menggunakan UserListTile untuk menampilkan setiap pengguna dalam daftar
                  return UserListTile(
                    user: user,
                    onTap: () {
                      // Mengembalikan nama pengguna yang dipilih ke layar kedua
                      Navigator.pop(context, user);
                    },
                  );
                },
              ),
            ),
    );
  }
}
