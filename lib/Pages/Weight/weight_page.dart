import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_fit/Pages/Weight/Live%20Monitoring/live_monitoring.dart';
import 'package:uni_fit/main.dart';
import 'Advance/advance_exercise.dart';
import 'Beginner/beginner_exercise.dart';
import 'Intermediate/intermediate_exercise.dart';
import 'package:uni_fit/color_class.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({Key key}) : super(key: key);

  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  final user = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      duration: const Duration(milliseconds: 250),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover)),
          child: Stack(
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
                      height: MediaQuery.of(context).size.height * 0.056,
                      width: MediaQuery.of(context).size.height * 0.056,
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
                                  size: MediaQuery.of(context).size.height *
                                      0.038,
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
                                  size: MediaQuery.of(context).size.height *
                                      0.028,
                                ),
                              ),
                      ),
                    ),
                    Text(
                      'WEIGHT',
                      style: TextStyle(
                        color: superDarkGreen,
                        fontSize: MediaQuery.of(context).size.height * 0.038,
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
                      height: MediaQuery.of(context).size.height * 0.056,
                      width: MediaQuery.of(context).size.height * 0.056,
                      child: user.emailVerified
                          ? ClipOval(
                              child: Image.network(
                                user.photoURL,
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width:
                                MediaQuery.of(context).size.height * 0.15,
                              ),
                            )
                          : ClipOval(
                              child: Image.asset(
                                'assets/images/user.jpg',
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width:
                                MediaQuery.of(context).size.height * 0.15,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 90),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //----------live monitoring-----
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: () {
                            // want to add navigation here-----------------
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: LiveMonitoring(cameras)),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.162,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'LIVE',
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.height * 0.04,
                                        fontFamily: 'popBold',
                                        color: primaryGreen,
                                      ),
                                    ),
                                    Text(
                                      'WARM UP',
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.height * 0.04,
                                        fontFamily: 'popBold',
                                        color: primaryGreen,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.height * 0.025,
                                ),
                                Icon(
                                  Icons.camera_alt,
                                  color: primaryGreen,
                                  size: MediaQuery.of(context).size.height * 0.0625,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      //----------beginner---------
                      InkWell(
                        child: exerciseCategoriesContainer(
                            'beginner',
                            Icons.offline_bolt,
                            Icons.offline_bolt_outlined,
                            Icons.offline_bolt_outlined,
                            const BeginnerExercise()),
                      ),

                      //---------intermediate---------
                      InkWell(
                        child: exerciseCategoriesContainer(
                            'intermediate',
                            Icons.offline_bolt,
                            Icons.offline_bolt,
                            Icons.offline_bolt_outlined,
                            const IntermediateExercise()),
                      ),

                      //--------advance-------------
                      exerciseCategoriesContainer(
                          'advance',
                          Icons.offline_bolt,
                          Icons.offline_bolt,
                          Icons.offline_bolt,
                          const AdvanceExercise()),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget exerciseCategoriesContainer(String erName, IconData firstIcon,
      IconData secondIcon, IconData thirdIcon, dynamic routeName) {
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
          height: MediaQuery.of(context).size.height * 0.162,
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
                  fontSize: MediaQuery.of(context).size.height * 0.04,
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
                    size: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Icon(
                    secondIcon,
                    color: primaryGreen,
                    size: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Icon(
                    thirdIcon,
                    color: primaryGreen,
                    size: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
