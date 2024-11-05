import 'package:flutter/material.dart';
import '../models/skin.dart';

class SkinDetailScreen extends StatelessWidget {
  final Skin skin;

  SkinDetailScreen({required this.skin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0,
        title: Text(
          skin.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey[850]!, Colors.black],
              ),
            ),
            child: Opacity(
              opacity: 0.5, // Set opacity untuk kejelasan teks di atas gambar
              child: Image.asset(
                skin.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          // Content overlay
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(), // Tambahkan Spacer untuk menurunkan konten ke bawah
                  Text(
                    skin.name,
                    style: TextStyle(
                      fontSize: 32, // Perbesar ukuran teks
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Type: ${skin.type}",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  Text(
                    "Release Date: ${skin.releaseDate}",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  Text(
                    "Availability: ${skin.availability}",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  Text(
                    "Price: ${skin.price}",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Choose Skin",
                      style: TextStyle(fontSize: 20), // Perbesar ukuran teks tombol
                    ),
                  ),
                  SizedBox(height: 30), // Tambahkan jarak di bawah tombol
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
