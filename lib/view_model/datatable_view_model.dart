import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_datatable_with_mobx/model/ex_invoice_model.dart';
import 'package:flutter_datatable_with_mobx/model/invoice_model.dart';
import 'package:mobx/mobx.dart';

part 'datatable_view_model.g.dart';

class DataTableViewModel = _DataTableViewModel with _$DataTableViewModel;

abstract class _DataTableViewModel with Store {
  @observable
  ObservableList<ExInvoiceModel> invoices = <ExInvoiceModel>[].asObservable();

  @computed
  List<ExInvoiceModel> get selectedInvoices => invoices.where((invoice) => invoice.isSelected).toList();

  @computed
  bool get selectedInvoicesIsEmpty => selectedInvoices.isEmpty;

  @computed
  int get totalAmount => selectedInvoices.fold(0, (previousValue, element) => previousValue + element.amount);

  @action
  Future<void> fetchInvoices() async {
    var invoicesJson = await rootBundle.loadString('assets/invoices.json');
    List<dynamic> decodedJson = jsonDecode(invoicesJson);

    invoices.addAll(decodedJson.map((e) => ExInvoiceModel(InvoiceModel.fromJson(e))).toList().asObservable());
  }
}
