import 'package:flutter/material.dart';
import 'package:uni_fit/Pages/Weight/Advance/advance_abs.dart';
import 'package:uni_fit/Pages/Weight/Advance/advance_arms.dart';
import 'package:uni_fit/Pages/Weight/Advance/advance_back.dart';
import 'package:uni_fit/Pages/Weight/Advance/advance_chest.dart';
import 'package:uni_fit/Pages/Weight/Advance/advance_leg.dart';
import 'package:uni_fit/Pages/Weight/Advance/advance_shoulder.dart';
import 'package:uni_fit/color_class.dart';

class AdvanceExercise extends StatefulWidget {
  const AdvanceExercise({Key key}) : super(key: key);

  @override
  _AdvanceExerciseState createState() => _AdvanceExerciseState();
}

class _AdvanceExerciseState extends State<AdvanceExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            //-------appbar--------
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: superDarkGreen,
                        size: 30,
                      ),
                    ),
                  ),
                  Text(
                    'ADVANCE',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: 30,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                    width: 45,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 90),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        '" Your Bod can stand almost anything\n its your mind that you have to convince. "',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'popLight',
                          color: darkGreen,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //-------abs----------
                    exerciseContainer(
                      'Abs',
                      'keep in mind that abdominal exercises alone are unlikely to decrease belly fat',
                      'assets/images/advance/absA.jpg',
                      1,
                      const AdvanceAbs(),
                    ),

                    //-------shoulder--------
                    exerciseContainer(
                      'Shoulder',
                      'Shoulder strength training can reduce your risk of injury by strengthening your core muscles',
                      'assets/images/advance/shoulderA.jpg',
                      2,
                      const AdvanceShoulder(),
                    ),

                    //---------chest--------
                    exerciseContainer(
                      'Chest',
                      'Working out the chest means working out the pectoral muscles, better known as the “pecs.”',
                      'assets/images/advance/chestA.jpg',
                      3,
                      const AdvanceChest(),
                    ),

                    //-----------arms-------
                    exerciseContainer(
                      'Arms',
                      'Strong biceps play an important role in an overall strong and functional upper body',
                      'assets/images/advance/armsA.jpg',
                      4,
                      const AdvanceArms(),
                    ),

                    //---------legs--------
                    exerciseContainer(
                      'Legs',
                      'legs is one of our biggest muscles, regularly training legs helps us reduce the risk of injury.',
                      'assets/images/advance/legsA.jpg',
                      5,
                      const AdvanceLegs(),
                    ),

                    //-----------back-------
                    exerciseContainer(
                      'Back',
                      'strengthening your back muscles, you are building up the main support structure for your entire body.',
                      'assets/images/advance/backA.jpg',
                      6,
                      const AdvanceBack(),
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget exerciseContainer(
    String erName,
    String erDescription,
    String erImage,
    int listImage,
    dynamic routeName,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
      child: InkWell(
        onTap: () {
          // want to add navigation here-----------------
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 700),
              pageBuilder: (_, __, ___) => routeName,
            ),
          );
        },
        child: Container(
          //color: Colors.blue,
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowBlack,
                offset: const Offset(0, 0),
                blurRadius: 20.0,
              ), //BoxShadow
            ],
            color: primaryWhite,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                width: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        erName,
                        style: TextStyle(
                          fontSize: 30,
                          color: primaryGreen,
                          fontFamily: 'popBold',
                        ),
                      ),
                      Text(
                        erDescription,
                        style: TextStyle(
                          fontSize: 10,
                          color: primaryGreen,
                          fontFamily: 'popLight',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: 'advance-image-$listImage',
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(erImage),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
