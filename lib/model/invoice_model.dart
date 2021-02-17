class InvoiceModel {
  int id;
  String date;
  int amount;

  InvoiceModel({this.id, this.date, this.amount});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['amount'] = this.amount;
    return data;
  }
}
