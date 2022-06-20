import 'package:flutter/material.dart';
import 'package:grocery_mob_app/fruitproducts.dart';

class CategoryCard extends StatelessWidget {
  final String imgpath;
  final String title;
  const CategoryCard({Key? key,required this.imgpath,this.title:""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: InkWell(
        child: Column(
          //mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children:[
            Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:Colors.lightGreen[50],
                ),
                child: Image.asset('$imgpath',)
            ),
            Text("$title",style: TextStyle(color: Colors.grey[700],),)
          ],
        ),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FruitProduct(title:title)),
          );
        },
      ),
    );
  }
}
