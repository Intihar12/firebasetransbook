import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetransbook/country_code_list/country_code_list.dart';
import 'package:firebasetransbook/modals/driver_modal/driver_modal.dart';
import 'package:firebasetransbook/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../values/dimens.dart';
import '../../values/size_config.dart';
import '../country_code_controller/country_code_controller.dart';

enum SingingCharacter { driverHasToPay, driverHasToGet }

var dialCodes = "+57";
//String? balance = "-";
CountryController countryController = Get.find();

class DriverController extends GetxController {
  final amountController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final searchController = TextEditingController();
  RxBool isOpeningBalance = false.obs;
  RxBool driverExpenseLoading = false.obs;
  bool driverGaveGotBool = true;
  String? driverName;
  String? driverHasToPay = "";
  String? driverHasToGet;
  SingingCharacter? character = SingingCharacter.driverHasToPay;
  //SingingCharacter? characters = SingingCharacter.driverHasToGet;
  String? codeNum;
  final fireStore = FirebaseFirestore.instance.collection("Drivers");
  final auth = FirebaseAuth.instance;

  String? selectStartDateTrip;
  void checkRadio(String value) {
    driverHasToPay = value;
  }

  selectDates(BuildContext context, int index) async {
    DateTime? selectDate;
    await DatePicker.showDatePicker(context, showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
      selectDate = date;
      update();
    }, currentTime: DateTime.now());
    if (selectDate != null) {
      if (index == 0) {
        selectStartDateTrip = DateFormat('yyyy-MM-dd').format(selectDate!);
        update();
      }
      // update();
    }
  }

  String s = "899999";
  //String loginToken = "[iuiuiuwdsd34svdfuiuiu]";
  void intuu() {
    String string = amountController.text;
    var result = string.contains("-")
        ? string.substring(
            1,
          )
        : string;
    print(result); // 'artlang'
    //result = string.substring(1, 4);
    print("uyuy");
    print(result);
  }

  Map<String, dynamic> createDriver(String docId) {
    var user = auth.currentUser;
    DriverModal driverModal = DriverModal(
        negativeSign: amountController.text.isNotEmpty
            ? driverGaveGotBool == true
                ? "-"
                : ""
            : "",
        balance: amountController.text.isNotEmpty ? int.parse(amountController.text) : 0,
        // .isNotEmpty
        // ? driverGaveGotBool == true
        //     ? int.parse("-" + amountController.text)
        //     : int.parse(amountController.text)
        // : 0,
        phoneNum: phoneController.text.isNotEmpty ? codeNum! + phoneController.text : "",
        driverName: nameController.text,
        createBy: user!.uid,
        createAt: DateTime.now(),
        driverId: docId);
    return driverModal.toJson();
  }

  RxBool isCreateDriver = false.obs;
  void createDriverButtonFunction() {
    var user = auth.currentUser;
    DocumentReference doc = fireStore.doc();
    fireStore.doc(doc.id).set(createDriver(doc.id)).then((value) {
      Utils().toastMessage("success");
      isCreateDriver.value = true;
      getDriverListData();
      Get.back();
      update();
    }).onError((error, stackTrace) {
      isCreateDriver.value = true;

      Utils().toastMessage(error.toString());
      update();
    });
  }

  List<DriverModal> driverList = <DriverModal>[];
  List seracgDriverList = <DriverModal>[];
  RxBool isDriverLoadingData = false.obs;
  Future<void> getDriverListData() async {
    var user = auth.currentUser;
    QuerySnapshot list =
        await FirebaseFirestore.instance.collection("Drivers").where("createBy", isEqualTo: user!.uid).orderBy("createAt", descending: true).get();
    driverList.clear();
    for (var drvList in list.docs) {
      Map<String, dynamic>? map = drvList.data() as Map<String, dynamic>?;

      DriverModal modal = DriverModal.fromJson(map);
      driverList.add(modal);
      //driverList = seracgDriverList;
    }
    isDriverLoadingData.value = true;
    update();
  }

  DriverModal driverModal = DriverModal();
  RxBool isDriverDetailsLoading = false.obs;
  void getDriverSingleData(String driverId) {
    FirebaseFirestore.instance.collection("Drivers").doc(driverId).get().then((value) {
      driverModal = DriverModal.fromJson(value.data());
      sepratePhoneNum(driverModal.phoneNum ?? "");
      nameController.text = driverModal.driverName.toString();
      amountController.text = "${driverModal.negativeSign != null ? driverModal.negativeSign : ""}" + driverModal.balance.toString();
      isDriverDetailsLoading.value = true;
      update();
      return driverModal;
    });
    //isDriverDetailsLoading.value = true;
    update();
  }

  String? newPhoneNum;
  void sepratePhoneNum(String phNum) {
    phoneController.clear();
    Map<String, dynamic> foundedCountry = {};
    for (var country in Countries.allCountries) {
      String dialCode = country["dial_code"].toString();
      if (phNum.contains(dialCode)) {
        foundedCountry = country;
      }
    }
    if (foundedCountry.isNotEmpty) {
      dialCodes = phNum.substring(
        0,
        foundedCountry["dial_code"]!.length,
      );
      countryController.selectedValueCountry = countryController.countryLists.firstWhere((element) => element.name == dialCodes);

      newPhoneNum = phNum.substring(foundedCountry["dial_code"]!.length);
      phoneController.text = newPhoneNum ?? "";
    }
  }

  RxBool isUpdateDriver = false.obs;
  void updateDriver(String driverId) {
    fireStore.doc(driverId).update(updateDriverFunction(driverId)).then((value) {
      Utils().toastMessage("update success");
      isUpdateDriver.value = true;
      getDriverSingleData(driverId);
      getDriverListData();
      Get.back();
      update();
    }).onError((error, stackTrace) {
      print(error.toString());
      isUpdateDriver.value = true;
      update();
    });
  }

  Map<String, dynamic> updateDriverFunction(String driverId) {
    var user = auth.currentUser;
    String string = amountController.text;
    var result = string.contains("-")
        ? string.substring(
            1,
          )
        : string;

    DriverModal updateModal = DriverModal(
        driverId: driverId,
        negativeSign: amountController.text.isNotEmpty
            ? driverGaveGotBool == true
                ? "-"
                : ""
            : "",
        createAt: driverModal.createAt,
        createBy: user!.uid,
        driverName: nameController.text,
        phoneNum: phoneController.text,
        balance: amountController.text.isNotEmpty ? result : 0);

    return updateModal.toJson();
  }

  // void filterSearch(String names) {
  //   List results = [];
  //
  //   if (names.isEmpty) {
  //     results = seracgDriverList;
  //     update();
  //     Get.log("result products list ${results.length}");
  //   } else {
  //     results = seracgDriverList.where((element) => element.driverName!.toLowerCase().contains(names.toLowerCase())).toList();
  //     update();
  //   }
  //   driverList = results.;
  //   update();
  // }

  void searchFromFireBase(String searchName) async {
    await fireStore.where("nameSearch", arrayContains: searchName).get().then((documents) {
      driverList.clear();
      documents.docs.forEach((doc) {
        print(doc.id);
        driverList.add(DriverModal.fromJson(doc.data()));
      });
    });

    update();
  }
}
