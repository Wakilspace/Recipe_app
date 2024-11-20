import 'package:flutter/material.dart';
import 'package:recipeapp/constants/constant_function.dart';
import 'package:recipeapp/screens/details_screen.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key, required List tabs});

  @override
  Widget build(BuildContext context) {
    final h= MediaQuery.of(context).size.height;
    final w= MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: h*.05,
            child: TabBar(
              unselectedLabelColor: Colors.lightGreen,
              labelColor: Colors.white,
              dividerColor: Colors.white,
              indicator: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(25),
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: w*.012),
              tabs:const [
                TabItem(title:'Quick'),
                TabItem(title:'Quick'),
                TabItem(title:'Quick'),
                TabItem(title:'Quick'),
              ]
            ),
          ),
          SizedBox(height: h*.02,),

          SizedBox(
            height: h,
            child: const TabBarView(
              children: [
                HomeTab(recipe: 'quick'),
                HomeTab(recipe: 'quick'),
                HomeTab(recipe: 'quick'),
                HomeTab(recipe: 'quick'),
              ]),
          )
        ],
      ),
    );
  }
}




class HomeTab extends StatelessWidget {
  final String recipe;
  const HomeTab({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: ConstantFunction.getResponse(recipe),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No Data'),
            );
          }
          return SizedBox(
            height: h*.02,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Map<String,dynamic> snap=snapshot.data![index];
                  int time=snap['totalTime'].toInt();
                  int calories=snap['calories'].toInt();
                  return Container(
                    margin: EdgeInsets.only(
                      right: w*.02,
                    ),
                    width: w*.5,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context)=>
                                DetailsScreen(item: snap,)));
                              },
                              child: Container(
                                height: 200,
                                width: 200,
                              
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(image: NetworkImage(snap['image']),
                                  fit: BoxFit.fill
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: h*.001,),
                                
                            Text(snap['label'],
                            style: TextStyle(
                              fontSize: w*.035,
                                
                              fontWeight: FontWeight.bold
                            ),),
                            SizedBox( height: h*.01,),
                            Text('Calories:${calories.toString()}. Time:${time.toString()}',
                            style: TextStyle(
                              fontSize: w*.03,color: Colors.grey
                            ),)
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 15,
                  );
                },
                itemCount: snapshot.data!.length),
          );
        });
  }
}


class TabItem extends StatelessWidget {
  final String title;
  const TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Text(title, style: const TextStyle(
            fontSize: 9
          ),),
        ),),
    );
  }
}