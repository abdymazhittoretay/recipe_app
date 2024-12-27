// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final int readyInMinutes;
  final String image;
  final void Function()? onTap;
  final void Function()? onPressed;
  final bool isFavorite;

  const RecipeCard(
      {super.key,
      required this.title,
      required this.readyInMinutes,
      required this.image,
      required this.onTap,
      required this.isFavorite,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.2,
      margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
          borderRadius: BorderRadius.circular(10.0)),
      child: Stack(children: [
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Icon(
                  Icons.link,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Link",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              Icon(
                Icons.timelapse,
                color: Colors.white,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "$readyInMinutes min",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
                onPressed: onPressed,
                icon: isFavorite
                    ? Icon(
                        Icons.favorite,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ))),
      ]),
    );
  }
}
