import 'dart:ui';

class UserBusinessInfoModal {
  String? name;
  String? businessName;
  String? image;
  bool? transportContractor;
  bool? truckOwner;
  bool? other;
  String? uid;
  var phoneNum;
  String? city;
  String? addressLine1;
  String? addressLine2;
  var pinCode;
  // Works? works;

  UserBusinessInfoModal({
    this.name,
    this.businessName,
    this.image,
    this.transportContractor,
    this.truckOwner,
    this.other,
    this.uid,
    this.phoneNum,
    this.city,
    this.addressLine1,
    this.addressLine2,
    this.pinCode,
    //this.works
  });

  factory UserBusinessInfoModal.fromJson(Map<String, dynamic>? json) => UserBusinessInfoModal(
        name: json?["name"],
        businessName: json?["businessName"],
        image: json?["image"] == null ? null : json?["image"],
        transportContractor: json?["transportContractor"],
        truckOwner: json?["truckOwner"],
        other: json?["other"],
        uid: json?["uid"],
        phoneNum: json?["phoneNum"],
        city: json?["city"],
        addressLine1: json?["addressLine1"],
        addressLine2: json?["addressLine2"],
        pinCode: json?["pinCode"],
        //works: json?["works"]
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "businessName": businessName,
        "image": image,
        "transportContractor": transportContractor,
        "truckOwner": truckOwner,
        "other": other,
        "uid": uid,
        "phoneNum": phoneNum,
        "city": city,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "pinCode": pinCode,
        // "works": works
      };
}

class Works {
  Works({
    this.transportContractor,
    this.truckOwner,
    this.commissionAgent,
  });

  bool? transportContractor;
  bool? truckOwner;
  bool? commissionAgent;

  factory Works.fromJson(Map<String, dynamic> json) => Works(
        transportContractor: json["transport_contractor"],
        truckOwner: json["truck_owner"],
        commissionAgent: json["commission_agent"],
      );

  Map<String, dynamic> toJson() => {
        "transport_contractor": transportContractor,
        "truck_owner": truckOwner,
        "commission_agent": commissionAgent,
      };
}
