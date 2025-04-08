import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart' as pw;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceHomePage extends StatefulWidget {
  const InvoiceHomePage({super.key});

  @override
  State<InvoiceHomePage> createState() => _InvoiceHomePageState();
}

class _InvoiceHomePageState extends State<InvoiceHomePage> {
  final TextEditingController _invoiceNumberController =
      TextEditingController();
  final TextEditingController _invoiceDateController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _paymentTypeController = TextEditingController();
  final TextEditingController _accountDetailsController =
      TextEditingController();

  final TextEditingController _sellerNameController = TextEditingController();
  final TextEditingController _sellerAddressController =
      TextEditingController();
  final TextEditingController _sellerContactController =
      TextEditingController();
  final TextEditingController _sellerTaxNumberController =
      TextEditingController();

  final TextEditingController _buyerNameController = TextEditingController();
  final TextEditingController _buyerAddressController = TextEditingController();
  final TextEditingController _buyerContactController = TextEditingController();

  List<Map<String, String>> items = [];
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemQuantityController = TextEditingController();
  final TextEditingController _itemPriceController = TextEditingController();

  void _addItem() {
    if (_itemNameController.text.isNotEmpty &&
        _itemQuantityController.text.isNotEmpty &&
        _itemPriceController.text.isNotEmpty) {
      setState(() {
        items.add({
          "name": _itemNameController.text,
          "quantity": _itemQuantityController.text,
          "price": _itemPriceController.text,
        });
        _itemNameController.clear();
        _itemQuantityController.clear();
        _itemPriceController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Invoice Generator"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection("Invoice Details", [
              _buildTextField(
                controller: _invoiceNumberController,
                label: "Invoice Number",
                icon: Icons.receipt,
              ),
              _buildTextField(
                controller: _invoiceDateController,
                label: "Invoice Date",
                icon: Icons.date_range,
              ),
              _buildTextField(
                controller: _dueDateController,
                label: "Due Date",
                icon: Icons.event,
              ),
            ]),
            _buildSection("Seller Details", [
              _buildTextField(
                controller: _sellerNameController,
                label: "Seller Name",
                icon: Icons.store,
              ),
              _buildTextField(
                controller: _sellerAddressController,
                label: "Seller Address",
                icon: Icons.location_on,
              ),
              _buildTextField(
                controller: _sellerContactController,
                label: "Seller Contact",
                icon: Icons.phone,
              ),
              _buildTextField(
                controller: _sellerTaxNumberController,
                label: "Seller Tax Number",
                icon: Icons.confirmation_number,
              ),
            ]),
            _buildSection("Buyer Details", [
              _buildTextField(
                controller: _buyerNameController,
                label: "Buyer Name",
                icon: Icons.person,
              ),
              _buildTextField(
                controller: _buyerAddressController,
                label: "Buyer Address",
                icon: Icons.home,
              ),
              _buildTextField(
                controller: _buyerContactController,
                label: "Buyer Contact",
                icon: Icons.phone,
              ),
            ]),
            _buildSection("Payment Details", [
              _buildTextField(
                controller: _paymentTypeController,
                label: "Payment Type",
                icon: Icons.payment,
              ),
              _buildTextField(
                controller: _accountDetailsController,
                label: "Account Details",
                icon: Icons.account_balance,
              ),
            ]),
            _buildSection("Invoice Items", [
              _buildTextField(
                controller: _itemNameController,
                label: "Item Name",
                icon: Icons.shopping_bag,
              ),
              _buildTextField(
                controller: _itemQuantityController,
                label: "Quantity",
                icon: Icons.format_list_numbered,
              ),
              _buildTextField(
                controller: _itemPriceController,
                label: "Price",
                icon: Icons.attach_money,
              ),
              ElevatedButton(
                onPressed: _addItem,
                child: const Text("Add Item"),
              ),
              ...items.map(
                (item) => ListTile(
                  title: Text("${item["name"]} - \$${item["price"]}"),
                  subtitle: Text("Quantity: ${item["quantity"]}"),
                ),
              ),
            ]),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _generateInvoice(),
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text("Generate Invoice"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Future<void> _generateInvoice() async {
    var pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: pw.PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                "Invoice",
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),

              // Invoice Details
              pw.Text("Invoice Number: ${_invoiceNumberController.text}"),
              pw.Text("Invoice Date: ${_invoiceDateController.text}"),
              pw.Text("Due Date: ${_dueDateController.text}"),
              pw.SizedBox(height: 10),

              // Seller Details
              pw.Text(
                "Seller Details",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text("Name: ${_sellerNameController.text}"),
              pw.Text("Address: ${_sellerAddressController.text}"),
              pw.Text("Contact: ${_sellerContactController.text}"),
              pw.Text("Tax Number: ${_sellerTaxNumberController.text}"),
              pw.SizedBox(height: 10),

              // Buyer Details
              pw.Text(
                "Buyer Details",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text("Name: ${_buyerNameController.text}"),
              pw.Text("Address: ${_buyerAddressController.text}"),
              pw.Text("Contact: ${_buyerContactController.text}"),
              pw.SizedBox(height: 10),

              // Payment Details
              pw.Text(
                "Payment Details",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text("Payment Type: ${_paymentTypeController.text}"),
              pw.Text("Account Details: ${_accountDetailsController.text}"),
              pw.SizedBox(height: 10),

              // Invoice Items Table
              pw.Text(
                "Invoice Items",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Table.fromTextArray(
                headers: ["Item", "Quantity", "Price"],
                data:
                    items
                        .map(
                          (item) => [
                            item["name"],
                            item["quantity"],
                            "\$${item["price"]}",
                          ],
                        )
                        .toList(),
              ),

              pw.SizedBox(height: 20),

              // Total Amount
              pw.Text(
                "Total: \$${_calculateTotal()}",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (pw.PdfPageFormat format) async => pdf.save(),
    );
  }

  double _calculateTotal() {
    return items.fold(0, (sum, item) {
      double price = double.tryParse(item["price"] ?? "0") ?? 0;
      int quantity = int.tryParse(item["quantity"] ?? "0") ?? 0;
      return sum + (price * quantity);
    });
  }
}
