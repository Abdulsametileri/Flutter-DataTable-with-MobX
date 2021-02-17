import 'package:flutter/material.dart';
import 'package:flutter_datatable_with_mobx/view/datatable_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataTable MobX Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('DataTable Example'),
        ),
        body: DataTableView(),
      ),
    );
  }
}
