class Recipe {
  final String title;
  final int readyInMinutes;
  final String image;

  Recipe({required this.title, required this.readyInMinutes, required this.image,});

  @override
  String toString() {
    return "Recipe: {title:$title, readyInMinutes: $readyInMinutes, image:$image}";
  }
}