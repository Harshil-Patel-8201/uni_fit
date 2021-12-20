import 'package:flutter/material.dart';
import 'Pages/Diet/diet_page.dart';
import 'Pages/Diet/high_calories.dart';
import 'Pages/Diet/low_calories.dart';
import 'Pages/Diet/muscle_gain.dart';
import 'Pages/Diet/normal_diet.dart';
import 'Pages/Diet/weight_loss.dart';
import 'Pages/Drawer/drawer_page.dart';
import 'Pages/Home/home_page.dart';
import 'Pages/Progress/progress_page.dart';
import 'Pages/Running/running_page.dart';
import 'Pages/Weight/Advance/advance_abs.dart';
import 'Pages/Weight/Advance/advance_arms.dart';
import 'Pages/Weight/Advance/advance_back.dart';
import 'Pages/Weight/Advance/advance_chest.dart';
import 'Pages/Weight/Advance/advance_exercise.dart';
import 'Pages/Weight/Advance/advance_leg.dart';
import 'Pages/Weight/Advance/advance_shoulder.dart';
import 'Pages/Weight/Beginner/beginner_abs.dart';
import 'Pages/Weight/Beginner/beginner_arms.dart';
import 'Pages/Weight/Beginner/beginner_back.dart';
import 'Pages/Weight/Beginner/beginner_chest.dart';
import 'Pages/Weight/Beginner/beginner_exercise.dart';
import 'Pages/Weight/Beginner/beginner_legs.dart';
import 'Pages/Weight/Beginner/beginner_shoulder.dart';
import 'Pages/Weight/Intermediate/intermediate_abs.dart';
import 'Pages/Weight/Intermediate/intermediate_arms.dart';
import 'Pages/Weight/Intermediate/intermediate_back.dart';
import 'Pages/Weight/Intermediate/intermediate_chest.dart';
import 'Pages/Weight/Intermediate/intermediate_exercise.dart';
import 'Pages/Weight/Intermediate/intermediate_legs.dart';
import 'Pages/Weight/Intermediate/intermediate_shoulder.dart';
import 'Pages/Weight/weight_page.dart';
import 'SignIn-SignUp/Google SignIn/google_page_controller.dart';
import 'SignIn-SignUp/Google SignIn/google_signIn_button.dart';
import 'SignIn-SignUp/get_started_page.dart';
import 'SignIn-SignUp/signIn_login_page.dart';
import 'new.dart';

var routeClass = <String, WidgetBuilder>{
  '/': (context) => const GetStartedPage(),
  '/New': (context) => New(),
  // '/MainScreen': (context) => MainScreen(cameras),
  '/GooglePageController': (context) => const GooglePageController(),
  '/SignInLoginPage': (context) => const SignInLoginPage(),
  '/GoogleSignInButton': (context) => const GoogleSignInButton(),
  '/DrawerPage': (context) => const DrawerPage(),
  '/DietPage': (context) => const DietPage(),
  '/MuscleGainDiet': (context) => const MuscleGainDiet(),
  '/WeightLoss': (context) => const WeightLoss(),
  '/NormalDiet': (context) => const NormalDiet(),
  '/LowCalories': (context) => const LowCalories(),
  '/HighCalories': (context) => const HighCalories(),
  '/HomePage': (context) => const HomePage(),
  '/ProgressPage': (context) => const ProgressPage(),
  '/RunningPage': (context) => const RunningPage(),
  '/WeightPage': (context) => const WeightPage(),
  '/BeginnerExercise': (context) => const BeginnerExercise(),
  '/BeginnerAbs': (context) => const BeginnerAbs(),
  '/BeginnerArms': (context) => const BeginnerArms(),
  '/BeginnerBack': (context) => const BeginnerBack(),
  '/BeginnerChest': (context) => const BeginnerChest(),
  '/BeginnerShoulder': (context) => const BeginnerShoulder(),
  '/BeginnerLegs': (context) => const BeginnerLegs(),
  '/IntermediateExercise': (context) => const IntermediateExercise(),
  '/IntermediateAbs': (context) => const IntermediateAbs(),
  '/IntermediateArms': (context) => const IntermediateArms(),
  '/IntermediateBack': (context) => const IntermediateBack(),
  '/IntermediateChest': (context) => const IntermediateChest(),
  '/IntermediateShoulder': (context) => const IntermediateShoulder(),
  '/IntermediateLegs': (context) => const IntermediateLegs(),
  '/AdvanceExercise': (context) => const AdvanceExercise(),
  '/AdvanceAbs': (context) => const AdvanceAbs(),
  '/AdvanceArms': (context) => const AdvanceArms(),
  '/AdvanceBack': (context) => const AdvanceBack(),
  '/AdvanceChest': (context) => const AdvanceChest(),
  '/AdvanceShoulder': (context) => const AdvanceShoulder(),
  '/AdvanceLegs': (context) => const AdvanceLegs(),
};
