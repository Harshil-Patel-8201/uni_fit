import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_fit/Constants/img_design.dart';
import 'Advance/advance_exercise.dart';
import 'Beginner/beginner_exercise.dart';
import 'Intermediate/intermediate_exercise.dart';
import 'package:uni_fit/Constants/color.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key key}) : super(key: key);

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      duration: const Duration(milliseconds: 250),
      child: Scaffold(
        body: bgContainer(
          Stack(
            children: [
              //--------appbar-------
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowBlack,
                            offset: const Offset(0.5, 0.10),
                            blurRadius: 20.0,
                          ), //BoxShadow
                        ],
                        shape: BoxShape.circle,
                        color: primaryGreen,
                      ),
                      height: height * 0.056,
                      width: height * 0.056,
                      child: Center(
                        child: isDrawerOpen
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: primaryWhite,
                                  size: height * 0.038,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    xOffset = 280;
                                    yOffset = 100;
                                    scaleFactor = 0.7;
                                    isDrawerOpen = true;
                                  });
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.listUl,
                                  color: primaryWhite,
                                  size: height * 0.028,
                                ),
                              ),
                      ),
                    ),
                    Text(
                      'WORKOUT',
                      style: TextStyle(
                        color: superDarkGreen,
                        fontSize: height * 0.038,
                        fontFamily: 'popBold',
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowBlack,
                            offset: const Offset(0.5, 0.10),
                            blurRadius: 20.0,
                          ), //BoxShadow
                        ],
                        shape: BoxShape.circle,
                        color: primaryGreen,
                      ),
                      height: height * 0.056,
                      width: height * 0.056,
                      child: user.emailVerified
                          ? ClipOval(
                              child: Image.network(
                                user.photoURL,
                                fit: BoxFit.cover,
                                height: height * 0.15,
                                width: height * 0.15,
                              ),
                            )
                          : ClipOval(
                              child: Image.asset(
                                'assets/images/user.jpg',
                                fit: BoxFit.cover,
                                height: height * 0.15,
                                width: height * 0.15,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.025,
                        ),

                        //----------beginner---------
                        exerciseCategoriesContainer(
                            'beginner',
                            Icons.offline_bolt,
                            Icons.offline_bolt_outlined,
                            Icons.offline_bolt_outlined,
                            '10-13 min',
                            '130-180 cal',
                            const BeginnerExercise()),

                        //---------intermediate---------
                        exerciseCategoriesContainer(
                            'intermediate',
                            Icons.offline_bolt,
                            Icons.offline_bolt,
                            Icons.offline_bolt_outlined,
                            '12-16 min',
                            '210-250 cal',
                            const IntermediateExercise()),

                        //--------advance-------------
                        exerciseCategoriesContainer(
                            'advance',
                            Icons.offline_bolt,
                            Icons.offline_bolt,
                            Icons.offline_bolt,
                            '15-20 min',
                            '330-380 cal',
                            const AdvanceExercise()),

                        SizedBox(
                          height: height * 0.025,
                        ),
                      ],
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

  Widget exerciseCategoriesContainer(
    String erName,
    IconData firstIcon,
    IconData secondIcon,
    IconData thirdIcon,
    String erMinutes,
    String erBurnCalories,
    dynamic routeName,
  ) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop, child: routeName),
          );
        },
        child: Container(
          height: height * 0.2125,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryWhite,
            boxShadow: [
              BoxShadow(
                color: shadowBlack,
                offset: const Offset(0.5, 0.10),
                blurRadius: 20.0,
              ), //BoxShadow
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                erName.toUpperCase(),
                style: TextStyle(
                  fontSize: height * 0.04,
                  fontFamily: 'popBold',
                  color: primaryGreen,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    firstIcon,
                    color: primaryGreen,
                    size: height * 0.05,
                  ),
                  Icon(
                    secondIcon,
                    color: primaryGreen,
                    size: height * 0.05,
                  ),
                  Icon(
                    thirdIcon,
                    color: primaryGreen,
                    size: height * 0.05,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.0125,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.clock,
                    color: Colors.grey.shade400,
                    size: height * 0.015,
                  ),
                  Text(
                    ' ($erMinutes)',
                    style: TextStyle(
                      fontSize: height * 0.015,
                      fontFamily: 'popBold',
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.0277,
                  ),
                  FaIcon(
                    FontAwesomeIcons.fire,
                    color: Colors.grey.shade400,
                    size: height * 0.015,
                  ),
                  Text(
                    ' ($erBurnCalories)',
                    style: TextStyle(
                      fontSize: height * 0.015,
                      fontFamily: 'popBold',
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
