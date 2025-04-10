import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../colors/colours.dart';
import '../../../controllers/guest_log in.dart';
import '../../../controllers/log in.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  final GuestLoginController guestController = Get.put(GuestLoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 23.h),
              Center(
                child: Text(
                  "Welcome To Invoice ",
                  style: lato(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.sp,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Login or Sign up to your  ",
                  style: lato(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "account",
                  style: lato(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*Container(
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
                          style: lato(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: blue,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email, color: blue),
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
                            prefixIcon: Icon(Icons.lock, color: blue),
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
                              style: lato(
                                color: blue,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
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
                                        backgroundColor: blue,
                                      ),
                                      child: Text(
                                        "Login",
                                        style: lato(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ),
                        ),
                        SizedBox(height: 10.h),
                        Divider(thickness: 1),
                        SizedBox(height: 10.h),
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
                              style: lato(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: white,
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
                              style: lato(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: white,
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
                            style: lato(
                              color: blue,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
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
      ),*/
