import 'package:flutter/material.dart';
import 'package:receipe_app_1/models/recipe.api.dart';
import 'package:receipe_app_1/views/widgets/recipe_card.dart';

import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes;
  bool isLoading=true;

  @override
  void initState() { 
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe() async{
    recipes=await RecipeApi.getRecipe();
    setState(() {
      isLoading=false;
    });
    print(recipes);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text("Food Recipe"),
          ],
        ),
      ),
      body: isLoading?Center(child: CircularProgressIndicator(),)
      :ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context,index){
          return RecipeCard(
            title: recipes[index].name,
            cookTime: recipes[index].totalTime,
            rating: recipes[index].rating.toString(),
            thumbnailUrl: recipes[index].images,
          );
        },
      ), 
      );
  }
}
