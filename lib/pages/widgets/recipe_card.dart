// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String photoUrl;

  const RecipeCard(
      {super.key,
      required this.title,
      required this.rating,
      required this.cookTime,
      required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
