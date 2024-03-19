import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/customer.dart';
import '../../models/invoice.dart';
import '../../models/supplier.dart';
import '../widgets/button_widget.dart';
import '../widgets/pdf_helper.dart';
import '../widgets/pdf_invoice_helper.dart';
import '../widgets/title_widget.dart';

class BuyerReportsPage extends StatefulWidget {
  const BuyerReportsPage({super.key});

  @override
  State<BuyerReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<BuyerReportsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color.fromARGB(66, 196, 194, 194),
    appBar: AppBar(
      title: const Text('Buyer Report'),
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
                  .collection("buyer_users")
                  .doc("Buyer123")
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

                      final invoice = BuyerInvoice(
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
                          description: 'Buyer Report',
                          number: '${DateTime.now().year}-9999',
                        ),
                        items: [
                          BuyerInvoiceItem(
                            description: '12349202',
                            date: DateTime.now(),
                            quantity: 3,
                            unitPrice: 4000,
                          ),
                          BuyerInvoiceItem(
                            description: '56781222',
                            date: DateTime.now(),
                            quantity: 8,
                            unitPrice: 5000,
                          ),
                          BuyerInvoiceItem(
                            description: '91013242',
                            date: DateTime.now(),
                            quantity: 3,
                            unitPrice: 6000,
                          ),
                          BuyerInvoiceItem(
                            description: '11215262',
                            date: DateTime.now(),
                            quantity: 8,
                            unitPrice: 7000,
                          ),
                          BuyerInvoiceItem(
                            description: '31417282',
                            date: DateTime.now(),
                            quantity: 1,
                            unitPrice: 8000,
                          ),
                          BuyerInvoiceItem(
                            description: '51619303',
                            date: DateTime.now(),
                            quantity: 5,
                            unitPrice: 3000,
                          ),
                          BuyerInvoiceItem(
                            description: '71811323',
                            date: DateTime.now(),
                            quantity: 4,
                            unitPrice: 4000,
                          ),
                        ],
                      );
                      final pdfFile = await PdfInvoicePdfHelper.generatebuyer(invoice);
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
