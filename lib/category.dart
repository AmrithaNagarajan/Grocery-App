import 'package:flutter/material.dart';
import 'package:grocery_mob_app/titlebar.dart';

import 'bottomnavigationbar.dart';
import 'categorycard.dart';

class Category extends StatelessWidget {
  //const Category({Key key}) : super(key: key);

  final List<String> imgpath = ['assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png',
    'assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png',
    'assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png',
    'assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png',
    'assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png',
    'assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png',
    'assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png',
    'assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png',
    'assets/images/vegetablesimg.png','assets/images/fruitsimg.png','assets/images/meatimg.png',];
  final List<String> title = ['Vegetables','Fruits','Meat',
    'Vegetables','Fruits','Meat',
    'Vegetables','Fruits','Meat',
    'Vegetables','Fruits','Meat',
    'Vegetables','Fruits','Meat',
    'Vegetables','Fruits','Meat',
    'Vegetables','Fruits','Meat',
    'Vegetables','Fruits','Meat',
    'Vegetables','Fruits','Meat',
];


  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          TitleBar(screenHeight: screenHeight, screenWidth: screenWidth,back: true,istitle: true,title: "Category",),
          Container(
            margin: EdgeInsets.fromLTRB(0, screenHeight*0.13, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top:Radius.circular(25)),
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.grey[200],
                //height: screenHeight,
                width: screenWidth,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                    width:screenWidth*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(title.length, (index) {
                          return CategoryCard(imgpath:imgpath[index], title:title[index]);
                        }),

                    )
                  ),
                ),
              ),
            ),

          ),
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
