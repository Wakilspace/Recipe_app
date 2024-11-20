import 'package:flutter/material.dart';
import 'package:recipeapp/components/ingredient_item.dart';

class IngredientsList extends StatelessWidget {
  final List<dynamic> ingredients;
  const IngredientsList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(
        parent: NeverScrollableScrollPhysics(),
      ),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
      int quantity=ingredients[index]['quantity'].toInt()?? 1;



      return  IngredientItem(
        quantity: quantity.toString(), 
        measure: ingredients[index]['measure']??'', 
        food: ingredients[index]['food']??'', 
        imageUrl: ingredients[index]['image']??'',);
      },
    );
  }
}