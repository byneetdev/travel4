import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel4/users.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Instructor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: EdgeInsets.only(left: 18, right: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                "Bali, Indonesia",
                style: GoogleFonts.arvo(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Best Instructor in Bali, Indonesia!",
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.black54,
                  labelText: "Search Instructor...",
                  labelStyle: GoogleFonts.arvo(
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 28),
              GridView.builder(
                itemCount: usersList.length,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0 / 1.7,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final data = usersList[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 7,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              image: DecorationImage(
                                image: AssetImage(data.urlimage),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        data.name,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 15,
                          ),
                          SizedBox(height: 5),
                          Text(data.rating,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
