import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/controllers/log%20in.dart';
import '../../colors/colours.dart';
import '../../routes/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var login = Get.put(LoginController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          bool exit = await _showExitDialog();
          if (exit) {
            Get.back();
          }
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFF1E1E2C),
        appBar: AppBar(
          backgroundColor: Color(0xFF292A3A),
          title: Row(
            children: [
              CircleAvatar(radius: 15.w, backgroundColor: Color(0xFF00BFA6)),
              SizedBox(width: 10.w),
              Text(
                "Your Business",
                style: lato(
                  color: white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  login.logoutUser();
                  Get.offNamed(Routes.login);
                },
                icon: Icon(Icons.logout),
                color: white,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 130.0.h, autoPlay: true),
                items: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        "Slide 1",
                        style: lato(
                          color: white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        "Slide 2",
                        style: lato(
                          color: white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              _buildSalesCard(),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Text(
                    "   Create",
                    style: lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: white,
                    ),
                  ),
                  Icon(Icons.play_arrow_sharp, color: white),
                ],
              ),
              SizedBox(height: 15.h),
              Container(
                height: 200.h,
                width: double.infinity,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF292A3A),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.invoice);
                          },
                          child: CircleAvatar(
                            radius: 27.w,
                            child: Icon(Icons.receipt),
                          ),
                        ),
                        Text(
                          "Invoice",
                          style: lato(
                            color: white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 15.sp),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 15.sp),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Text(
                    "   Quick Access",
                    style: lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Container(
                height: 300.h,
                width: double.infinity,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF292A3A),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CircleAvatar(radius: 27.w, child: Icon(Icons.people)),
                        Text(
                          "Parties",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF292A3A),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Make your Invoice ",
                          style: lato(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Upgrade your payment methods with us ",
                      style: lato(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              CarouselSlider(
                options: CarouselOptions(height: 130.0.h, autoPlay: true),
                items: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        "Slide 1",
                        style: lato(
                          color: white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        "Slide 2",
                        style: lato(
                          color: white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF292A3A),
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Bills"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Products",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "Parties"),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: "More",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesCard() {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFF292A3A),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "This Year",
                style: lato(
                  color: white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "View Bills",
                style: lato(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildFinancialCard("Sales", "₹0.00"),
              _buildFinancialCard("Purchases", "₹0.00"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialCard(String title, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: lato(
            color: Colors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          amount,
          style: lato(color: white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Future<bool> _showExitDialog() async {
    bool exit = false;
    await Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.redAccent,
                size: 50,
              ),
              SizedBox(height: 15),
              Text(
                "Exit App",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Are you sure you want to exit?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      exit = false;
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {
                      exit = true;
                      Get.back();
                    },
                    child: Text(
                      "Exit",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
    return exit;
  }
}
