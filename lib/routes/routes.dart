import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/view/auth/register/register.dart';
import 'package:invoice_generator/view/screen/credit.dart';
import 'package:invoice_generator/view/screen/home.dart';

import '../view/auth/login/login.dart';
import '../view/screen/invoice.dart';
import '../view/screen/slplash.dart';

class Routes {
  static const String splashScreen = "/";
  static const String home = "/home";
  static const String invoice = "/invoice";
  static const String credit = "/credit";
  static const String register = "/register";
  static const String login = "/login";

  static List<GetPage> pages = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: invoice, page: () => InvoiceHomePage()),
    GetPage(name: credit, page: () => CreditMemoScreen()),
    GetPage(name: register, page: () => RegisterScreen()),
    GetPage(name: login, page: () => LoginScreen()),
  ];
}
