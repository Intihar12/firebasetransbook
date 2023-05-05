class TruckModal {
  String? supplierName;
  var phoneNum;
  var balance;
  var createBy;
  var supplierId;
  String? registrationNumber;
  var truckId;
  DateTime? createAt;
  TruckModal({this.supplierName, this.phoneNum, this.balance, this.createBy, this.supplierId, this.createAt, this.registrationNumber, this.truckId});

  factory TruckModal.fromJson(Map<String, dynamic>? json) => TruckModal(
      supplierName: json?["supplierName"],
      phoneNum: json?["phoneNum"],
      balance: json?["balance"],
      supplierId: json?["supplierId"],
      createBy: json?["createBy"],
      createAt: json?["createAt"] != null ? json!["createAt"].toDate() : json?["createAt"],
      registrationNumber: json?["registrationNumber"],
      truckId: json?["truckId"]);

  Map<String, dynamic> toJson() => {
        "supplierName": supplierName,
        "phoneNum": phoneNum,
        "balance": balance,
        "createBy": createBy,
        "supplierId": supplierId,
        "createAt": createAt,
        "registrationNumber": registrationNumber,
        "truckId": truckId
      };
}
