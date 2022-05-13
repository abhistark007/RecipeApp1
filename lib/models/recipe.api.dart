import 'dart:convert';
import 'recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
//   const req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
  // "limit": "24",
  // "start": "0"
// });

// req.headers({
  // "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
  // "X-RapidAPI-Key": "e0bdefd8acmsh5fe9b403c8f588ep14d5c3jsnb547865f5b62",
  // "useQueryString": true
// });

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list", {
      "limit": "18",
      "start": "0",
      "tag":"list.recipe.popular"
    });

    final response = await http.get(uri, headers: {
       "X-RapidAPI-Key": "e0bdefd8acmsh5fe9b403c8f588ep14d5c3jsnb547865f5b62",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true",
    });

    Map data=jsonDecode(response.body);
    List temp=[];

    for(var i in data['feed']){
      temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}
