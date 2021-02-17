import 'package:flutter/material.dart';
import 'package:flutter_datatable_with_mobx/common/ex_button.dart';
import 'package:flutter_datatable_with_mobx/model/ex_invoice_model.dart';
import 'package:flutter_datatable_with_mobx/view_model/datatable_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DataTableView extends StatefulWidget {
  @override
  _DataTableViewState createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  DataTableViewModel _vm;
  double _screenWidth;

  @override
  void initState() {
    _vm = DataTableViewModel();
    _vm.fetchInvoices();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _buildTableTitle(context),
              _buildDataTable(),
              const SizedBox(height: 150),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          width: _screenWidth,
          child: _buildFooter(),
        )
      ],
    );
  }

  Text _buildTableTitle(BuildContext context) {
    return Text(
      'Monthly Invoice Table',
      style: Theme.of(context).textTheme.headline5,
    );
  }

  SizedBox _buildDataTable() {
    return SizedBox(
      width: double.infinity,
      child: Observer(builder: (_) {
        return DataTable(
          showBottomBorder: true,
          columns: [
            DataColumn(label: Text('Bill Date')),
            DataColumn(label: Text('Amount')),
          ],
          rows: _vm.invoices
              .map<DataRow>(
                (ExInvoiceModel invoice) => DataRow(
                  selected: invoice.isSelected,
                  onSelectChanged: (bool isSelected) {
                    invoice.isSelected = !invoice.isSelected;
                  },
                  cells: [
                    DataCell(Text(invoice.date)),
                    DataCell(Text('${invoice.amount} \$')),
                  ],
                ),
              )
              .toList(),
        );
      }),
    );
  }

  Observer _buildFooter() {
    return Observer(builder: (_) {
      if (_vm.selectedInvoicesIsEmpty) {
        return _buildEmptyWidget();
      }

      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('TOTAL AMOUNT',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      )),
                  Text(
                    '${_vm.totalAmount} \$',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              ExButton(
                buttonText: 'Pay',
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
    });
  }

  SizedBox _buildEmptyWidget() {
    return SizedBox.shrink();
  }
}
