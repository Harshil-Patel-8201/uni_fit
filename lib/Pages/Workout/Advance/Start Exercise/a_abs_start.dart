// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_fit/Constants/color.dart';
import 'dart:math' as math;
import 'package:uni_fit/Pages/Workout/Advance/advance_exercise.dart';

class AdvanceAbsStart extends StatefulWidget {
  const AdvanceAbsStart({Key key}) : super(key: key);

  @override
  _AdvanceAbsStartState createState() => _AdvanceAbsStartState();
}

class _AdvanceAbsStartState extends State<AdvanceAbsStart> {
  final user = FirebaseAuth.instance.currentUser;

  static const maxSecond = 0;
  int second = maxSecond;
  Timer timer;
  int erSecond = erMaxSecond;
  static const erMaxSecond = 30;
  int brSecond = 30;

  void resetTimer() => setState(() {
        second = maxSecond;
        // stopTimer();
      });

  void startTime({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (second >= 0) {
        setState(() => second++);
      } else if (second > 600) {
        stopTimer(reset: false);
      }
    });
  }

  void exerciseSecond() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (erSecond > 0) {
        setState(() => erSecond--);
      } else if (erSecond == 0) {
        setState(() => erSecond = 29);
      }
    });
  }

  void breakSecond() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (brSecond > 0) {
        setState(() => brSecond--);
      } else if (brSecond == 0) {
        setState(() => brSecond = 29);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  ConfettiController _celebrationAnimation;

  @override
  void initState() {
    super.initState();
    _celebrationAnimation =
        ConfettiController(duration: const Duration(seconds: 100));
  }

  @override
  void dispose() {
    _celebrationAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // color: backgroundColor,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF50FF98),
              Color(0xff25A359),
              // Color(0xff25824B),
            ],
          ),
        ),

        child: Stack(
          children: [
            //-------appbar--------
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Abs Exercise',
                    style: TextStyle(
                      color: primaryWhite,
                      fontSize:  height * 0.0375,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            if (second < 1) ...[
              readyContainer(),
              realButton(),
            ] else if (1 <= second && second <= 30) ...[
              breakTime('jumping jacks'),
              realButton(),
            ] else if (31 <= second && second <= 60) ...[
              erContainer('jumping jacks', '30 sec'),
              realButton(),
            ] else if (61 <= second && second <= 90) ...[
              breakTime('abdominals crunch'),
              realButton(),
            ] else if (91 <= second && second <= 120) ...[
              erContainer('abdominals crunch', 'sets : X25'),
              realButton(),
            ] else if (121 <= second && second <= 150) ...[
              breakTime('russin twist'),
              realButton(),
            ] else if (151 <= second && second <= 180) ...[
              erContainer('russin twist', 'sets: X25'),
              realButton(),
            ] else if (181 <= second && second <= 210) ...[
              breakTime('mountain climber'),
              realButton(),
            ] else if (211 <= second && second <= 240) ...[
              erContainer('mountain climber', 'sets: X25'),
              realButton(),
            ] else if (241 <= second && second <= 270) ...[
              breakTime('leg raises'),
              realButton(),
            ] else if (271 <= second && second <= 300) ...[
              erContainer('leg raises', "sets: X25"),
              realButton(),
            ] else if (301 <= second && second <= 330) ...[
              breakTime('plank'),
              realButton(),
            ] else if (331 <= second && second <= 360) ...[
              erContainer('plank', '30 sec'),
              realButton(),
            ] else if (361 <= second && second <= 390) ...[
              breakTime('heel touch'),
              realButton(),
            ] else if (391 <= second && second <= 420) ...[
              erContainer('heel touch', 'sets: X25'),
              realButton(),
            ] else if (421 <= second && second <= 450) ...[
              breakTime('cobra stretch'),
              realButton(),
            ] else if (451 <= second && second <= 480) ...[
              erContainer('cobra stretch', '30 sec'),
              realButton(),
            ] else if (481 <= second && second <= 510) ...[
              breakTime('side lying floor stretch left'),
              realButton(),
            ] else if (511 <= second && second <= 540) ...[
              erContainer('side lying floor stretch left', '30 sec'),
              realButton(),
            ] else if (541 <= second && second <= 570) ...[
              breakTime('side lying floor stretch right'),
              realButton(),
            ] else if (571 <= second && second <= 600) ...[
              erContainer('side lying floor stretch right', '30 sec'),
              realButton(),
            ] else
              endWorkout(),
          ],
        ),
      ),
    );
  }

  Widget readyContainer() {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: const AssetImage('assets/images/advance/absA.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: primaryWhite,
                    size:  height * 0.0438,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Are you ready for today's Abs workout?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryWhite,
                fontSize:  height * 0.04,
                fontFamily: 'popMedium',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'press "start" for exercise',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize:  height * 0.0187,
                  fontFamily: 'popMedium',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget breakTime(String erName) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 120),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Next Exercise',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: superDarkGreen,
                fontSize:  height * 0.0375,
                fontFamily: 'popMedium',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height:  height * 0.025,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: shadowBlack,
                        offset: const Offset(0, 0),
                        blurRadius: 20.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: FadeInImage(
                      width:  width * 0.833,
                      height:  height * 0.375,
                      image: AssetImage(
                        'assets/images/gif/$erName.gif',
                      ),
                      placeholder: const AssetImage(
                        'assets/images/loading.gif',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height:  height * 0.025,
                ),
                Text(
                  erName.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'popBold'),
                ),
                SizedBox(
                  height:  height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start in ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:  height * 0.0275,
                        color: primaryWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.access_alarm,
                      color: primaryWhite,
                    ),
                    Text(
                      ' : $brSecond sec',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:  height * 0.0275,
                        color: primaryWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget endWorkout() {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _celebrationAnimation,
                blastDirection: pi / 2,
                // radial value - LEFT
                particleDrag: 0.05,
                // apply drag to the confetti
                emissionFrequency: 0.05,
                // how often it should emit
                numberOfParticles: 20,
                // number of particles to emit
                gravity: 0.09,
                // gravity - or fall speed
                shouldLoop: false,
                colors: const [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.pink,
                  Colors.blue,
                  Colors.indigo,
                  Colors.deepPurpleAccent,
                ], // manually specify the colors to be used
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Well Done!\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: 35,
                      fontFamily: 'popBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "You completed\ntoday's workout.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 20,
                      fontFamily: 'popBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\nYou burn : 158 cal.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryBlack,
                      fontSize: 20,
                      fontFamily: 'popBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            user.emailVerified
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection('UserData')
                              .doc(user.email)
                              .update({'absCal': FieldValue.increment(158)});
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdvanceExercise(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Container(
                            height:  height * 0.0625,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: shadowBlack,
                                  offset: const Offset(0, 0),
                                  blurRadius: 20.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'DONE'.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'popBold',
                                  fontSize:  height *
                                      0.0287,
                                  letterSpacing: 2,
                                  color: primaryGreen,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection('UserData')
                              .doc(user.uid)
                              .update({'absCal': FieldValue.increment(158)});
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdvanceExercise(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Container(
                            height:  height * 0.0625,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: shadowBlack,
                                  offset: const Offset(0, 0),
                                  blurRadius: 20.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'DONE'.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'popBold',
                                  fontSize:  height *
                                      0.0287,
                                  letterSpacing: 2,
                                  color: primaryGreen,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget erContainer(String erName, String erSet) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 120),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Exercise',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: superDarkGreen,
                fontSize:  height * 0.0375,
                fontFamily: 'popMedium',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height:  height * 0.025,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowBlack,
                    offset: const Offset(0, 0),
                    blurRadius: 20.0,
                  ), //BoxShadow
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: FadeInImage(
                  width:  width * 0.833,
                  height:  height * 0.375,
                  image: AssetImage(
                    'assets/images/gif/$erName.gif',
                  ),
                  placeholder: const AssetImage(
                    'assets/images/loading.gif',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height:  height * 0.0125,
            ),
            Text(
              erName.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: superDarkGreen,
                fontSize:  height * 0.0313,
                fontFamily: 'popBold',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height:  height * 0.00625,
            ),
            Text(
              erSet,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryWhite,
                fontSize:  height * 0.0225,
                fontFamily: 'popBold',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height:  height * 0.00625,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  '$erSecond',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:  height * 0.0375,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height:  height * 0.11875,
                    width:  height * 0.11875,
                    child: CircularProgressIndicator(
                      value: 1 - erSecond / erMaxSecond,
                      valueColor: AlwaysStoppedAnimation(semiWhite),
                      backgroundColor: primaryGreen,
                      strokeWidth: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget realButton() {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final isRunning = timer == null ? false : timer.isActive;

    return isRunning
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //---------Pause----------
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       stopTimer(reset: false);
              //     });
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //       boxShadow: [
              //         BoxShadow(
              //           color: shadowBlack,
              //           offset: const Offset(0.5, 0.10),
              //           blurRadius: 20.0,
              //         ), //BoxShadow
              //       ],
              //       shape: BoxShape.circle,
              //       color: Colors.white,
              //     ),
              //     height: 50,
              //     width: 50,
              //     child: const Center(
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 5),
              //         child: FaIcon(
              //           FontAwesomeIcons.play,
              //           color: Colors.blue,
              //           size: 25,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   width: 50,
              // ),

              //----------cancel-------
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowBlack,
                            offset: const Offset(0.5, 0.10),
                            blurRadius: 20.0,
                          ), //BoxShadow
                        ],
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                      ),
                      height:  height * 0.0625,
                      width:  height * 0.139,
                      child: Center(
                        child: Transform.rotate(
                          angle: -math.pi / 4,
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size:  height * 0.0313,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        //----------- start -------------
        : Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  startTime();
                  exerciseSecond();
                  breakSecond();
                  _celebrationAnimation.play();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    height:  height * 0.0625,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: shadowBlack,
                          offset: const Offset(0, 0),
                          blurRadius: 20.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Start'.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'popBold',
                          fontSize:  height * 0.0287,
                          letterSpacing: 2,
                          color: primaryGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text(
        "No",
        style: TextStyle(
          color: Colors.blue,
          fontFamily: 'popBold',
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "Yes",
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'popBold',
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AdvanceExercise()));
        stopTimer();
      },
    );

    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      title: const Text(
        "Want to cancel?",
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'popBold',
        ),
      ),
      content: const Text(
        "Are you sure ?\nit effect to your progress.",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'popMedium',
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
