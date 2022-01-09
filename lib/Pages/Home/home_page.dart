import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_fit/Class/color_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni_fit/Pages/Diet/high_calories.dart';
import 'package:uni_fit/Pages/Diet/low_calories.dart';
import 'package:uni_fit/Pages/Diet/muscle_gain.dart';
import 'package:uni_fit/Pages/Diet/normal_diet.dart';
import 'package:uni_fit/Pages/Diet/weight_loss.dart';
import 'package:uni_fit/Pages/Weight/Beginner/Exercise/beginner_abs.dart';
import 'package:uni_fit/Pages/Weight/Beginner/Exercise/beginner_chest.dart';
import 'package:uni_fit/Pages/Weight/Beginner/Exercise/beginner_shoulder.dart';
import 'package:uni_fit/Pages/Weight/Intermediate/Exercise/intermediate_abs.dart';
import 'package:uni_fit/Pages/Weight/Intermediate/Exercise/intermediate_legs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  final user = FirebaseAuth.instance.currentUser;

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
              //-------appbar------
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
                      'UNI FIT',
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

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.125),
                    child: CarouselSlider(
                      items: [
                        erContainer(
                          'Push Ups',
                          '15 X 3',
                          'push ups',
                          'Literally every major\nmuscle in your body\nis called upon\nto execute the\nmovement.',
                          const BeginnerChest(),
                        ),
                        erContainer(
                          'Jumping Jacks',
                          '30 Sec',
                          'jumping jacks',
                          'It increases your\nheart rate,which\npromotes the flow\nof blood and oxygen\nto your brain.',
                          const BeginnerShoulder(),
                        ),
                        erContainer(
                          'Squats',
                          '10 X 3',
                          'squats',
                          'It is help to \nStrengthens core,\nreduces risk of\ninjury, Strengthens\nmuscles of lower\nbody',
                          const IntermediateLegs(),
                        ),
                        erContainer(
                          'Abdominal Crunch',
                          '30 X 2',
                          'abdominals crunch',
                          'Helps people\nsuffering from\nregular constipation\nby inducing\ntriggering the\nbowel movement.',
                          const IntermediateAbs(),
                        ),
                        erContainer(
                          'Plank',
                          '30 sec X 2',
                          'plank',
                          'The plank position\nhelps target core\nmuscles & give \nthem a good burn\nto build muscle\nstrength.',
                          const BeginnerAbs(),
                        ),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        height: MediaQuery.of(context).size.height * 0.29375,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CarouselSlider(
                      items: [
                        dietContainer(
                          'avocado',
                          'Avocado',
                          '738',
                          'Lunch',
                          const HighCalories(),
                        ),
                        dietContainer(
                          'berries',
                          'Berries',
                          '96',
                          'Breakfast',
                          const LowCalories(),
                        ),
                        dietContainer(
                          'pancake',
                          'Pancake',
                          '680',
                          'Breakfast',
                          const MuscleGainDiet(),
                        ),
                        dietContainer(
                          'oats',
                          'Oats',
                          '150',
                          'Breakfast',
                          const NormalDiet(),
                        ),
                        dietContainer(
                          'raspberry',
                          'Raspberry',
                          '352',
                          'Breakfast',
                          const WeightLoss(),
                        ),
                      ],
                      options: CarouselOptions(
                        reverse: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget erContainer(
    String erName,
    String erSet,
    String erImage,
    String erDescription,
    dynamic erRoute,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, right: 7, left: 7),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: erRoute,
              ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.8333,
          decoration: BoxDecoration(
            color: primaryWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: shadowBlack,
                offset: const Offset(0.0, 0.10),
                blurRadius: 10.0,
              ), //BoxShadow
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/gif/$erImage.gif',
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.3333,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            erDescription,
                            style: TextStyle(
                                color: primaryGreen,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                                fontFamily: 'popLight'),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.00625,
                          ),
                          Text(
                            'Set: $erSet',
                            style: TextStyle(
                              color: primaryGreen,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02125,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'popLight',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    erName,
                    style: TextStyle(
                      color: primaryBlack,
                      fontSize: MediaQuery.of(context).size.height * 0.03125,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'popBold',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dietContainer(
    String dietImage,
    String dietName,
    String dietCalories,
    String dietType,
    dynamic dietRoute,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15, right: 7, left: 7),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: dietRoute,
              ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.8333,
          decoration: BoxDecoration(
            color: primaryGreen,
            image: DecorationImage(
              image: AssetImage(
                'assets/images/diet/$dietImage.jpg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              ),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dietName,
                  style: TextStyle(
                    color: primaryWhite,
                    fontSize: MediaQuery.of(context).size.height * 0.04375,
                    fontFamily: 'popBold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Calories : " + dietCalories + "cal",
                      style: TextStyle(
                        color: primaryWhite,
                        fontSize: MediaQuery.of(context).size.height * 0.0188,
                        fontFamily: 'popLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Type : " + dietType,
                      style: TextStyle(
                        color: primaryWhite,
                        fontSize: MediaQuery.of(context).size.height * 0.0188,
                        fontFamily: 'popLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
