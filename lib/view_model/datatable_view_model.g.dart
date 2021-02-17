// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datatable_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataTableViewModel on _DataTableViewModel, Store {
  Computed<List<ExInvoiceModel>> _$selectedInvoicesComputed;

  @override
  List<ExInvoiceModel> get selectedInvoices => (_$selectedInvoicesComputed ??=
          Computed<List<ExInvoiceModel>>(() => super.selectedInvoices,
              name: '_DataTableViewModel.selectedInvoices'))
      .value;
  Computed<bool> _$selectedInvoicesIsEmptyComputed;

  @override
  bool get selectedInvoicesIsEmpty => (_$selectedInvoicesIsEmptyComputed ??=
          Computed<bool>(() => super.selectedInvoicesIsEmpty,
              name: '_DataTableViewModel.selectedInvoicesIsEmpty'))
      .value;
  Computed<int> _$totalAmountComputed;

  @override
  int get totalAmount =>
      (_$totalAmountComputed ??= Computed<int>(() => super.totalAmount,
              name: '_DataTableViewModel.totalAmount'))
          .value;

  final _$invoicesAtom = Atom(name: '_DataTableViewModel.invoices');

  @override
  ObservableList<ExInvoiceModel> get invoices {
    _$invoicesAtom.reportRead();
    return super.invoices;
  }

  @override
  set invoices(ObservableList<ExInvoiceModel> value) {
    _$invoicesAtom.reportWrite(value, super.invoices, () {
      super.invoices = value;
    });
  }

  final _$fetchInvoicesAsyncAction =
      AsyncAction('_DataTableViewModel.fetchInvoices');

  @override
  Future<void> fetchInvoices() {
    return _$fetchInvoicesAsyncAction.run(() => super.fetchInvoices());
  }

  @override
  String toString() {
    return '''
invoices: ${invoices},
selectedInvoices: ${selectedInvoices},
selectedInvoicesIsEmpty: ${selectedInvoicesIsEmpty},
totalAmount: ${totalAmount}
    ''';
  }
}
