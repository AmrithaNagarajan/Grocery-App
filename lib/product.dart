import 'package:flutter/material.dart';
import 'package:grocery_mob_app/productdetails.dart';

class Product extends StatefulWidget {
  final String imgpath;
  final String productName;
  final double perkg;
  final double  price;
  const Product({Key? key,this.imgpath:"",this.price:0.0,this.perkg:0.0,this.productName:""}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {

   double quantity=0;
   bool qntyexpand = false;

  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        width: screenWidth*0.43,
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.imgpath,height: 100,width: 100,),
            Text(widget.productName+"($quantity KG)",style: TextStyle(fontSize: 15,color: Colors.grey[900]),),
            Text("\$"+widget.perkg.toString()+"/kg",style: TextStyle(fontSize: 13,color: Colors.grey[400]),),
            Text("\$"+widget.price.toString(),style: TextStyle(fontSize: 17,color: Colors.green[700],fontWeight: FontWeight.bold),),
            Align(alignment: Alignment.bottomRight,
                child:Column(
                  children: [
                    if(qntyexpand)
                      InkWell(
                      child: Container(
                        width:35,
                        height: 35,
                        color: Colors.green[700],
                        child: Icon(Icons.add,color: Colors.white,),
                      ),
                      onTap: (){
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                    InkWell(
                      child: Container(
                        width:35,
                        height: 35,
                        padding: ((quantity>0 || qntyexpand)? EdgeInsets.fromLTRB(0, 6, 0, 0):EdgeInsets.fromLTRB(0, 0, 0, 0)),
                        decoration: (!qntyexpand?BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
                          color: Colors.green[900],
                        ):BoxDecoration(
                          color: Colors.green[900],
                        )),

                        child: ((quantity==0&&!qntyexpand)? Icon(Icons.add,color: Colors.white,):Text("$quantity",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.white),)),
                      ),
                      onTap: (){
                        setState(() {
                          qntyexpand = !qntyexpand;
                        });

                      },
                    ),
                    if(qntyexpand)
                      InkWell(
                      child: Container(
                        width:35,
                        height: 35,
                        color: Colors.green[700],
                        child: Icon(Icons.remove,color: Colors.white,),
                      ),
                      onTap: (){
                        setState(() {
                          if(quantity>0)
                            quantity--;
                        });
                      },
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetails(imgpath: widget.imgpath,title: widget.productName,perkg: widget.perkg,price: widget.price,)),
        );
      },
    );
  }
}
