import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginPage())));
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: Center(
  //       child: Image.asset( "assets/img/443.png",),
  //     ),
  //   );
  // }


  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amberAccent, //<-- SEE HERE
        backgroundColor: Color.fromRGBO(84, 152, 253, 1.0),
        body:Container(
            alignment: Alignment.center,
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //vertically align center
                children:<Widget>[
                  Container(
                    child:SizedBox(
                        height:400,width:400,
                        child:Image.asset("assets/img/ic_launcher.png")
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:90),
                    //margin top 30
                    child:Text("Education Portal", style: TextStyle(
                      fontSize: 30,
                    ),),
                  ),

                ]
            )
        )
    );
  }
}