import 'dart:math';

import 'package:bmi/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class Bmi_Screen extends StatefulWidget {
  const Bmi_Screen({Key? key}) : super(key: key);

  @override
  _Bmi_ScreenState createState() => _Bmi_ScreenState();
}

class _Bmi_ScreenState extends State<Bmi_Screen> {
  bool isMale = true;
  double height =120;
  int weight = 40;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMI Calculator'),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;

                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('assets/images/male.png'),
                              width: 90.0,
                              height: 90.0,
                            ),
                            SizedBox(height: 15.0,),
                            Text('MALE',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                        color: isMale ? Colors.deepOrange : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false ;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image(image: AssetImage('assets/images/female.png'),
                           width: 90.0,
                             height: 90.0,
                           ),
                            SizedBox(height: 15.0,),
                            Text('FEMALE',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0,),
                        color:isMale ? Colors.grey[400] : Colors.deepOrange ,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                      ),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${height.round()}',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900
                          ),),
                        SizedBox(width: 5.0,),
                        Text('CM',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                          ),),
                      ],
                    ),
                    Slider(
                      activeColor: Colors.deepOrange,
                        inactiveColor: Colors.black,
                        value: height ,
                        max: 220.0,
                        min: 80.0,
                        onChanged: (value){
                        setState(() {
                          height = value;
                              });
                        })
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0,), color: Colors.grey[400], ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),),
                          Text('$weight',
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },

                                heroTag: 'weight-',
                                mini: true,
                                backgroundColor: Colors.deepOrange,
                              child: Icon(Icons.remove,),
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                                heroTag: 'weight+',

                                mini: true,
                                backgroundColor: Colors.deepOrange,

                                child: Icon(Icons.add,),
                              ),
                            ],
                          )

                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Colors.grey[400],
                      ),

                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),),
                          Text('$age',
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                                heroTag: 'age-',

                                mini: true,
                                backgroundColor: Colors.deepOrange,

                                child: Icon(Icons.remove,),
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                                heroTag: 'age+',

                                mini: true,
                                backgroundColor: Colors.deepOrange,

                                child: Icon(Icons.add,),
                              ),
                            ],
                          )

                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Colors.grey[400],
                      ),

                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            width: double.infinity,
            color: Colors.deepOrange,
            child: MaterialButton(
              onPressed: ()
              {
                double result = weight/ pow(height /100, 2);

                Navigator.push(context, MaterialPageRoute(builder: (context) => BmiResult(
                  age: age,
                  isMale: isMale,
                  result: result.round(),
                )));
              },
              height: 50.0,
            child: Text('CACULATE',
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
