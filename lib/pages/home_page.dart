// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.api.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/pages/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RecipeModel> _recipes = [];

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10.0,
            ),
            Text("Recipes")
          ],
        ),
      ),
      body: RecipeCard(
        title: "SOME",
        rating: "5.0",
        cookTime: "15 MIN",
        photoUrl:
            "https://lh3.googleusercontent.com/Sd_u2O9p_hwxK4xix_puCGAxWxtf7XyLe1Fhld-4xvxLGo39fYNEiOnij-sT_qn2jZDqWsnv393bqgD1ijoo7Q=s360",
      ),
    );
  }
}
