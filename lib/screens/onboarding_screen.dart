import 'package:flutter/material.dart';
import 'package:recipeapp/constants/imagepath.dart';
import 'package:recipeapp/screens/home.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: h,
                width: w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImagesPath.onBoarding),
                        fit: BoxFit.cover)),
              ),
            ),
            Center(
              child: SizedBox(
                height: h * .19,
                width: w * .20,
                child: Image.asset(
                  ImagesPath.onBoardingTitle,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: h * .243,
                width: w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: h * .032),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Lets Create Good Meal',
                          style: TextStyle(
                              fontSize: w * .06, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                        const Text(
                          'Check out this app and start cooking well',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: h*.032,),
                        SizedBox(
                          width: w*.8,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, 
                              MaterialPageRoute(
                                builder: (context)=> const Home()),);
                            }, 
                            child: const Text('Get Started', 
                            style: TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
