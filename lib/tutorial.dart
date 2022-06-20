import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_mob_app/mainpage.dart';
import 'package:grocery_mob_app/signup.dart';
import 'package:grocery_mob_app/titlebar.dart';
import 'package:flutter/services.dart' ;
import 'package:dots_indicator/dots_indicator.dart';

class TutorialPage extends StatefulWidget {
  //const TitlePage({Key key}) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final List<String> imgpath = ["assets/images/tutorialimg1.png","assets/images/tutorialimg2.png","assets/images/tutorialimg3.png"];
  final List<String> title = ["Shop your daily needs","Exciting Offers","1000+ products"];
  final List<String> subtitle = ["You won't find it cheaper anywhere else than here.","Get new offers and great deals everyday and every hour.","Shop and get delivery at your convenience."];

  PageController tutorialPageController = PageController(initialPage: 0);
  int currentPage = 0;

  Widget TutorialCard(String imgpath, String title, String subtitle){
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: CircleAvatar(
              radius: 100,
              backgroundImage:AssetImage('$imgpath'),
              backgroundColor: Colors.white,
            ),
          ),
          /*Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('$imgpath'),
              )
            ),
          ),*/
          Text("$title",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 23),),
          Text("$subtitle",textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:OrientationBuilder(
        builder: (context,orientation){
          return Stack(
            children: [
              TitleBar(screenWidth:screenWidth,screenHeight: screenHeight,back: true,skip:true),
              Container(
                margin: orientation==Orientation.portrait?EdgeInsets.fromLTRB(0, screenHeight*0.13, 0, 0):EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top:Radius.circular(25)),
                  child: Container(
                      color: Colors.grey[200],
                      child:Column(
                        //shrinkWrap: true,
                        //padding: EdgeInsets.all(0),
                        children:[
                          Expanded(
                            child: Container(
                              height: orientation==Orientation.portrait?screenHeight*0.75:screenHeight*1.3,
                              padding: EdgeInsets.all(15),
                              child: Stack(
                                children:[
                                  PageView.builder(
                                    controller: tutorialPageController,
                                    itemCount: 3,

                                    itemBuilder: (BuildContext, int index){
                                      return TutorialCard(imgpath[index], title[index], subtitle[index]);
                                    },
                                    onPageChanged: (page){
                                      setState(() {
                                        currentPage=page;
                                        print(page);
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: DotsIndicator(
                                        position: currentPage.toDouble(),
                                        dotsCount: 3,
                                        decorator: DotsDecorator(
                                          color: Colors.grey,
                                          activeColor: Colors.green,
                                          activeSize: Size.square(13),
                                        ),


                                      ),
                                    ),
                                  )
                                ],
                              ),


                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(30,10,30,20),
                            width: screenWidth,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(top:Radius.circular(20)),
                              color: Colors.white,
                            ),
                            child: InkWell(
                              child: SizedBox(
                                width: 200,
                                height: 20,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green[700],
                                  ),
                                  child: Text("Get Started",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.white,),),
                                )
                              ),
                              onTap: () {
                                if(currentPage<2){
                                  setState(() {
                                    currentPage++;
                                  });
                                  tutorialPageController.animateToPage(currentPage, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                                }
                                else{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignUp()),
                                  );
                                }},
                            ),

                          ),
                        ],
                      )
                  ),
                ),
              ),


            ],
          );
        },
      ),

    );
    /*Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: TitleBar(),
      ),
      body: Container(
        color: Colors.grey[300],
        child:ClipPath(
          clipper: BodyClipper(),
          child: Container(
            color: Colors.red,
          ),

        ),
      ),
    );*/
  }
}


