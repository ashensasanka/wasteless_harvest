import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/customer.dart';
import '../../models/invoice.dart';
import '../../models/supplier.dart';
import '../widgets/button_widget.dart';
import '../widgets/pdf_helper.dart';
import '../widgets/pdf_invoice_helper.dart';
import '../widgets/title_widget.dart';

class FarmerReportsPage extends StatefulWidget {
  const FarmerReportsPage({super.key});

  @override
  State<FarmerReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<FarmerReportsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color.fromARGB(66, 196, 194, 194),
    appBar: AppBar(
      title: const Text('Farmer Report'),
      centerTitle: true,
    ),
    body: Container(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TitleWidget(
              icon: Icons.picture_as_pdf,
              text: 'Generate Report',
            ),
            const SizedBox(height: 48),
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("farmer_users")
                  .doc("Farmer1")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  final userdata = snapshot.data!.data() as Map<String, dynamic>;
                  return ButtonWidget(
                    text: 'Get PDF',
                    onClicked: () async {
                      final date = DateTime.now();
                      final dueDate = date.add(
                        const Duration(days: 7),
                      );

                      final invoice = FarmerInvoice(
                        supplier: Supplier(
                          name: userdata['name'],
                          address: userdata['address'],
                          paymentInfo: 'https://paypal.me/codespec',
                        ),
                        customer: const Customer(
                          name: '',
                          address: '',
                        ),
                        info: InvoiceInfo(
                          date: date,
                          dueDate: dueDate,
                          description: 'Farmer Report',
                          number: '${DateTime.now().year}-9999',
                        ),
                        items: [
                          FarmerInvoiceItem(
                            description: '12349202',
                            date: DateTime.now(),
                            quantity: 3,
                            vat: 0.19,
                            unitPrice: 4000,
                          ),
                          FarmerInvoiceItem(
                            description: '56781222',
                            date: DateTime.now(),
                            quantity: 8,
                            vat: 0.19,
                            unitPrice: 5000,
                          ),
                          FarmerInvoiceItem(
                            description: '91013242',
                            date: DateTime.now(),
                            quantity: 3,
                            vat: 0.19,
                            unitPrice: 6000,
                          ),
                          FarmerInvoiceItem(
                            description: '11215262',
                            date: DateTime.now(),
                            quantity: 8,
                            vat: 0.19,
                            unitPrice: 7000,
                          ),
                          FarmerInvoiceItem(
                            description: '31417282',
                            date: DateTime.now(),
                            quantity: 1,
                            vat: 0.19,
                            unitPrice: 8000,
                          ),
                          FarmerInvoiceItem(
                            description: '51619303',
                            date: DateTime.now(),
                            quantity: 5,
                            vat: 0.19,
                            unitPrice: 3000,
                          ),
                          FarmerInvoiceItem(
                            description: '71811323',
                            date: DateTime.now(),
                            quantity: 4,
                            vat: 0.19,
                            unitPrice: 4000,
                          ),
                        ],
                      );
                      final pdfFile = await PdfInvoicePdfHelper.generatefarmer(invoice);
                      PdfHelper.openFile(pdfFile);
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Farmer Report Generated !'),
                          content: Text('PDF file has been generated successfully.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                PdfHelper.openFile(pdfFile); // Pass BuildContext
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError){
                  return Center(
                    child: Text('Error${snapshot.error}'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            ),
          ],
        ),
      ),
    ),
  );
}
