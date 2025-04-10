import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:invoice_generator/controllers/auth.dart';
import 'package:invoice_generator/controllers/hide_pass.dart';
import 'package:invoice_generator/routes/routes.dart';
import '../../../colors/colours.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
var user = Rxn<User>();

void onInit() {
  user.value = _auth.currentUser;
  _auth.authStateChanges().listen((User? newUser) {
    user.value = newUser;
  });
}

Future<void> signInAnonymously() async {
  try {
    if (user.value != null) {
      Get.offNamed('/home');
      return;
    }

    UserCredential userCredential = await _auth.signInAnonymously();
    user.value = userCredential.user;
    Get.offNamed('/home');
  } on FirebaseAuthException catch (e) {
    String errorMessage = "An error occurred: ${e.message}";
    if (e.code == "operation-not-allowed") {
      errorMessage = "Anonymous sign-in is disabled in Firebase.";
    }
    Get.snackbar(
      "Login Error",
      errorMessage,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }
}

final GoogleSignIn googleSignIn = GoogleSignIn();

Future<void> googleSignInUser() async {
  try {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      Get.snackbar(
        "Login Cancelled",
        "Google Sign-In was cancelled.",
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    Get.offNamed('/home');
  } catch (e) {
    Get.snackbar(
      "Login Failed",
      "Failed to sign in with Google. Please try again.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

class RegisterScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  final HidePass pass = Get.put(HidePass());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: black,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 45.h),
              Row(
                children: [
                  Text(
                    "Sign up",
                    style: lato(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.h),
              Row(
                children: [
                  Text(
                    "Create Your Account",
                    style: lato(
                      color: white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: controller.emailController,
                style: lato(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.white70),
                  hintText: "Enter your email",
                  hintStyle: lato(
                    color: Colors.white54,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  labelText: "Email",
                  labelStyle: lato(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.25),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white70, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.white54, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.redAccent, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.redAccent, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email can't be empty";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),

              SizedBox(height: 12),
              Obx(
                () => TextFormField(
                  maxLength: 8,
                  controller: controller.passwordController,
                  obscureText: pass.isPasswordVisible.value,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white70),
                    suffixIcon: IconButton(
                      icon: Icon(
                        pass.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                      onPressed: pass.togglePasswordVisibility,
                    ),
                    hintText: "Enter your password",
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 12),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.25),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.white70, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.white54, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.redAccent, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.redAccent, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              SizedBox(height: 17.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: white),
                    onPressed: () {
                      controller.register();
                    },
                    child: Text(
                      "Continue",
                      style: lato(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 50,
                      width: 260,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          googleSignInUser();
                        },
                        icon: Image.network(
                          'https://tse1.mm.bing.net/th?id=OIP.t4Z5Wlv7qFqdBCKwFdKkYAHaHa&pid=Api&P=0&h=180',
                          height: 28,
                        ),
                        label: Text(
                          "Sign in with Google",
                          style: lato(
                            fontSize: 15.sp,
                            color: black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 50,
                      width: 260,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          signInAnonymously();
                        },
                        icon: Image.network(
                          'https://tse2.mm.bing.net/th?id=OIP.5oh4OARW4iNwMSe4BzpPZQHaHa&pid=Api&P=0&h=180',
                          height: 28,
                        ),
                        label: Text(
                          "Sign in as A Guest",
                          style: lato(
                            fontSize: 15.sp,
                            color: black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-100, 55),
                    child: Image.asset(
                      "assets/photos/pavlovvisuals-removebg-preview.png",
                      height: 150,
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
}
