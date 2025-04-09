import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/routes/routes.dart';

import '../../../controllers/guest_log in.dart';
import '../../../controllers/log in.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  final GuestLoginController guestController = Get.put(GuestLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Invoice Generator",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blueAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blueAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: controller.forgotPassword,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () =>
                              controller.isLoading.value
                                  ? CircularProgressIndicator()
                                  : SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: controller.login,
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        backgroundColor: Colors.blueAccent,
                                      ),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: controller.googleSignInUser,
                            icon: Image.network(
                              'https://tse1.mm.bing.net/th?id=OIP.t4Z5Wlv7qFqdBCKwFdKkYAHaHa&pid=Api&P=0&h=180',
                              height: 18,
                            ),
                            label: Text(
                              "Sign in with Google",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              guestController.signInAnonymously();
                              log("called");
                              Get.offNamed(Routes.home);
                            },
                            icon: Image.network(
                              'https://tse4.mm.bing.net/th?id=OIP.hGSCbXlcOjL_9mmzerqAbQHaHa&pid=Api&P=0&h=180',
                              height: 18,
                            ),
                            label: Text(
                              "Log in as Guest",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed:
                              () =>
                                  Navigator.pushNamed(context, Routes.register),
                          child: Text(
                            "Don't have an account? Sign up",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
