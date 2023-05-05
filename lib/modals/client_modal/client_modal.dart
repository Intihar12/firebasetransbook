class ClientModal {
  String? clientName;
  var phoneNum;
  var balance;
  var createBy;
  var clientId;
  DateTime? createAt;
  ClientModal({this.clientName, this.phoneNum, this.balance, this.createBy, this.clientId, this.createAt});

  factory ClientModal.fromJson(Map<String, dynamic>? json) => ClientModal(
        clientName: json?["supplierName"],
        phoneNum: json?["phoneNum"],
        balance: json?["balance"],
        clientId: json?["supplierId"],
        createBy: json?["createBy"],
        createAt: json?["createAt"] != null ? json!["createAt"].toDate() : json?["createAt"],
      );

  Map<String, dynamic> toJson() =>
      {"supplierName": clientName, "phoneNum": phoneNum, "balance": balance, "createBy": createBy, "supplierId": clientId, "createAt": createAt};
}
