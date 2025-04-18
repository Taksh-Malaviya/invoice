import 'package:get/get.dart';
import 'package:invoice_generator/view/auth/register/register.dart';
import 'package:invoice_generator/view/intro/intro_1.dart';
import 'package:invoice_generator/view/intro/intro_2.dart';
import 'package:invoice_generator/view/intro/intro_3.dart';
import 'package:invoice_generator/view/screen/credit.dart';
import 'package:invoice_generator/view/screen/home.dart';
import 'package:invoice_generator/view/screen/invoice/add_customer.dart';
import 'package:invoice_generator/view/screen/invoice/customer_form.dart';
import '../view/auth/login/login.dart';
import '../view/screen/invoice.dart';
import '../view/screen/invoice/invoice.dart';
import '../view/screen/slplash.dart';

class Routes {
  static const String splashScreen = "/";
  static const String register = "/register";
  static const String intro_1 = "/intro_1";
  static const String intro_2 = "/intro_2";
  static const String intro_3 = "/intro_3";
  static const String login = "/login";
  static const String home = "/home";
  static const String invoice = "/invoice";
  static const String Add_customers = "/Add_customers";
  static const String form_customert = "/form_customert";
  static const String credit = "/credit";

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(name: intro_1, page: () => Intro1(), transition: Transition.fadeIn),
    GetPage(name: intro_2, page: () => Intro2(), transition: Transition.fadeIn),
    GetPage(name: intro_3, page: () => Intro3(), transition: Transition.fadeIn),

    GetPage(
      name: register,
      page: () => RegisterScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: invoice,
      page: () => Invoice(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Add_customers,
      page: () => AddCustomer(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: form_customert,
      page: () => AllCustomers(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: credit,
      page: () => CreditMemoPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
