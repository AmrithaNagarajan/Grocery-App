import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_mob_app/mainpage.dart';
import 'package:grocery_mob_app/fruitproducts.dart';
import 'package:grocery_mob_app/productdetails.dart';
import 'package:grocery_mob_app/signin.dart';
import 'package:grocery_mob_app/signup.dart';
import 'package:grocery_mob_app/tutorial.dart';

import 'category.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(

        child: Stack(
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.green[700],
                child: Text("G",style: GoogleFonts.itim(fontSize: 130,fontWeight: FontWeight.bold,color: Colors.white)),
              ),
            ),
            Opacity(
              opacity: 0.07,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset('assets/images/vegdoodle.png',fit: BoxFit.fill,),
              ),
            ),
          ],
        ),
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TutorialPage()),
          );
        },
      ),
    );


  }
}
