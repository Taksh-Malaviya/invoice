import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/controllers/logout_controller.dart';

import '../../routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LogoutController logoutController = Get.put(LogoutController());
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: Color(0xFF292A3A),
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xFF00BFA6),
              child: Text("JD", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 10),
            Text(
              "John Doe",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                logoutController.logout();
              },
              icon: Icon(Icons.logout_outlined, color: Colors.redAccent),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 130.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items:
                  [
                    'https://www.wpfinal.com/wp-content/uploads/2024/02/Advanced-Ads-Ad-Slider.jpg',
                    'https://www.wpfinal.com/wp-content/uploads/2024/02/Advanced-Ads-Ad-Slider.jpg',
                    'https://www.wpfinal.com/wp-content/uploads/2024/02/Advanced-Ads-Ad-Slider.jpg',
                  ].map((imageUrl) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(imageUrl, fit: BoxFit.cover),
                    );
                  }).toList(),
            ),

            SizedBox(height: 20),
            Container(
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
                        "This Month",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "View Reports",
                        style: TextStyle(color: Color(0xFF00BFA6)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFinancialCard("Revenue", "₹50,000"),
                      _buildFinancialCard("Expenses", "₹10,000"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Quick Actions",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.invoice),
                  child: _buildFeatureIcon(Icons.receipt, "Invoice"),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.credit),
                  child: _buildFeatureIcon(Icons.credit_card, "Credit Note"),
                ),
                _buildFeatureIcon(Icons.account_balance, "Debit Note"),
                _buildFeatureIcon(Icons.list, "Orders"),
                _buildFeatureIcon(Icons.payment, "Payments"),
                _buildFeatureIcon(Icons.local_shipping, "Shipping"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xFF00BFA6).withOpacity(0.15),
          child: Icon(icon, size: 30, color: Color(0xFF00BFA6)),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: Color(0xFFB0BEC5), // Light Grey for subtle contrast
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialCard(String title, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Color(0xFFB0BEC5), fontSize: 14)),
        Text(
          amount,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
