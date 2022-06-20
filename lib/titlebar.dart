import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_mob_app/mainpage.dart';
import 'package:grocery_mob_app/signup.dart';


class TitleBar extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final bool skip;
  final bool back;
  final bool welcomemsg;
  final bool profileimg;
  final bool searchbar;
  final bool istitle;
  final String title;
  const TitleBar({ key,required this.screenHeight,
    required this.screenWidth,
    this.back:false,
    this.skip:false,
    this.welcomemsg:false,
    this.profileimg:false,
    this.searchbar:false,
    this.istitle:false,
    this.title:""}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //var screenHeight=MediaQuery.of(context).size.height;
    //var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      //color: Colors.red,
      child: OrientationBuilder(
        builder: (context,orientation){
          return    Container(
            padding: EdgeInsets.all(10),
            constraints: BoxConstraints(
              minHeight:screenHeight*0.17,
              maxHeight: screenHeight*0.5,
            ),
            //height: screenHeight*0.17,//orientation==Orientation.portrait?screenHeight*0.20:screenHeight*0.25,
            width: screenWidth,
            color: Colors.green[700],
            child: ListView(
              children:
              (istitle?[
                Stack(
                  children: [
                    Center(child: Text("$title",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        icon:Icon(Icons.arrow_back_outlined,color: Colors.white,size:27,),
                          onPressed: (){
                            Navigator.pop(context);
                         },
                        ),
                    ),
                  ],
              ),
                ]:
                [
                Row(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:
                    [
                    if(back)
                      IconButton(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        icon:Icon(Icons.arrow_back_outlined,),
                        color: Colors.white,
                        iconSize:27,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    if(skip)
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
                        child: InkWell(
                          child: Text("Skip",style: TextStyle(color: Colors.white,fontSize:17,fontWeight: FontWeight.w500),),
                          onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                            );
                            },
                        ),
                      ),
                    if(welcomemsg)
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: Text("Hey\nLets search your grocery food.",style: TextStyle(color: Colors.white,fontSize: 15),),
                      ),
                    if(profileimg)
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profileimg.png'),
                            )
                        ),
                      ),

                  ],
                ),
                if(searchbar)
                  Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search,color: Colors.grey[400],),
                      hintText: "Search your daily grocery ",
                      hintStyle: TextStyle(color: Colors.grey[400],fontSize: 15),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

              ]),
            )

            //child: ClipPath(
            //clipper: Clipper(),
            //),
          );
        }

      ),
    );
  }
}
