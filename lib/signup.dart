import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_mob_app/signin.dart';
import 'package:grocery_mob_app/titlebar.dart';

import 'mainpage.dart';

class SignUp extends StatefulWidget {
  //const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: OrientationBuilder(
        builder: (context,orientation){
          return Stack(
            children: [
              TitleBar(screenHeight: screenHeight,screenWidth: screenWidth,back: true,),
              Container(
                margin: orientation==Orientation.portrait?EdgeInsets.fromLTRB(0, screenHeight*0.13, 0, 0):EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top:Radius.circular(25)),
                  child: Container(
                    color: Colors.grey[200],
                    //height: screenHeight,
                    //width: screenWidth,
                    //padding: EdgeInsets.fromLTRB(15,15,15,0),
                    child:SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                              constraints: BoxConstraints(
                                minHeight: screenHeight*0.70,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Form(
                                key: formKey,
                                child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                          child: Text("Sign Up",textAlign: TextAlign.center,style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,color: Colors.grey[700]),)
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                          child: Text("Sign up with your email and password to continue",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[700],),)
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                                          child: Text("Name",style: TextStyle(color: Colors.grey[600]),)
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          filled: true,
                                          fillColor: Colors.grey[100],
                                          hintText: "Enter Full Name",
                                          hintStyle: TextStyle(color: Colors.grey[300],fontSize: 15),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          ),
                                        validator: (value){
                                          if(value!.isEmpty||value==null){
                                            return "Enter Full Name";
                                          }
                                          return null;
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                          child: Text("Email address",style: TextStyle(color: Colors.grey[600]),)
                                      ),
                                      TextFormField(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(10),
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            hintText: "Enter email address",
                                            hintStyle: TextStyle(color: Colors.grey[300],fontSize: 15),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                        validator: (value){
                                          if(value!.isEmpty||value==null){
                                            return "Enter email address";
                                          }
                                          return null;
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                          child: Text("Password",style: TextStyle(color: Colors.grey[600]),)
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(10),
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            hintText: "Enter Password",
                                            hintStyle: TextStyle(color: Colors.grey[300],fontSize: 15),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                        validator: (value){
                                          if(value!.isEmpty||value==null){       //value.isEmpty
                                            return "Enter password";
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(30,10,30,10),
                            //width: screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(top:Radius.circular(20)),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                MaterialButton(
                                  minWidth: screenWidth*0.8,
                                  //height: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.green[700],
                                  child: Text("Sign up",style: TextStyle(fontSize: 16,color: Colors.white),),
                                  onPressed: () {
                                    if (formKey.currentState!.validate() ) {
                                      print("Entered");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MainPage()),
                                      );
                                    }
                                  },
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: [
                                      TextSpan(
                                        text:"Already have an account ?  ",
                                        style: TextStyle(color: Colors.grey[400]),
                                      ),

                                      TextSpan(
                                        text:"Sign in",
                                        style: TextStyle(color: Colors.green[700],fontWeight: FontWeight.w600),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap=(){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SignIn()),
                                            );
                                          }
                                      ),
                                    ],
                                  )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
