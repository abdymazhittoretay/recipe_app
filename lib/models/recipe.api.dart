import 'dart:convert';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<RecipeModel>> getRecipe() async {
    var uri = Uri.https(
        "yummly2.p.rapidapi.com", "/feeds/list", {"limit": '24', "start": '0'});

    final response = await http.get(uri, headers: {
      'x-rapidapi-key': 'b5892546f5mshcc684049a630c7ap1030c0jsnbb47f7c79370',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data["feed"]) {
      temp.add(i["content"]["details"]);
    }

    return RecipeModel.getRecipesFromSnapshot(temp);
  }
}
