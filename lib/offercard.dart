import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String offerimg;
  final String title;
  final String subTitle;
  final Color bgcolor;
  const OfferCard({Key? key,required this.offerimg,this.title:"",this.bgcolor:Colors.green,this.subTitle:""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 15),
      child: Container(
        padding: EdgeInsets.all(15),
          height: 160,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgcolor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('$offerimg'),
                backgroundColor: Colors.transparent,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("$title",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,color: bgcolor.withOpacity(0.8)),),
                    Flexible(child: Text("$subTitle",maxLines: 3,softWrap: true,style: TextStyle(color: Colors.grey[700]),)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                        child: Text("Order Now",style: TextStyle(color: Colors.red[700],fontSize: 15,fontWeight: FontWeight.bold),))
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
