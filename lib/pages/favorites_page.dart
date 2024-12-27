// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipe_app/database/boxes.dart';
import 'package:recipe_app/model/favorite.dart';
import 'package:recipe_app/pages/widgets/recipe_card.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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
      body: favBox.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                  itemCount: favBox.length,
                  itemBuilder: (context, index) {
                    final Favorite favorite =
                        favBox.getAt(favBox.values.length - 1 - index);
                    return RecipeCard(
                        title: favorite.title,
                        readyInMinutes: favorite.readyInMinutes,
                        image: favorite.image,
                        onTap: () async {
                          final Uri url = Uri.parse(favorite.sourceUrl);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        onPressed: () {
                          setState(() {
                            final deleteKey = favBox.keys.firstWhere((key) {
                              final Favorite someFav = favBox.get(key);
                              return someFav.title == favorite.title &&
                                  someFav.sourceUrl == favorite.sourceUrl;
                            });
                            favBox.delete(deleteKey);
                          });
                        },
                        isFavorite: true);
                  }),
            )
          : Center(
              child: Text("No favorites yet."),
            ),
    );
  }
}
