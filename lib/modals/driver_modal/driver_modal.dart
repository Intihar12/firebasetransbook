class DriverModal {
  String? driverName;
  var phoneNum;
  var balance;
  var createBy;
  var driverId;
  var negativeSign;
  DateTime? createAt;
  List? nameSearch;
  DriverModal({this.driverName, this.phoneNum, this.balance, this.createBy, this.driverId, this.createAt, this.negativeSign, this.nameSearch});

  factory DriverModal.fromJson(Map<String, dynamic>? json) => DriverModal(
        driverName: json?["driverName"],
        phoneNum: json?["phoneNum"],
        balance: json?["balance"],
        driverId: json?["driverId"],
        createBy: json?["createBy"],
        createAt: json?["createAt"] != null ? json!["createAt"].toDate() : json?["createAt"],
        negativeSign: json?["negativeSign"],
        // nameSearch: json?["nameSearch"],
        nameSearch: json?["nameSearch"] == null ? [] : List<dynamic>.from(json?["nameSearch"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "driverName": driverName,
        "phoneNum": phoneNum,
        "balance": balance,
        "createBy": createBy,
        "driverId": driverId,
        "createAt": createAt,
        "negativeSign": negativeSign,
        "nameSearch": makeNameSearch(driverName.toString()),
      };

  List<String> makeNameSearch(String name) {
    List<String> nameSearchList = [];
    String temp = "";
    for (int i = 0; i < name.length; i++) {
      temp = temp + name[i];
      nameSearchList.add(temp);
    }
    return nameSearchList;
  }
}
