// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/database/boxes.dart';
import 'package:recipe_app/model/favorite.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/pages/favorites_page.dart';
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
          sourceUrl: i["sourceUrl"] ??
              "https://leetcode.com/problemset/algorithms/?sorting=W3t9XQ%3D%3D");
      recipes.add(recipe);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        title: Text(
          "Recipes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritesPage(),
                    )).then((_) {
                  setState(() {});
                });
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ))
        ],
      ),
      body: recipes.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final Recipe recipe = recipes[index];
                    final bool isFavorite = favBox.values.any((element) {
                      return element.title == recipe.title &&
                          element.sourceUrl == recipe.sourceUrl;
                    });
                    return RecipeCard(
                      title: recipe.title,
                      readyInMinutes: recipe.readyInMinutes,
                      image: recipe.image,
                      onTap: () async {
                        final Uri url = Uri.parse(recipe.sourceUrl);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      onPressed: () {
                        setState(() {
                          if (isFavorite) {
                            final deleteKey = favBox.keys.firstWhere((key) {
                              final Favorite someValue = favBox.get(key);
                              return someValue.title == recipe.title &&
                                  someValue.sourceUrl == recipe.sourceUrl;
                            });
                            favBox.delete(deleteKey);
                          } else {
                            favBox.add(Favorite(
                                title: recipe.title,
                                readyInMinutes: recipe.readyInMinutes,
                                image: recipe.image,
                                sourceUrl: recipe.sourceUrl));
                          }
                        });
                      },
                      isFavorite: isFavorite,
                    );
                  }),
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
    );
  }
}
