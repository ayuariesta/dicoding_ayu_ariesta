import 'package:flutter/material.dart';
import 'package:quiz1_ayu_ariesta/perhitunganBMI.dart';
import 'package:quiz1_ayu_ariesta/perhitunganBMR.dart';
import 'package:quiz1_ayu_ariesta/perhitunganIdeal.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pinkAccent.shade100,
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Card(
                color: Colors.pink.shade50,
                elevation: 8,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/images/BMI1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    OutlineButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BMICalculator();
                        }));
                      },
                      child: Text(
                        "BMI Calculator",
                        style: TextStyle(
                            fontFamily: 'Caramel Sweets', fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                color: Colors.pink.shade50,
                elevation: 8,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/images/BMIGambar.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    OutlineButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BMRCalculator();
                        }));
                      },
                      child: Text(
                        "BMR Calculator",
                        style: TextStyle(
                            fontFamily: 'Caramel Sweets', fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                color: Colors.pink.shade50,
                elevation: 8,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/images/BMI2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    OutlineButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Ideal();
                        }));
                      },
                      child: Text(
                        "Ideal Calculator",
                        style: TextStyle(
                            fontFamily: 'Caramel Sweets', fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
