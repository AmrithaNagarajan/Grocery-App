import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_mob_app/bottomnavigationbar.dart';
import 'package:grocery_mob_app/category.dart';
import 'package:grocery_mob_app/offercard.dart';
import 'package:grocery_mob_app/titlebar.dart';

import 'categorycard.dart';

class MainPage extends StatefulWidget {
  //const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<String> imgpath = ['assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png','assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png'];
  final List<String> title = ['Vegetables','Fruits','Meat','Vegetables','Fruits','Meat'];

  final List<String> offerimg = ['assets/images/offerimg1.png','assets/images/offerimg1.png','assets/images/offerimg1.png'];
  final List<String> offerTitle = ["30% Discount","20% Discount","15% Discount"];
  final List<String> subTitle = ["Order any food from app\n and get discount.","Order any food from app\n and get discount.","Order any food from app\n and get discount."];
  final List<Color> bgColor = [Colors.red.withOpacity(0.3),Colors.green.withOpacity(0.3),Colors.red.withOpacity(0.3)];

  final List<String> popularDealImg =['assets/images/vegetablesimg1.png','assets/images/meat1.png','assets/images/vegetablesimg1.png'];

  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          TitleBar(screenHeight: screenHeight, screenWidth: screenWidth,welcomemsg: true,profileimg: true,searchbar: true,),
          Container(
            margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top:Radius.circular(25)),
              child: Container(
                //padding: EdgeInsets.all(15),
                color: Colors.grey[200],
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        width: screenWidth*0.8,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Categories",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey[900]),),
                                InkWell(
                                  child: Text("See all",style: TextStyle(color: Colors.green[700],fontWeight: FontWeight.w600),),
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Category()),
                                    );
                                  },
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0,10, 0, 0),
                              height: 150,
                              child:ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (BuildContext context,int index){
                                  return CategoryCard(imgpath:imgpath[index], title:title[index]);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 170,
                      //width: screenWidth,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(0),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index){
                          return OfferCard(offerimg: offerimg[index],title: title[index],subTitle: subTitle[index],bgcolor: bgColor[index],);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 60),
                      child: Container(
                        width: screenWidth*0.8,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Popular Deals",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey[900]),),
                                InkWell(
                                  child: Text("See all",style: TextStyle(color: Colors.green[700],fontWeight: FontWeight.w600),),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0,10, 0, 0),
                              height: 150,
                              child:ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (BuildContext context,int index){
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      height: 100,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(popularDealImg[index]),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),
          ),

          /*Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top:Radius.circular(25)),
                color: Colors.green[700],
              ),

            ),
          )*/
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 65,
        width: 65,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green[700]
        ),
        child: FittedBox(
          fit: BoxFit.fill,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.green[700],

            //shape:StadiumBorder(side: BorderSide(color: Colors.green, width: 4,)),
            onPressed: (){},
            child : Icon(Icons.add_shopping_cart_rounded,size: 33,),
            elevation: 2.0,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
