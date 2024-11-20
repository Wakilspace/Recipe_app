import 'package:flutter/material.dart';
import 'package:recipeapp/screens/all_recipe.dart';
class RecipeView extends StatelessWidget {
  final String name, image;
  const RecipeView({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => AllRecipe(recipe: name)));
      },
      child: SizedBox(
        height: h*.170,
        width: w*.150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: h*.120,
              width: w*.120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(10),
                image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
              ),
            ),
      
            Center(
              child: Text(name, style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45
              ),),
            )
          ],
         ),
       ),
    );
   }
}    