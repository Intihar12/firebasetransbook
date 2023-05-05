import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetransbook/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../country_code_list/country_code_list.dart';
import '../../modals/supplier_modal/creat_supplier_modal.dart';
import '../country_code_controller/country_code_controller.dart';

var dialCodes = "+57";
CountryController countryControllerSup = Get.find();

class SupplierController extends GetxController {
  DateTime now = DateTime.now();
  String? countryCode;
  bool isMobileNumberValid = false;
  var supplierList = <CreateSupplierModal>[];
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection("Suppliers");
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  CreateSupplierModal createSupplierModal = CreateSupplierModal();
  String? SupIds;
  void supplierfunction() {
    final user = auth.currentUser;
    DocumentReference supId = fireStore.doc();
    SupIds = supId.id;
    fireStore.doc(supId.id).set(createSupplierFunction()).then((value) {
      Utils().toastMessage("success supplier creat");
      getUserData();
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  String? avatarText;
  String? userNme;
  Map<String, dynamic> createSupplierFunction() {
    DocumentReference supId = fireStore.doc();
    final user = auth.currentUser;
    CreateSupplierModal createSupplierModal = CreateSupplierModal(
      supplierName: nameController.text,
      phoneNum: countryCode! + phoneController.text,
      balance: 0,
      createBy: user!.uid,
      supplierId: SupIds,
      createAt: DateTime.now(),
    );
    update();
    return createSupplierModal.toJson();
  }

  RxBool isSupplierData = false.obs;
  Future<void> getUserData() async {
    print("this is supplier");
    final user = auth.currentUser;
    try {
      QuerySnapshot list = await FirebaseFirestore.instance.collection("Suppliers").where("createBy", isEqualTo: user!.uid).orderBy("createAt").get();
      supplierList.clear();

      for (var supList in list.docs) {
        Map<String, dynamic>? map = supList.data() as Map<String, dynamic>?;
        CreateSupplierModal modal = CreateSupplierModal.fromJson(map);

        supplierList.add(modal);
      }

      isSupplierData.value = true;
      update();
    } catch (e) {
      print(e);
      Utils().toastMessage(e.toString());
    }
  }

  var newPhoneNumber;
  seperatePhoneAndDialCode(String? phoneNumber) {
    phoneController.clear();
    print("in seperatePhoneAndDialCode");
    Map<String, String> foundedCountry = {};
    for (var country in Countries.allCountries) {
      String dialCode = country["dial_code"].toString();
      if (phoneNumber!.contains(dialCode)) {
        foundedCountry = country;
      }
    }

    if (foundedCountry.isNotEmpty) {
      dialCodes = phoneNumber!.substring(
        0,
        foundedCountry["dial_code"]!.length,
      );

      // code = CountryCode(
      //   name: foundedCountry["name"]!,
      //   code: foundedCountry["code"]!,
      //   dialCode: dialCodes,
      // );

      newPhoneNumber = phoneNumber.substring(
        foundedCountry["dial_code"]!.length,
      );

      countryControllerSup.selectedValueCountry = countryControllerSup.countryLists.firstWhere((element) => element.name == dialCodes);

      phoneController.text = newPhoneNumber ?? "";
      print("intoo${dialCodes}");
      print("intoo${newPhoneNumber}");
    }
    print("Here is phone controller " + phoneNumber.toString());
    print("it is null " + foundedCountry.toString());
  }

  void getSingleData(String id) {
    FirebaseFirestore.instance.collection("Suppliers").doc(id).get().then((value) {
      createSupplierModal = CreateSupplierModal.fromJson(value.data());
      seperatePhoneAndDialCode(createSupplierModal.phoneNum ?? "");
      nameController.text = createSupplierModal.supplierName.toString();
      print("supplier data");
      print(createSupplierModal.supplierName);
      print(createSupplierModal.phoneNum);
      update();
      return createSupplierModal;
    });
    // return null;
  }

  RxBool isUpdateLoading = false.obs;
  Map<String, dynamic> updateSupplier(String supplierId) {
    final user = auth.currentUser;

    createSupplierModal = CreateSupplierModal(
        createAt: DateTime.now(),
        createBy: user!.uid,
        phoneNum: countryCode! + phoneController.text,
        supplierName: nameController.text,
        supplierId: supplierId,
        balance: 0);
    isUpdateLoading.value = true;
    return createSupplierModal.toJson();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
  }
}
