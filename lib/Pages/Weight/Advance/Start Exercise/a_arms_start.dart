import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_fit/Class/color_class.dart';
import 'dart:math' as math;
import 'package:uni_fit/Pages/Weight/Advance/advance_exercise.dart';

class AdvanceArmsStart extends StatefulWidget {
  const AdvanceArmsStart({Key key}) : super(key: key);

  @override
  _AdvanceArmsStartState createState() => _AdvanceArmsStartState();
}

class _AdvanceArmsStartState extends State<AdvanceArmsStart> {
  final user = FirebaseAuth.instance.currentUser;

  static const maxSecond = 0;
  int second = maxSecond;
  Timer timer;
  int erSecond = erMaxSecond;
  static const erMaxSecond = 30;
  int brSecond = 30;

  void resetTimer() => setState(() {
        second = maxSecond;
      });

  void startTime({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (second >= 0) {
        setState(() => second++);
      } else if (second > 510) {
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
                    'Arms Exercise',
                    style: TextStyle(
                      color: primaryWhite,
                      fontSize: MediaQuery.of(context).size.height * 0.0375,
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
              breakTime('push ups'),
              realButton(),
            ] else if (91 <= second && second <= 120) ...[
              erContainer('push ups', 'sets: X25'),
              realButton(),
            ] else if (121 <= second && second <= 150) ...[
              breakTime('arm raise'),
              realButton(),
            ] else if (151 <= second && second <= 180) ...[
              erContainer('arm raise', 'sets: X25'),
              realButton(),
            ] else if (181 <= second && second <= 210) ...[
              breakTime('triceps dips'),
              realButton(),
            ] else if (211 <= second && second <= 270) ...[
              erContainer('triceps dips', 'sets: X25'),
              realButton(),
            ] else if (271 <= second && second <= 300) ...[
              breakTime('arm circles clockwise'),
              realButton(),
            ] else if (301 <= second && second <= 330) ...[
              erContainer('arm circles clockwise', 'set: X25'),
              realButton(),
            ] else if (331 <= second && second <= 360) ...[
              breakTime('arm circles anticlockwise'),
              realButton(),
            ] else if (361 <= second && second <= 390) ...[
              erContainer('arm circles anticlockwise', 'set: X25'),
              realButton(),
            ] else if (391 <= second && second <= 420) ...[
              breakTime('diamond push ups'),
              realButton(),
            ] else if (421 <= second && second <= 450) ...[
              erContainer('diamond push ups', 'set: X20'),
              realButton(),
            ] else if (451 <= second && second <= 480) ...[
              breakTime('chest press pluse'),
              realButton(),
            ] else if (481 <= second && second <= 510) ...[
              erContainer('chest press pluse', '30 sec'),
              realButton(),
            ] else
              endWorkout(),
          ],
        ),
      ),
    );
  }

  Widget readyContainer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: const AssetImage('assets/images/advance/armsA.jpg'),
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
                    size: MediaQuery.of(context).size.height * 0.0438,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Are you ready for today's Arms workout?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryWhite,
                fontSize: MediaQuery.of(context).size.height * 0.04,
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
                  fontSize: MediaQuery.of(context).size.height * 0.0187,
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
                fontSize: MediaQuery.of(context).size.height * 0.0375,
                fontFamily: 'popMedium',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
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
                      width: MediaQuery.of(context).size.width * 0.833,
                      height: MediaQuery.of(context).size.height * 0.375,
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
                  height: MediaQuery.of(context).size.height * 0.025,
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
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Start in ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.0275,
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
                        fontSize: MediaQuery.of(context).size.height * 0.0275,
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
              child: Text(
                "Congratulation !!\n\nYou completed\ntoday's workout",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: superDarkGreen,
                  fontSize: MediaQuery.of(context).size.height * 0.033,
                  fontFamily: 'popBold',
                  fontWeight: FontWeight.bold,
                ),
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
                              .update({'armsCal': FieldValue.increment(151)});
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
                            height: MediaQuery.of(context).size.height * 0.0625,
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
                                  fontSize: MediaQuery.of(context).size.height *
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
                              .update({'armsCal': FieldValue.increment(151)});
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
                            height: MediaQuery.of(context).size.height * 0.0625,
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
                                  fontSize: MediaQuery.of(context).size.height *
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
                fontSize: MediaQuery.of(context).size.height * 0.0375,
                fontFamily: 'popMedium',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
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
                  width: MediaQuery.of(context).size.width * 0.833,
                  height: MediaQuery.of(context).size.height * 0.375,
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
              height: MediaQuery.of(context).size.height * 0.0125,
            ),
            Text(
              erName.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: superDarkGreen,
                fontSize: MediaQuery.of(context).size.height * 0.0313,
                fontFamily: 'popBold',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.00625,
            ),
            Text(
              erSet,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryWhite,
                fontSize: MediaQuery.of(context).size.height * 0.0225,
                fontFamily: 'popBold',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.00625,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  '$erSecond',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.0375,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.11875,
                    width: MediaQuery.of(context).size.height * 0.11875,
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
                      height: MediaQuery.of(context).size.height * 0.0625,
                      width: MediaQuery.of(context).size.height * 0.139,
                      child: Center(
                        child: Transform.rotate(
                          angle: -math.pi / 4,
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.height * 0.0313,
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
                    height: MediaQuery.of(context).size.height * 0.0625,
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
                          fontSize: MediaQuery.of(context).size.height * 0.0287,
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
