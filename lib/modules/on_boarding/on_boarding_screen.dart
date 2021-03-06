import 'package:e_guide/modules/log_in/log_in_screen.dart';
import 'package:e_guide/modules/login_signup/login_signup_screen.dart';
import 'package:e_guide/shared/components/components.dart';
import 'package:e_guide/shared/network/local/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel{
  late final String image;
  late final String title1;
  late final String title2;
  late final String body;


  BoardingModel({
    required this.title1,
    required this.title2,
    required this.image,
    required this.body
});

}
class OnBoardingScreen extends StatefulWidget {
  //const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController=PageController();

  List<BoardingModel> boarding=[
    BoardingModel(
        title1: 'Enjoy ',
        title2: 'The World!',
        image: 'assets/images/1.png',
        body: 'Traveling to new destinations is always an experience. Let these talks encourage you to think differently about the places you visit and the people you see.'
    ),
    BoardingModel(
        title1: 'Enjoy ',
        title2: 'The World!',
        image: 'assets/images/2.png',
        body: 'Traveling to new destinations is always an experience. Let these talks encourage you to think differently about the places you visit and the people you see.'
    ),
    BoardingModel(
        title1: 'Enjoy ',
        title2: 'The World!',
        image: 'assets/images/3.png',
        body: 'Traveling to new destinations is always an experience. Let these talks encourage you to think differently about the places you visit and the people you see.'
    ),
    BoardingModel(
        title1: 'Enjoy',
        title2: 'The World!',
        image: 'assets/images/4.png',
        body: 'Traveling to new destinations is always an experience. Let these talks encourage you to think differently about the places you visit and the people you see.'
    ),
  ];
  bool isLast=false;
  void submit(){
    CasheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value){
        navigateAndFinish(
            context,
            LogInScreen()
        );
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: submit,
              child: const Text('SKIP',
              style: TextStyle(
                color: Colors.teal
              ),)
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index){
                  if(index==boarding.length-1){
                    setState(() {
                      isLast=true;
                    });
                    print('last');
                  }else{
                    print('not last');
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                SmoothPageIndicator(
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.teal,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 4
                  ),
                    controller: boardController,
                    count: boarding.length
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast){
                      submit();

                    }
                    else{
                      boardController.nextPage(
                          duration: const Duration(
                              milliseconds: 750
                          ),
                          curve: Curves.fastLinearToSlowEaseIn
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(model.image,
          ),
        ),
      ),
      const SizedBox(height: 5,),
      Text(
        model.title1,
        style: const TextStyle(
            fontSize: 50,
            letterSpacing: 10,
            fontFamily: 'AovelSansRounded',
            fontWeight: FontWeight.bold,
          color: Colors.teal
        ),
      ),
      Text(
        model.title2,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black54
        ),
      ),

      const SizedBox(height: 15,),
      Text(
        model.body,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          fontFamily: 'AovelSansRounded',
          letterSpacing: 2
        ),
      ),
    ],
  );
}
