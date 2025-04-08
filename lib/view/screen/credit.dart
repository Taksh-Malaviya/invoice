import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CreditMemoScreen extends StatefulWidget {
  @override
  _CreditMemoScreenState createState() => _CreditMemoScreenState();
}

class _CreditMemoScreenState extends State<CreditMemoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _memoNumberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = pickedDate.toString().split(" ")[0];
      });
    }
  }

  Future<void> _generatePDF() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build:
            (pw.Context context) => pw.Padding(
              padding: pw.EdgeInsets.all(24),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "CREDIT MEMO",
                    style: pw.TextStyle(
                      fontSize: 26,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Divider(),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "Memo Number: ${_memoNumberController.text}",
                    style: pw.TextStyle(fontSize: 18),
                  ),
                  pw.Text(
                    "Date: ${_dateController.text}",
                    style: pw.TextStyle(fontSize: 18),
                  ),
                  pw.Text(
                    "Amount: \$${_amountController.text}",
                    style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue,
                    ),
                  ),
                  pw.Text(
                    "Reason: ${_reasonController.text}",
                    style: pw.TextStyle(fontSize: 18),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Divider(),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "Thank you for your business!",
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.green,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );

    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/credit_memo.pdf");
    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('PDF Saved at ${file.path}')));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _generatePDF();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Credit Memo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _memoNumberController,
                decoration: InputDecoration(labelText: 'Credit Memo Number'),
                validator:
                    (value) => value!.isEmpty ? 'Enter Memo Number' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: _pickDate,
                  ),
                ),
                readOnly: true,
                validator: (value) => value!.isEmpty ? 'Select a Date' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter Amount' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _reasonController,
                decoration: InputDecoration(labelText: 'Reason'),
                validator: (value) => value!.isEmpty ? 'Enter Reason' : null,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _generatePDF,
                  child: Text('Submit & Generate PDF'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
