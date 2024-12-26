// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          "Favorites",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text("No favorites yet."),
      ),
    );
  }
}
