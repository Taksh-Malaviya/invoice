import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/colors/colours.dart';

import '../../../routes/routes.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        title: Text(
          "Create Invoice",
          style: lato(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf, color: white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildInvoiceInfo(),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.form_customert);
              },
              child: _buildSection("Customer", "Select Customer"),
            ),
            _buildSection("Products", "Add Products"),
            _buildCustomFields(),
            _buildOptionalFields(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildInvoiceInfo() {
    DateTime date = DateTime.now();
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Invoice #", style: TextStyle(color: Colors.grey)),
            const Text(
              "INV-1",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              "${date.toString().split(' ')[0]}",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String buttonText) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: TextButton(
          onPressed: () {},
          child: Text(
            "+ $buttonText",
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomFields() {
    return Card(
      color: Colors.blueGrey[800],
      child: ListTile(
        title: const Text(
          "Add Custom Fields",
          style: TextStyle(color: Colors.white),
        ),
        subtitle: const Text(
          "Personalize to perfectly suit your style.",
          style: TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(Icons.headset_mic, color: Colors.white),
      ),
    );
  }

  Widget _buildOptionalFields() {
    return Card(
      color: Colors.grey[900],
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.location_on, color: Colors.white),
            title: const Text(
              "Select Dispatch Address",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
            ),
            title: const Text(" Cash", style: TextStyle(color: Colors.white)),
            trailing: TextButton(
              onPressed: () {},
              child: const Text("Change", style: TextStyle(color: Colors.blue)),
            ),
          ),
          _buildOptionalItem(Icons.edit, "Select Signature"),
          _buildOptionalItem(Icons.bookmark, "Add Reference"),
          _buildOptionalItem(Icons.note, "Add Notes"),
          _buildOptionalItem(Icons.description, "Add Terms"),
        ],
      ),
    );
  }

  Widget _buildOptionalItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total Amount", style: TextStyle(color: Colors.white)),
            Row(
              children: [
                const Text("₹0.00", style: TextStyle(color: Colors.white)),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: white),
                  child: const Text("Create"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
