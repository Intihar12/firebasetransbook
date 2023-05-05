class TripModal {
  String? clientName;
  String? truckNumber;
  String? driverName;
  String? supplierName;
  String? origin;
  String? destination;
  String? clientBillingType;
  String? supplierBillingType;
  var tripId;
  var createBy;

  TripModal(
      {this.clientName,
      this.truckNumber,
      this.driverName,
      this.supplierName,
      this.origin,
      this.destination,
      this.clientBillingType,
      this.supplierBillingType,
      this.tripId,
      this.createBy});
  factory TripModal.fromJson(Map<String, dynamic>? json) => TripModal(
      clientName: json?["clientName"],
      truckNumber: json?["truckNUmber"],
      driverName: json?["driverName"],
      supplierName: json?["supplierName"],
      origin: json?["origin"],
      destination: json?["destination"],
      clientBillingType: json?["clientBillingType"],
      supplierBillingType: json?["supplierBillingType"],
      tripId: json?["tripId"],
      createBy: json?["createBy"]);
  Map<String, dynamic> toJson() => {
        "clientName": clientName,
        "truckNumber": truckNumber,
        "driverName": driverName,
        "supplierName": supplierName,
        "origin": origin,
        "destination": destination,
        "clientBillingType": clientBillingType,
        "supplierBillingType": supplierBillingType,
        "tripId": tripId,
        "createBy": createBy
      };
}
