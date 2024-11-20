

import 'package:flutter/material.dart';

class ShowDialog{

  static Future showCalories(Map<String,dynamic> item, BuildContext context) async{

    int fat=item['FAT']['quantity'].toInt();
    int sfat=item['FASAT']['quantity'].toInt();
    int cholesterol=item['CHOLE']['quantity'].toInt();
    int nA=item['NA']['quantity'].toInt();
    int carbonhydrate=item['CHOCOF.net']['quantity'].toInt();
    int protein=item['PROCNT']['quantity'].toInt();
    int sugar=item['SUGAR']['quantity'].toInt();

    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(

          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          backgroundColor: Colors.redAccent,
          title: const Center(
            child: Padding(padding: EdgeInsets.only(bottom: 10),
            child: Text('Nutritional Fact', style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400
            ),),),
          ),
          content: Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10)
              )
            ),
            child:  Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Fat'),
                    Text(fat.toString()),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Saturated Fat'),
                    Text(sfat.toString()),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Cholesterol'),
                    Text(cholesterol.toString()),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sodium'),
                    Text(nA.toString()),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Carbonhydrate'),
                    Text(carbonhydrate.toString()),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Protein'),
                    Text(protein.toString()),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sugar'),
                    Text(sugar.toString()),
                  ],
                ),

              ],
            ),),
          ),
        );
      });
  }
}
