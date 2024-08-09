import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'second_screen.dart';

// Stateful widget untuk layar pertama
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  // Fungsi untuk memeriksa apakah teks merupakan palindrome
  bool isPalindrome(String text) {
    String cleanedText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join('');
    return cleanedText == reversedText;
  }

  // Fungsi untuk menampilkan dialog hasil cek palindrome
  void _checkPalindrome() {
    String text = _palindromeController.text;
    if (text.isEmpty){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text("Please enter a text to check if it's a palindrome.", 
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,),
            actions: [
              Center(child: TextButton(
                child: const Text("OK",style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ),
            ],
          );
        },
      );
    } else{
    bool result = isPalindrome(text);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(result ? "This Text is Palindrome" : "Not Palindrome", 
          style: const TextStyle(fontSize: 20), 
          textAlign: TextAlign.center,),
          actions: [
            Center(child: TextButton(
                child: const Text("OK",style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ),
          ],
        );
      },
    );
  }
  }

  // Fungsi untuk berpindah ke layar kedua
  void _nextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(name: _nameController.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpeg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Avatar lingkaran icon add
                   CircleAvatar(
                    radius: 70,
                    child: Image.asset('assets/images/btn_add.png'),
                  ),
                  const SizedBox(height: 60),


                  // TextField untuk input nama
                  SizedBox(
                    width: 360, height: 55,
                    child: TextField(
                      controller: _nameController,
                      decoration:   InputDecoration(
                        hintText: 'Name',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 138, 139, 139),     
                            fontSize: 18,     
                          ),
                        fillColor: Colors.white,  
                        filled: true,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder( 
                        borderSide: const BorderSide(color: Colors.blue, width: 2),
                       borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),


                  // TextField untuk input palindrome
                  SizedBox(
                    width: 360, height: 55,
                    child: TextField(
                      controller: _palindromeController,
                      decoration:  InputDecoration(
                        hintText: 'Palindrome',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 138, 139, 139),       
                          fontSize: 18),
                        fillColor: Colors.white,  
                        filled: true,            
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          ),
                        focusedBorder: OutlineInputBorder( 
                        borderSide: const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Tombol untuk cek palindrome
                  ElevatedButton(
                    onPressed: _checkPalindrome,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 36, 88, 109),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      minimumSize: const Size(360, 50),
                      textStyle: GoogleFonts.poppins(
                      fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                    ),
                    ),
                    child: const Text('CHECK'),
                  ),
                  const SizedBox(height: 10),

                  // Tombol untuk berpindah ke secondscreen
                  ElevatedButton(
                    onPressed: _nextScreen,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 36, 88, 109),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      minimumSize: const Size(360, 50),
                      textStyle: GoogleFonts.poppins(
                      fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                    ),
                    ),
                    child: const Text('NEXT'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
