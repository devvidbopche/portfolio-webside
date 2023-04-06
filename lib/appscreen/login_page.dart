// /*
// import 'package:test12/appscreen/appscreen/splashScreen.dart';
// import 'package:flutter/services.dart';
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
// import 'appscreen/appscreen/splashScreen.dart';
// import 'appscreen/devid.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//
//
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'devid.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool isLoading = false;
  bool _isHidden = true;
  // // Email Validation
  // final emailPattern =
  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  // bool validateEmail(String email) {
  //   final regExp = RegExp(emailPattern);
  //   return regExp.hasMatch(email);
  // }

/*
  void loginaa() async {

    try{

      Response response = await post(
          Uri.parse('https://dummyjson.com/auth/login'),
          body: {
            'email' : 'kminchelle',
            'password' : '0lelplR'
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['token']);
        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  FormPage()),
        );

      }else {
        print(' ...failed');
      }
    }catch(e){
      print(e.toString());
    }
  }




  loginaa(String string) async {
    var dataBody = {"username": _emailController.text, "password": _passwordController.text};
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };


    final response = await http.post(Uri.parse('https://dummyjson.com/auth/login'),
        body: jsonEncode(dataBody),
        headers : headers);

    if (response.statusCode == 200) {
      Navigator.pop(context);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  FormPage()),
      );
    }
  }
*/
  // Sign In Function

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


    return Scaffold(
      backgroundColor: Color.fromRGBO(84, 152, 253, 1.0),
      appBar: AppBar(

        leading: Icon(Icons.menu),
        title: Text(' '),
        actions: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),


          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor:  Color.fromARGB(255, 94, 224, 56),
      ),
      body: SingleChildScrollView(


        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Login Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans',
                    fontSize: 40,
                    ///backgroundColor: Color(0xffF02E65)
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Image.asset(
                "assets/img/2468.png",
                height: 250,
              ),


              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 50),

                    TextFormField(
                      controller: _emailController,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Please Enter Your email';
                      //
                      //   }
                      //   // if (!validateEmail(_emailController.text)) {
                      //   //   return 'Please Enter Valid Email';
                      //   // }
                      //   return null;
                      // },
                      style: const TextStyle(color: Colors.black),

                      decoration: InputDecoration(
                          filled: true,
                          hintText: 'Enter your email',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36.0),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white,
                          focusColor: Colors.white),
                    ),


                    const SizedBox(height:
                    25),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isHidden,

                      style: const TextStyle(color: Colors.black),

                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Enter your password',

                        hintStyle: const TextStyle(color: Colors.black),

                        prefixIcon: const Icon(
                          Icons.security,
                          color: Colors.grey,
                        ),


                        suffix: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            _isHidden
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        // suffixIcon: InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       showPassword = !showPassword;
                        //     });
                        //   },
                        //   child: Icon(
                        //     showPassword
                        //
                        //         ? Icons.visibility_off
                        //         : Icons.remove_red_eye,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36.0),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        focusColor: Colors.white,



                      ),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: ()
                      {
                        loginaa(_emailController.text.toString(),
                            _passwordController.text.toString());
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(13, 179, 79, 1),
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: Center(
                          child: isLoading
                              ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                              : const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              //backgroundColor: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),


                    // ontainer(
                    //     alignment: Alignment.center,
                    //     padding: const EdgeInsets.all(50),
                    //     child: const Text(
                    //       'or',
                    //       style: TextStyle(
                    //
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 40),
                    //     )),

                    const SizedBox(height:  25),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'OR',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 20),
                      ),
                    ),


                    const SizedBox(height:  35),

                    TextFormField(

                      style: const TextStyle(color: Colors.black),

                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Login with phone number',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),


                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36.0),
                            borderSide: BorderSide.none,
                          ),
                          focusColor: Colors.white
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  jsonEncode(Map<String, String> dataBody) {}

  FlatButton({required Text child, required Null Function() onPressed}) {}
}
// void loginaa(BuildContext context ){
//     var popup= AlertDialog(
//       title: Text( 'login',),
//         content: Text('enjoy your app'),
//     );
//     showDialog(context: context,
//         builder: (BuildContext)=>popup);
// }
//

