import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dkk.dart';
import 'login_page.dart';
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _devid = TextEditingController();
  TextEditingController _classs = TextEditingController();
  TextEditingController _subject = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _dep = TextEditingController();
   dynamic dropdownvalued ;

  String? defaultValue;
  String? secondDropDown;
  late String email,name;
  ///String secondDropDown;

  List dropDownListData = [
    {"title": "java ", "value": "java"},
    {"title": "php", "value": "php"},
    {"title": "flutter", "value": "flutter"},
    {"title": "react natvie ", "value": "react natvie"},
  ];

  List dropDownListDataa = [
    {"title": "BCA", "value": "BCA"},
    {"title": "MCA", "value": "MCA"},
    {"title": "B.Tech", "value": "B.Tech"},
    {"title": "M.Tech", "value": "M.Tech"},
  ];

  List categoryItemlist = [ ];

  Future getAllCategory() async {
    var baseUrl = "https://mocki.io/v1/325cf6ff-8890-43bc-a744-647db0a4be94";

    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemlist = jsonData;
      });
    }
  }
  @override
  void initState() {
    getAllCategory();
    // TODO: implement initState
    super.initState();
  }


  final _formKey = GlobalKey<FormState>();

  /// TextEditingController _name = TextEditingController();

  bool showPassword = false;
  bool isLoading = false;

  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromRGBO(72, 24, 128, 1),
      appBar: AppBar(

        leading: Icon(Icons.menu),
        title: Text('Form page '),
        actions: [
          /// Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),

            /// child: Icon(Icons.search),s
          ),
         // Icon(Icons.more_vert),

          Theme(
            data: Theme.of(context).copyWith(
                textTheme: TextTheme().apply(bodyColor: Colors.black87),
                dividerColor: Colors.black87,
                iconTheme: IconThemeData(color: Colors.black87)),
            child: PopupMenuButton<int>(
              color: Colors.white,
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text("Setting")),
                PopupMenuItem<int>(
                    value: 1, child: Text("Privacy Policy page")),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text("Logout")
                      ],
                    )),
              ],
              onSelected: (item) => SelectedItem(context, item),
            ),
          ),


        ],
        backgroundColor:  Color.fromARGB(255, 52, 159, 10),
      ),

      body: Form(

        key: _formKey,
        child: SingleChildScrollView(
         /// key: formKey,
          child: Column(



            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.0),
              Center(


                child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left:15, bottom: 20, right: 70,),
                    child: const Text(
                      'Student Form',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                         // fontWeight: FontWeight.w500,
                          fontSize: 35),
                    )),
              ),
              SizedBox(height: 40.0),

              Padding(
                padding: EdgeInsets.only(
                  right: 320,
                ), //apply padding to some sides only
                child: Text(
                  ' Student Name',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                     fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),


                child: TextFormField(

                  controller: _name,
                  decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),

                    ),



                    // enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
                    //     borderRadius: BorderRadius.circular(50.0),
                    // ),

                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white, //<-- SEE HERE
                    border: OutlineInputBorder(),

                    hintStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                    labelStyle: TextStyle(fontSize: 21, color: Colors.black),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name text';
                      }
                      return null;
                    }
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  right: 349,
                ), //apply padding to some sides only
                child: Text(
                  'Student_Id',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _devid,
                  decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white, //<-- SEE HERE
                    border: OutlineInputBorder(),


                    hintStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                    labelStyle: TextStyle(fontSize: 21, color: Colors.black),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Student id ';
                      }
                      return null;
                    }
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  right: 395,
                ), //apply padding to some sides only
                child: Text(
                  'Class',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _classs,
                  decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                      ),


                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white, //<-- SEE HERE
                    border: OutlineInputBorder(),
                    labelText: '',

                    ///prefixIcon: Icon(Icons.people),
                    hintStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                    labelStyle: TextStyle(fontSize: 21, color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter text filed  class ';
                      }
                      return null;
                    }

                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  right: 379,
                ), //apply padding to some sides only
                child: Text(
                  'Subject',
                  style: TextStyle(
                     fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InputDecorator(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white, //<-- SEE HERE
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        isDense: true,
                        value: defaultValue,
                        isExpanded: true,
                        menuMaxHeight: 350,
                        items: [
                          const DropdownMenuItem(
                              child: Text(
                                "Myaql",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              value: ""),
                          ...dropDownListData
                              .map<DropdownMenuItem<String>>((data) {
                            return DropdownMenuItem(
                                child: Text(data['title']),
                                value: data['value']);
                          }).toList(),
                        ],
                        onChanged: (value) {
                          print("selected Value $value");
                          setState(() {
                            defaultValue = value!;
                          });
                        }),
                  ),
                ),
              ),

              ///  ------- subject end ----
              Padding(
                padding: EdgeInsets.only(
                  right: 329,
                ), //apply padding to some sides only
                child: Text(
                  'Roll_nomber',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white, //<-- SEE HERE
                    border: OutlineInputBorder(),

                    //prefix iocn

                    labelText: '',


                    hintStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                    labelStyle: TextStyle(fontSize: 21, color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your roll number ';
                      }
                      return null;
                    }
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  right: 339,
                ), //apply padding to some sides only
                child: Text(
                  'Department',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InputDecorator(
                  decoration: InputDecoration(

                     enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white, //<-- SEE HERE
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        isDense: true,
                        value: secondDropDown,
                        isExpanded: true,
                        menuMaxHeight: 350,
                        items: [
                          const DropdownMenuItem(
                              child: Text(
                                "polytechnic",
                                style: TextStyle(
                                    fontSize: 18, ),
                              ),
                              value: ""),
                          ...dropDownListDataa
                              .map<DropdownMenuItem<String>>((data) {
                            return DropdownMenuItem(
                                child: Text(data['title']),
                                value: data['value']);
                          }).toList(),
                        ],
                        onChanged: (value) {
                          print("selected Value $value");
                          setState(() {
                            secondDropDown = value!;
                          });
                        }),
                  ),

                ),
              ),


              Padding(


                padding: EdgeInsets.only(
                  right: 395,
                ), //apply padding to some sides only
                child: Text(
                  'City',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),





              SizedBox(height: 10.0),


              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 465,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.white
                      ),
                      child: DropdownButton(
                        hint: Text(' ',style: TextStyle(fontSize: 16,color: Colors.black),),
                        items: categoryItemlist.map((item) {
                          return DropdownMenuItem(
                            value: item['name'].toString(),
                            child: Text(item['name'].toString()),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                           dropdownvalued  = newVal ;
                          });
                        },
                        value: dropdownvalued,
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 30.0),

              Center(
                child: Container(
                    height: 50,
                    padding: EdgeInsets.only(left:15, bottom: 0, right: 20,),
                    child: ElevatedButton(


                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(440, 80), backgroundColor: Color.fromARGB(
                          255, 64, 204, 255)),

                      child: const Text('Submit'),


                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          Future.delayed(const Duration(seconds: 0), () {
                            isLoading = false;
                            setState(() {});
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Center(
                                      child: SizedBox(
                                        child: WelcomePage(
                                          name: _name.text,
                                          devid: _devid.text,
                                          classs: _classs.text,
                                          city: dropdownvalued,
                                          department: defaultValue ?? "",
                                          email: _email.text,
                                          dep: secondDropDown ?? "",
                                        ),
                                      ),
                                    )));
                          });
                        }
                      },


                    )
                ),
              ),

              SizedBox(height: 30.0),
              SizedBox(height: 30.0),

            ],
          ),
        ),
      ),
    );

  }
  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FormPage()));
        break;
      case 1:
        print("Privacy Clicked");
        break;
      case 2:
        print("User Logged out");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false);
        break;
    }
  }
}



