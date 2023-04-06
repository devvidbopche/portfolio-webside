import 'package:flutter/material.dart';

import 'devid.dart';
import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  String name, devid, classs, department, email, dep, city;

  WelcomePage({
    Key? key,
    required this.name,
    required this.devid,
    required this.classs,
    required this.department,
    required this.email,
    required this.dep,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(72, 24, 128, 1),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Student Details '),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          Theme(
            data: Theme.of(context).copyWith(
                textTheme: TextTheme().apply(bodyColor: Colors.white),
                dividerColor: Colors.black87,
                iconTheme: IconThemeData(color: Colors.black87)),
            child: PopupMenuButton<int>(
              color: Color.fromARGB(255, 243, 242, 242),
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
        backgroundColor: Color.fromARGB(255, 52, 159, 10),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20, //<-- SEE HERE
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Name:',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              fontSize: 30),
                          border: UnderlineInputBorder(),
                          hintText: '$name',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20, //<-- SEE HERE
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Student_id:',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Text(' $name ',style: TextStyle(color: Colors.black, fontSize: 30 ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              fontSize: 30),
                          border: UnderlineInputBorder(),
                          hintText: '$devid',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20, //<-- SEE HERE
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Class:',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Text(' $name ',style: TextStyle(color: Colors.black, fontSize: 30 ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              fontSize: 30),
                          border: UnderlineInputBorder(),
                          hintText: '$classs',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20, //<-- SEE HERE
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Subject:',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Text(' $name ',style: TextStyle(color: Colors.black, fontSize: 30 ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              fontSize: 30),
                          border: UnderlineInputBorder(),
                          hintText: '$department',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20, //<-- SEE HERE
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Roll_num:',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Text(' $name ',style: TextStyle(color: Colors.black, fontSize: 30 ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              fontSize: 30),
                          border: UnderlineInputBorder(),
                          hintText: '$email',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20, //<-- SEE HERE
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Department:',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Text(' $name ',style: TextStyle(color: Colors.black, fontSize: 30 ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(
                        right: 5,
                      ),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              fontSize: 30),
                          border: UnderlineInputBorder(),
                          hintText: '$dep',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20, //<-- SEE HERE
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'City_Name:',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Text(' $name ',style: TextStyle(color: Colors.black, fontSize: 30 ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(
                        right: 5,
                      ),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              fontSize: 30),
                          border: UnderlineInputBorder(),
                          hintText: '$city',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      backgroundColor: Color.fromARGB(255, 26, 168, 80)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormPage()),
                    );
                  },
                  child: Text("<-- Go Back"))
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

/// home page

/// devid in appp  dkkk.dart aap in code