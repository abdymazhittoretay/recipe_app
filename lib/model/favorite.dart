import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(typeId: 1)
class Favorite {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final int readyInMinutes;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String sourceUrl;

  Favorite(
      {required this.title,
      required this.readyInMinutes,
      required this.image,
      required this.sourceUrl});
}
