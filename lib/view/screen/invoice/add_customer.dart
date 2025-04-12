import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:share_plus/share_plus.dart';
import '../../../colors/colours.dart';
import 'add_customer_controller.dart';

class AddCustomer extends StatefulWidget {
  AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final controller = Get.put(CustomerController());

  bool isChange = false;
  bool isChange2 = false;
  String? selectedPriceList;
  bool isTdsApplicable = false;
  bool isTcsApplicable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        title: Text(
          "Add Customer",
          style: lato(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        iconTheme: IconThemeData(color: white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Basic Details",
                style: lato(
                  color: white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 18.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: grey900,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    TextFormField(
                      controller: controller.nameController,
                      style: lato(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      decoration: inputDecoration("Name *"),
                      validator:
                          (value) => value!.isEmpty ? 'Enter name' : null,
                    ),
                    SizedBox(height: 12),
                    IntlPhoneField(
                      style: lato(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      decoration: inputDecoration("Phone Number"),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        controller.numberController.text = phone.completeNumber;
                      },
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: controller.emailController,
                      style: lato(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      decoration: inputDecoration("Email"),
                      validator:
                          (value) => value!.isEmpty ? 'Enter email' : null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Company Details (Optional)",
                style: lato(
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: grey900,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    TextFormField(
                      controller: controller.gstController,
                      style: lato(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      decoration: inputDecoration("GST Number"),
                    ),

                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blue,
                          ),
                          onPressed: () {
                            // fetchGSTDetails(controller.gstController.text);
                          },
                          child: Text(
                            "Fetch Detail",
                            style: lato(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: controller.companyController,
                      style: lato(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      decoration: inputDecoration("Company Name"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    "Billing Address (Optional)",
                    style: lato(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8.h),
              Visibility(
                visible:
                    controller.addressController1.text.isEmpty ||
                    controller.pinecodeController.text.isEmpty,
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: grey900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: grey900,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Title Row
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Enter Address",
                                              style: lato(
                                                color: white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp,
                                              ),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                color: white,
                                                size: 16.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(color: grey, thickness: 1),

                                      // All Address Fields
                                      TextInputFields(
                                        "Address Line 1",
                                        controller.addressController1,
                                      ),
                                      TextInputFields(
                                        "Address Line 2",
                                        controller.addressController2,
                                      ),
                                      TextInputFields(
                                        "Pincode",
                                        controller.pinecodeController,
                                        isNumber: true,
                                      ),
                                      TextInputFields(
                                        "City",
                                        controller.cityController,
                                      ),
                                      TextInputFields(
                                        "State",
                                        controller.stateController,
                                      ),
                                      TextInputFields(
                                        "Country",
                                        controller.countryController,
                                      ),

                                      const SizedBox(height: 20),

                                      // Submit Button
                                      Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: blue,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 24,
                                              vertical: 12,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            "Add Billing Address",
                                            style: lato(
                                              color: white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle,
                            color: white,
                            size: 16.sp,
                          ),
                        ),
                        Text(
                          "Billing Address",
                          style: lato(
                            color: white70,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible:
                    controller.addressController1.text.isNotEmpty &&
                    controller.pinecodeController.text.isNotEmpty,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: grey900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Billing Address",
                            style: lato(
                              color: white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          TextButton.icon(
                            onPressed: () {
                              final address =
                                  "${controller.addressController1.text}, "
                                  "${controller.addressController2.text}, "
                                  "${controller.cityController.text}, "
                                  "${controller.stateController.text} - "
                                  "${controller.pinecodeController.text}, "
                                  "${controller.countryController.text}";
                              Share.share("Billing Address:\n$address");
                            },
                            icon: Icon(
                              Icons.share,
                              color: white70,
                              size: 18.sp,
                            ),
                            label: Text(
                              "Share",
                              style: lato(
                                color: white70,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${controller.addressController1.text}, "
                        "${controller.addressController2.text}, "
                        "${controller.cityController.text}, "
                        "${controller.stateController.text} - "
                        "${controller.pinecodeController.text}, "
                        "${controller.countryController.text}",
                        style: lato(
                          color: white70,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                controller.clearFields();
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                              size: 18.sp,
                            ),
                            label: Text(
                              "Delete",
                              style: lato(
                                color: Colors.redAccent,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    "Shipping Address (Optional)",
                    style: lato(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: grey900,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Visibility(
                      visible:
                          controller.shippingadd1.text.isEmpty ||
                          controller.shippingpincode.text.isEmpty,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(
                                            context,
                                          ).viewInsets.bottom,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: grey900,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 24,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Title Row
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 16,
                                                  left: 10,
                                                  right: 10,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Enter Shipping Address",
                                                      style: lato(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18.sp,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    IconButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      icon: Icon(
                                                        Icons.close,
                                                        color: white,
                                                        size: 16.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                color: grey,
                                                thickness: 1,
                                              ),

                                              // All Address Fields
                                              TextInputFields(
                                                "Address Line 1",
                                                controller.shippingadd1,
                                              ),
                                              TextInputFields(
                                                "Address Line 2",
                                                controller.shippingadd2,
                                              ),
                                              TextInputFields(
                                                "Pincode",
                                                controller.shippingpincode,
                                                isNumber: true,
                                              ),
                                              TextInputFields(
                                                "City",
                                                controller.shippingcity,
                                              ),
                                              TextInputFields(
                                                "State",
                                                controller.shippingstate,
                                              ),
                                              TextInputFields(
                                                "Country",
                                                controller.shippingstate,
                                              ),

                                              const SizedBox(height: 20),

                                              // Submit Button
                                              Center(
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: blue,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 24,
                                                          vertical: 12,
                                                        ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    "Add Shipping Address",
                                                    style: lato(
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: white,
                              size: 16.sp,
                            ),
                          ),
                          Text(
                            "Shipping Address",
                            style: lato(
                              color: white70,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible:
                          controller.shippingadd1.text.isNotEmpty &&
                          controller.shippingpincode.text.isNotEmpty,
                      child: Container(
                        height: 170.h,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: grey900,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Shipping Address",
                                  style: lato(
                                    color: white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                TextButton.icon(
                                  onPressed: () {
                                    final address =
                                        "${controller.shippingadd1.text}, "
                                        "${controller.shippingadd2.text}, "
                                        "${controller.shippingcity.text}, "
                                        "${controller.shippingpincode.text} - "
                                        "${controller.shippingcountry.text}, "
                                        "${controller.shippingstate.text}";
                                    Share.share("Shipping Address:\n$address");
                                  },
                                  icon: Icon(
                                    Icons.share,
                                    color: white70,
                                    size: 18.sp,
                                  ),
                                  label: Text(
                                    "Share",
                                    style: lato(
                                      color: white70,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${controller.shippingadd1.text}, "
                              "${controller.shippingadd2.text}, "
                              "${controller.shippingcity.text}, "
                              "${controller.stateController.text} - "
                              "${controller.shippingpincode.text}, "
                              "${controller.shippingcountry.text}",
                              style: lato(
                                color: white70,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      controller.shippingcountry.clear();
                                      controller.shippingadd1.clear();
                                      controller.shippingadd2.clear();
                                      controller.shippingcity.clear();
                                      controller.shippingstate.clear();
                                      controller.shippingpincode.clear();
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                    size: 18.sp,
                                  ),
                                  label: Text(
                                    "Delete",
                                    style: lato(
                                      color: Colors.redAccent,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    'Customer Preferences (Optional)',
                    style: lato(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacer(),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      activeColor: blue,
                      value: isChange,
                      onChanged: (value) {
                        setState(() {
                          isChange = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Visibility(
                visible: isChange,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextInputFields("Discount", controller.discountController),
                    const SizedBox(height: 12),
                    TextInputFields(
                      "Credit Limit",
                      controller.creditLimitController,
                    ),
                    const SizedBox(height: 12),

                    Obx(
                      () => DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Select Price List',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                        dropdownColor: grey900,
                        style: TextStyle(color: Colors.white),
                        value:
                            controller.selectedPriceList.value.isEmpty
                                ? null
                                : controller.selectedPriceList.value,
                        items:
                            controller.priceListOptions.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.selectedPriceList.value = newValue;
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 12),
                    SwitchListTile(
                      title: Text(
                        'TDS applicable?',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: isTdsApplicable,
                      onChanged: (bool value) {
                        setState(() {
                          isTdsApplicable = value;
                        });
                      },
                      activeColor: Colors.blueAccent,
                    ),
                    SwitchListTile(
                      title: Text(
                        'TCS applicable?',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: isTcsApplicable,
                      onChanged: (bool value) {
                        setState(() {
                          isTcsApplicable = value;
                        });
                      },
                      activeColor: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Other Details (Optional)',
                    style: lato(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacer(),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      activeColor: blue,
                      value: isChange2,
                      onChanged: (value) {
                        setState(() {
                          isChange2 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: isChange2,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 430.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: grey900,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_circle_outlined,
                                  color: white,
                                  size: 16.sp,
                                ),
                              ),
                              Text(
                                "Opening Balance",
                                style: lato(
                                  color: white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ),
                                    ),
                                    builder:
                                        (context) => Container(
                                          height: 230.h,
                                          decoration: BoxDecoration(
                                            color: grey900,
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(12),
                                            ),
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Spacer(),
                                                Text(
                                                  "Add Notes",
                                                  style: lato(
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                                Spacer(),
                                                TextInputFields(
                                                  "Enter Your Notes",
                                                  controller.notesController,
                                                ),
                                                SizedBox(height: 10.h),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                        backgroundColor: blue,
                                                      ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    "Save",
                                                    style: lato(
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  );
                                },
                                icon: Icon(
                                  Icons.add_circle_outlined,
                                  color: white,
                                  size: 16.sp,
                                ),
                              ),

                              Text(
                                "Notes",
                                style: lato(
                                  color: white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          TextInputFields("Pan", controller.panController),
                          Row(
                            children: [
                              Text(
                                "      ex.CTYPS1234R",
                                style: lato(
                                  color: white70,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 18.h),
                          Row(
                            children: [
                              Text(
                                "CC e-mail",
                                style: lato(
                                  color: white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "e-mail to be added as CC in all the email sent to this \n customer ",
                                style: lato(
                                  color: white70,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10.h),
                          TextInputFields(
                            "CC e-mail",
                            controller.ccemailController,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ),
                                    ),
                                    builder:
                                        (context) => Container(
                                          height: 230.h,
                                          decoration: BoxDecoration(
                                            color: grey900,
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(12),
                                            ),
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Spacer(),
                                                Text(
                                                  "Add Tag",
                                                  style: lato(
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                                Spacer(),
                                                TextInputFields(
                                                  "Enter Your Tag",
                                                  controller.addTageController,
                                                ),
                                                SizedBox(height: 10.h),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                        backgroundColor: blue,
                                                      ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    "Save",
                                                    style: lato(
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  );
                                },
                                icon: Icon(
                                  Icons.add_circle_outlined,
                                  color: white,
                                  size: 16.sp,
                                ),
                              ),
                              Text(
                                "Add tag",
                                style: lato(
                                  color: white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 8,
        ),
        child: ElevatedButton(
          onPressed: controller.addCustomer,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            "Add Customer",
            style: lato(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: lato(
        color: white70,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: white24),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget TextInputFields(
    String label,
    TextEditingController controller, {
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: white),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: white),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: TextStyle(color: white),
      ),
    );
  }
}
