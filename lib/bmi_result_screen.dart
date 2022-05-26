import 'package:bmi/bmi_screen.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {

  final int result;
  final bool isMale ;
  final int age;
  BmiResult({
    required this.age,
    required this.isMale,
    required this.result,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMI Result'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:50 ,vertical: 80),
            child: Container(
              width: MediaQuery.of(context).size.width * .93,
              height: MediaQuery.of(context).size.height * .53,

              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Gender : ${isMale ? 'Male' : 'Female'}',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Result : $result',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Age : $age',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                ],
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0,), color: Colors.grey[400], ),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            color: Colors.deepOrange,
            child: MaterialButton(
              onPressed: ()
              {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Bmi_Screen()),(route) => false,);
              },
              height: 50.0,
              child: Text('RE CACULATE',
                style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0),
              ),
            ),
          )
        ],
      ),

    );
  }
}
