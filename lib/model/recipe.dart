class Recipe {
  final String title;
  final int readyInMinutes;
  final String image;
  final String sourceUrl;

  Recipe(
      {required this.title,
      required this.readyInMinutes,
      required this.image,
      required this.sourceUrl});

  @override
  String toString() {
    return "Recipe: {title:$title, readyInMinutes: $readyInMinutes, image:$image, sourceUrl:$sourceUrl}";
  }
}
