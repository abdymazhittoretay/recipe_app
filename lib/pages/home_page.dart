// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/pages/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [];

  // get recipes, Future is used because we need to wait response from api
  Future getRecipes() async {
    var response = await http.get(Uri.https(
        "api.spoonacular.com",
        "/recipes/random",
        {"apiKey": "5960bf80f0db481fbe0ce0f910a62e10", "number": "100"}));
    var data = jsonDecode(response.body);

    for (var i in data["recipes"]) {
      final recipe = Recipe(
          title: i["title"] ?? "",
          readyInMinutes: i["readyInMinutes"] ?? 0,
          image: i["image"] ?? "");
      recipes.add(recipe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getRecipes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                        title: recipes[index].title,
                        readyInMinutes: recipes[index].readyInMinutes,
                        image: recipes[index].image);
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          }),
    );
  }
}
