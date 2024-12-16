class RecipeModel {
  final String title;
  final double rating;
  final String cookTime;
  final String photoUrl;

  RecipeModel(
      {required this.title,
      required this.rating,
      required this.cookTime,
      required this.photoUrl});

  factory RecipeModel.fromJson(dynamic json) {
    return RecipeModel(
        title: json["name"] as String,
        rating: json["rating"] as double,
        cookTime: json["totalTime"] as String,
        photoUrl: json["images"][0]["hostedLargeUrl"] as String);
  }

  static List<RecipeModel> getRecipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return RecipeModel.fromJson(data);
    }).toList();
  }
}
