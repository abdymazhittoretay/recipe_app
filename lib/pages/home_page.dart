// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/pages/widgets/recipe_card.dart';
import 'package:url_launcher/url_launcher.dart';

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
        {"apiKey": "5960bf80f0db481fbe0ce0f910a62e10", "number": "20"}));
    var data = jsonDecode(response.body);

    for (var i in data["recipes"]) {
      final recipe = Recipe(
          title: i["title"] ?? "ERROR",
          readyInMinutes: i["readyInMinutes"] ?? -1,
          image: i["image"] ??
              "https://i.pinimg.com/736x/73/b6/6d/73b66d9790c99f0bb027f5197e94870b.jpg",
          sourceUrl: i["sourceUrl"] ?? "https://leetcode.com/problemset/algorithms/?sorting=W3t9XQ%3D%3D");
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
                        image: recipes[index].image,
                        onTap: () async {
                          final Uri _url = Uri.parse(recipes[index].sourceUrl);
                          if(await canLaunchUrl(_url)){
                            await launchUrl(_url);
                          }
                        },);
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
