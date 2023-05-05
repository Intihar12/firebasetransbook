class CreateSupplierModal {
  String? supplierName;
  var phoneNum;
  var balance;
  var createBy;
  var supplierId;
  DateTime? createAt;
  CreateSupplierModal({this.supplierName, this.phoneNum, this.balance, this.createBy, this.supplierId, this.createAt});

  factory CreateSupplierModal.fromJson(Map<String, dynamic>? json) => CreateSupplierModal(
        supplierName: json?["supplierName"],
        phoneNum: json?["phoneNum"],
        balance: json?["balance"],
        supplierId: json?["supplierId"],
        createBy: json?["createBy"],
        createAt: json?["createAt"] != null ? json!["createAt"].toDate() : json?["createAt"],
      );

  Map<String, dynamic> toJson() =>
      {"supplierName": supplierName, "phoneNum": phoneNum, "balance": balance, "createBy": createBy, "supplierId": supplierId, "createAt": createAt};
}
