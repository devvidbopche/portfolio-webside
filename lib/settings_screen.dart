import 'dart:convert';

import 'package:flutter/material.dart';
import 'appscreen/devid.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(146, 194, 221, 1),
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text(' Student_login  '),
          actions: [
            /// Icon(Icons.favorite),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),

              /// child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Color.fromARGB(255, 209, 142, 209),
        ),


        body: const MyStatefulWidget(),


      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;


  void loginaa(String username, password) async {
    try {
      Response response = await post(
          Uri.parse('https://dummyjson.com/auth/login'),
          body: {'username': username, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');

        isLoading = true;
        setState(() {});

        Future.delayed(const Duration(seconds: 2), () {
          isLoading = false;
          setState(() {});

          Navigator.pop(context);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormPage()),
          );
        });

      } else {
        print("invliad paassword and username ");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left:15, bottom: 0, right: 20,top:20),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left:15, bottom: 20, right: 20,),
                child: const Text(
                  'Student_login',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 50),
                )),
            Container(

                alignment: Alignment.center,
              /// padding: const EdgeInsets.all(70),
                padding: EdgeInsets.only(left:15, bottom: 50, right: 30,),
                child: Image.asset('assets/img/443.png',
                  height: 200,
                  width: 200,

                  colorBlendMode: BlendMode.darken,
                  fit: BoxFit.fitWidth,)
            ),
            Container(

              padding: EdgeInsets.only(left:15, bottom: 40, right: 20, top:0),

              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.white,

                  labelText: 'User Name',
                  prefixIcon: Icon(Icons.email ),
                    contentPadding: const EdgeInsets.all(14),

                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration:  InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.white, //<-- SEE HERE
                  labelText: 'Password',

                  prefixIcon: Icon(Icons.security   ),

                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },


                  child: const Text('Forgot Password ?', style: TextStyle(


              )
              ),
            ),

            Container(
                height: 50,
               /// padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
         padding: EdgeInsets.only(left:15, bottom: 0, right: 20,),
                child: ElevatedButton(
                  child: const Text('Login'),


                  onPressed: ()
                  {
                    loginaa(_emailController.text.toString(),
                        _passwordController.text.toString());
                  },
                )
            ),




            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(50),
                child: const Text(
                  'or',
                  style: TextStyle(

                      fontWeight: FontWeight.w500,
                      fontSize: 40),
                )),



            Container(
              /// padding: const EdgeInsets.all(10),
              padding: EdgeInsets.only(left:15, bottom: 40, right: 20, top:10),

              child: TextField(
                ///controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),

                  labelText: 'Login with phone number',

                  prefixIcon: Icon(Icons.phone ),
                  labelStyle: TextStyle(fontSize: 21, color: Colors.black,textBaseline:TextBaseline.alphabetic),
                ),

              ),
            ),


          ],
        ));
  }


  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
     return OutlineInputBorder( //Outline border type for TextFeild
          borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color:Colors.redAccent,
              width: 3,)
        );
      }

 
}