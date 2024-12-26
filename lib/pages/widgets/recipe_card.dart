// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final int readyInMinutes;
  final String image;
  final void Function()? onTap;

  const RecipeCard({
    super.key,
    required this.title,
    required this.readyInMinutes,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.2,
        margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken)),
            borderRadius: BorderRadius.circular(10.0)),
        child: Stack(children: [
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
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }
}
