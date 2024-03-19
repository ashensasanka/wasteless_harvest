
import 'package:farmer/models/supplier.dart';

import 'customer.dart';

class FarmerInvoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<FarmerInvoiceItem> items;

  const FarmerInvoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class BuyerInvoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<BuyerInvoiceItem> items;

  const BuyerInvoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class FarmerInvoiceItem {
  final String description;
  final DateTime date;
  final int quantity;
  final double vat;
  final double unitPrice;

  const FarmerInvoiceItem({
    required this.description,
    required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
  });
}

class BuyerInvoiceItem {
  final String description;
  final DateTime date;
  final int quantity;
  final double unitPrice;

  const BuyerInvoiceItem({
    required this.description,
    required this.date,
    required this.quantity,
    required this.unitPrice,
  });
}
