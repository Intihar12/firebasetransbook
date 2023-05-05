class DieselModal {
  String? expenseType;
  var dieselId;
  var paymentMethod;
  var amount;
  var fuelQty;
  var rateOper;
  DateTime? date;
  var currentKm;
  String? image;
  String? pumpName;
  var createBy;
  var truckId;
  DateTime? createAt;
  DieselModal(
      {this.paymentMethod,
      this.dieselId,
      this.expenseType,
      this.amount,
      this.createBy,
      this.createAt,
      this.truckId,
      this.image,
      this.date,
      this.pumpName,
      this.currentKm,
      this.fuelQty,
      this.rateOper});

  factory DieselModal.fromJson(Map<String, dynamic>? json) => DieselModal(
        dieselId: json?["dieselId"],
        paymentMethod: json?["paymentMethod"],
        amount: json?["amount"],
        createBy: json?["createBy"],
        createAt: json?["createAt"] != null ? json!["createAt"].toDate() : json?["createAt"],
        truckId: json?["truckId"],
        image: json?["image"] == null ? null : json?["image"],
        currentKm: json?["currentKm"],
        date: json?["date"] != null ? json!["date"].toDate() : json?["date"],
        expenseType: json?["expenseType"],
        fuelQty: json?["fuelQty"],
        pumpName: json?["pumpName"],
        rateOper: json?["rateOper"],
      );

  Map<String, dynamic> toJson() => {
        "createBy": createBy,
        "createAt": createAt,
        "rateOper": rateOper,
        "pumpName": pumpName,
        "truckId": truckId,
        "fuelQty": fuelQty,
        "expenseType": expenseType,
        "date": date,
        "currentKm": currentKm,
        "image": image,
        "amount": amount
      };
}
