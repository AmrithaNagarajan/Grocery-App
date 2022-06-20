import 'package:flutter/material.dart';

import 'mainpage.dart';

class BottomNavigation extends StatelessWidget {
  //const BottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top:Radius.circular(25)),
      child: BottomAppBar(
        shape:CircularNotchedRectangle(),
        notchMargin: 7.0,
        color: Colors.green[700],
        child: Container(
          padding: EdgeInsets.fromLTRB(20,10,20,10),
          height: 70,
          width: screenWidth,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                splashColor: Colors.orange,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.widgets_outlined,size: 27,color: Colors.white,),
                    Text("Home",style: TextStyle(color: Colors.white),)
                  ],
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: InkWell(
                  splashColor: Colors.orange,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.card_giftcard,size: 27,color: Colors.white,),
                      Text("Order",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: InkWell(
                  splashColor: Colors.orange,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.local_offer,size: 27,color: Colors.white,),
                      Text("Offers",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.orange,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.menu_open,size: 27,color: Colors.white,),
                    Text("More",style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
