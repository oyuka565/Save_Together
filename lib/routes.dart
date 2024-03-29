import 'package:flutter/widgets.dart';
import 'package:together_app/favorite/fav_screen.dart';
import 'package:together_app/payment.dart';


// import 'screens/sign_up/sign_up_screen.dart';
import 'sign_in/sign_in_screen.dart';
import 'package:together_app/splash/splash_screen.dart';
import 'package:together_app/profile/profile_screen.dart';
import 'package:together_app/otp/otp_screen.dart';
import 'package:together_app/login_success/login_success_screen.dart';
import 'package:together_app/signup_success/signup_success_screen.dart';
import 'package:together_app/home/home_screen.dart';
import 'package:together_app/forgot_password/forgot_password_screen.dart';
import 'package:together_app/details/details_screen.dart';
import 'package:together_app/complete_profile/complete_profile_screen.dart';
import 'package:together_app/cart/cart_screen.dart';
import 'package:together_app/sign_up/sign_up_screen.dart';
// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignUpScreen.routeName: (context) => SignupSuccessScreen(),
  //CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  //OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  FavScreen.routeName: (context) => FavScreen(),
  Payment.routeName: (context) => Payment(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
