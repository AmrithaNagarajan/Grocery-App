import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_mob_app/product.dart';
import 'package:grocery_mob_app/titlebar.dart';
import 'bottomnavigationbar.dart';
class FruitProduct extends StatefulWidget {
  final String title;
  const FruitProduct({Key? key,this.title=""}) : super(key: key);


  @override
  _FruitProductState createState() => _FruitProductState();
}

class _FruitProductState extends State<FruitProduct> {
  final List<String> imgpath = ['assets/images/Strawberry.png','assets/images/Banana.png','assets/images/Orange.png','assets/images/Strawberry.png','assets/images/Banana.png','assets/images/Orange.png','assets/images/Strawberry.png','assets/images/Banana.png','assets/images/Orange.png'];
  final List<String> productName = ['Strawberry','Banana','Orange','Strawberry','Banana','Orange','Strawberry','Banana','Orange'];
  final List<double> perkg = [17.0,15.0,13.0,17.0,15.0,13.0,17.0,15.0,13.0];
  final List<double> price = [17.0,15.0,13.0,17.0,15.0,13.0,17.0,15.0,13.0];


  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          TitleBar(screenHeight: screenHeight, screenWidth: screenWidth,istitle: true,title:widget.title,),
          Container(
          margin: EdgeInsets.fromLTRB(0, screenHeight*0.13, 0, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top:Radius.circular(25)),
            child: Container(
              padding: EdgeInsets.all(15),
              color: Colors.grey[200],
              height: screenHeight,
              width: screenWidth,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 50),
                  //width:screenWidth*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child:Wrap(
                    runSpacing: 7,
                    spacing: 0,
                    alignment: WrapAlignment.center,
                    children:
                      List.generate(productName.length, (index) {
                        return Product(imgpath:imgpath[index],productName:productName[index],perkg:perkg[index],price: price[index],);
                  }
                  ),
                ),
              ),
            ),
          ),

          ),
          )
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
