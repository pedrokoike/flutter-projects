import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/photo.jpeg'),
              ),
              Text(
                'Pedro Koike',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontFamily: 'SourcePro',
                  fontSize: 20.0,
                  color: Colors.teal.shade100,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                // child: Padding(
                //   padding: EdgeInsets.all(10),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.phone,
                //         color: Colors.teal,
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Text(
                //         '+55 48 996792535',
                //         style: TextStyle(
                //           color: Colors.teal.shade900,
                //           fontFamily: 'SourceSans',
                //           fontSize: 20,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+55 48 996792535',
                    style: TextStyle(
                        fontFamily: 'SourceSans',
                        fontSize: 20,
                        color: Colors.teal.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'pedro.koike@gmail.com',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSans'),
                  ),
                  // child: Row(
                  //   children: [
                  //     Icon(
                  //       Icons.mail,
                  //       color: Colors.teal,
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Text(
                  //       'pedro.koike@gmail.com',
                  //       style: TextStyle(
                  //         color: Colors.teal.shade900,
                  //         fontSize: 20,
                  //         fontFamily: 'SourceSans',
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
