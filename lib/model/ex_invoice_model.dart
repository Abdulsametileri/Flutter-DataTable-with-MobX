import 'package:mobx/mobx.dart';
import 'invoice_model.dart';

part 'ex_invoice_model.g.dart';

class ExInvoiceModel extends _ExInvoiceModel with _$ExInvoiceModel {
  ExInvoiceModel(InvoiceModel invoice) : super(invoice);
}

abstract class _ExInvoiceModel extends InvoiceModel with Store {
  _ExInvoiceModel(InvoiceModel invoice) : super(amount: invoice.amount, date: invoice.date, id: invoice.id);

  @observable
  bool isSelected = false;
}
