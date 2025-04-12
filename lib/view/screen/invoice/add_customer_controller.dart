import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();
  final gstController = TextEditingController();
  final addressController1 = TextEditingController();
  final addressController2 = TextEditingController();
  final pinecodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final discountController = TextEditingController();
  final creditLimitController = TextEditingController();
  final panController = TextEditingController();
  final ccemailController = TextEditingController();
  final shippingadd1 = TextEditingController();
  final shippingadd2 = TextEditingController();
  final shippingcity = TextEditingController();
  final shippingstate = TextEditingController();
  final shippingcountry = TextEditingController();
  final shippingpincode = TextEditingController();
  final notesController = TextEditingController();
  final addTageController = TextEditingController();

  final customers = <Map<String, String>>[].obs;

  var selectedPriceList = ''.obs;

  List<String> priceListOptions = ['Standard', 'Premium', 'Wholesale'];
  var isAddressEmpty = true.obs;

  void addCustomer() {
    if (formKey.currentState!.validate()) {
      customers.add({
        'name': nameController.text,
        'number': numberController.text,
        'email': emailController.text,
        'company': companyController.text,
        'gst': gstController.text,
        'address1': addressController1.text,
        'address2': addressController2.text,
        'pincode': pinecodeController.text,
        'city': cityController.text,
        'state': stateController.text,
        'country': countryController.text,
        'discount': discountController.text,
        'creditLimit': creditLimitController.text,
        'priceList': selectedPriceList.value,
        'pan': panController.text,
        'ccemail': ccemailController.text,
        'shippingadd1': shippingadd1.text,
        'shippingadd2': shippingadd2.text,
        'shippingcity': shippingcity.text,
        'shippingstate': shippingstate.text,
        'shippingcountry': shippingcountry.text,
        'shippingpincode': shippingpincode.text,
        'notes': notesController.text,
        'addTage': addTageController.text,
      });
      clearFields();
      Get.back(); // Go back after adding
    }
  }

  void setSelectedPriceList(String value) {
    selectedPriceList.value = value;
    update();
  }

  void clearFields() {
    nameController.clear();
    numberController.clear();
    emailController.clear();
    companyController.clear();
    gstController.clear();
    addressController1.clear();
    addressController2.clear();
    pinecodeController.clear();
    stateController.clear();
    cityController.clear();
    countryController.clear();
    discountController.clear();
    creditLimitController.clear();
    panController.clear();
    ccemailController.clear();
    shippingadd1.clear();
    shippingadd2.clear();
    shippingcity.clear();
    shippingstate.clear();
    shippingcountry.clear();
    shippingpincode.clear();
    notesController.clear();
    addTageController.clear();

    isAddressEmpty.value = true;
  }

  void updateAddressEntered() {
    isAddressEmpty.value = false;
  }

  @override
  void onClose() {
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    companyController.dispose();
    gstController.dispose();
    addressController1.dispose();
    addressController2.dispose();
    cityController.dispose();
    pinecodeController.dispose();
    stateController.dispose();
    countryController.dispose();
    discountController.dispose();
    creditLimitController.dispose();
    panController.dispose();
    ccemailController.dispose();
    shippingadd1.dispose();
    shippingadd2.dispose();
    shippingcity.dispose();
    shippingstate.dispose();
    shippingcountry.dispose();
    shippingpincode.dispose();
    notesController.dispose();
    addTageController.dispose();
    super.onClose();
  }
}
