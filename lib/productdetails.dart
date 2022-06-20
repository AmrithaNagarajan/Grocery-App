import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_mob_app/reviewcontainerclipper.dart';

class ProductDetails extends StatefulWidget {
  final String title;
  final String imgpath;
  final double perkg;
  final double price;
  const ProductDetails({Key? key,required this.imgpath,this.title="",this.price=0,this.perkg=0}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool review=false;
  double quantity = 1;
  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight*0.25,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(widget.imgpath),

              )
            ),
            child:Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                icon: Icon(Icons.arrow_back),
                iconSize: 27,
                color: Colors.grey[700],
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, screenHeight*0.24, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top:Radius.circular(25)),
              child: Container(
                height: screenHeight,
                width: screenWidth,
                color: Colors.grey[200],
                child:ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(widget.title,textAlign: TextAlign.center,style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.grey[900]),),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                                child: Text("\$"+ widget.perkg.toString() +"/kg",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.grey[600]),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$"+widget.perkg.toString(),style: TextStyle(fontSize: 15,color: Colors.grey[900]),),
                                Text("14 Calories",style: TextStyle(fontSize: 15,color: Colors.grey[900]),),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(Icons.star_half_outlined,color: Colors.yellow[700],),
                                    Text("4.5",style: TextStyle(color: Colors.grey[900]),),
                                    Text("\(253\)",style: TextStyle(color: Colors.grey[400]),),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Container(
                                      height: 27,
                                      width: 27,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green,
                                      ),
                                      child: Icon(Icons.remove,color: Colors.white,),
                                    ),
                                    onTap: (){
                                      setState(() {
                                        if(quantity>0){
                                          quantity--;
                                        }
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Text("$quantity kg",style: TextStyle(fontSize: 17),),
                                  ),
                                  InkWell(
                                    child: Container(
                                      height: 27,
                                      width: 27,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green,
                                      ),
                                      child: Icon(Icons.add,color: Colors.white,),
                                    ),
                                    onTap: (){
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),


                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding:EdgeInsets.fromLTRB(0, 0, 0, 7),
                                        child: InkWell(
                                            child: Text("Details",style: (review?TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.grey[400]):TextStyle(fontSize:15,fontWeight: FontWeight.bold,)),),
                                            onTap: (){
                                              setState(() {
                                                review=false;
                                              });
                                            },
                                        ),
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding:EdgeInsets.fromLTRB(0, 0, 5, 7),
                                      child: InkWell(
                                        child: Text("Review",style: (review?TextStyle(fontSize:15,fontWeight: FontWeight.bold):TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.grey[400])),),
                                        onTap: (){
                                          setState(() {
                                            review=true;
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.orangeAccent,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0,20, 0, 0),
                                child: ClipPath(
                                  clipper: ReviewContainerClipper(review: review),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                                    //height:100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.green[600],
                                    ),
                                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, "
                                        "consectetur adipiscing elit. Etiam porttitor sapien ipsum, sit amet euismod lorem vehicula id. "
                                        "Sed consequat lacus eu nisl posuere, at tempus elit mattis. Suspendisse posuere elit vitae sapien"
                                        " gravida, at lobortis magna fringilla.",textAlign: TextAlign.justify,style: TextStyle(color: Colors.white,fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Strawberry",textAlign: TextAlign.center,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.grey[900]),),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                              child: Text("\$ 17.00/kg",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.grey[600]),),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$ 17.00/kg",style: TextStyle(fontSize: 15,color: Colors.grey[900]),),
                              Text("14 Calories",style: TextStyle(fontSize: 15,color: Colors.grey[900]),),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.star_half_outlined,color: Colors.yellow[700],),
                                  Text("4.5",style: TextStyle(color: Colors.grey[900]),),
                                  Text("\(253\)",style: TextStyle(color: Colors.grey[400]),),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  child: Container(
                                    height: 27,
                                    width: 27,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                    child: Icon(Icons.remove,color: Colors.white,),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      if(quantity>0){
                                        quantity--;
                                      }
                                    });
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Text("$quantity kg",style: TextStyle(fontSize: 17),),
                                ),
                                InkWell(
                                  child: Container(
                                    height: 27,
                                    width: 27,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                    child: Icon(Icons.add,color: Colors.white,),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height:screenHeight*0.25,
                    )
                  ],*/