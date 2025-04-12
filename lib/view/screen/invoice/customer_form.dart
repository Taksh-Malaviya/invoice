import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import 'add_customer_controller.dart';

class AllCustomers extends StatefulWidget {
  const AllCustomers({super.key});

  @override
  State<AllCustomers> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<AllCustomers> {
  final controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.Add_customers);
              },
              child: const Text("Add Customer"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.customers.isEmpty) {
                  return const Center(
                    child: Text(
                      'No customers added yet.',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.customers.length,
                    itemBuilder: (_, index) {
                      final customer = controller.customers[index];
                      return ListTile(
                        title: Text(
                          customer['name'] ?? '',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          customer['email'] ?? '',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
