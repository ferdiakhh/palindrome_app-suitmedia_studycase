import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palindrome_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'screens/first_screen.dart';

// Main function 
void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => UserProvider()),
       ], 
       child: const MyApp(),
    ),
  );
}

// Kelas MyApp sebagai root widget dari aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palindrome App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const FirstScreen(), // Layar pertama yang ditampilkan adalah FirstScreen
    );
  }
}
