import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetransbook/modals/truck_modal/diesel_modal.dart';
import 'package:firebasetransbook/modals/truck_modal/truck_modal.dart';
import 'package:firebasetransbook/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

enum SingingCharacters { myTruck, marketTruck }

class TruckController extends GetxController {
  String? supplierId;
  String? supplierName;
  String? thisMonth;
  String? thisMonthTrue;
  String? truckNUmber;
  bool status = true;
  RxBool isTruck = false.obs;
  RxBool isLoading = false.obs;
  int? supId;
  final registrationController = TextEditingController();
  SingingCharacters? character = SingingCharacters.myTruck;

  final fireStore = FirebaseFirestore.instance.collection("Trucks");
  final auth = FirebaseAuth.instance;

  Map<String, dynamic> createTruck(String docId) {
    var user = auth.currentUser;
    TruckModal truckModal = TruckModal(
      truckId: docId,
      registrationNumber: registrationController.text,
      supplierName: supplierName,
      supplierId: supplierId,
      createAt: DateTime.now(),
      balance: 0,
      createBy: user!.uid,
    );
    update();
    return truckModal.toJson();
  }

  void truckCreateFunction() {
    DocumentReference doc = fireStore.doc();
    fireStore.doc(doc.id).set(createTruck(doc.id)).then((value) {
      Utils().toastMessage("success");
      isLoading.value = true;
      getTruckData();
      Get.back();
      update();
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      isLoading.value = true;

      update();
    });
  }

  TruckModal truckModalSingleData = TruckModal();
  void getSingleData(String id) {
    FirebaseFirestore.instance.collection("Trucks").doc(id).get().then((value) {
      truckModalSingleData = TruckModal.fromJson(value.data());

      update();
      return truckModalSingleData;
    });
  }

  TruckModal truckModal = TruckModal();
  final truckList = <TruckModal>[];
  RxBool isTruckListDataLoading = false.obs;
  Future<void> getTruckData() async {
    var user = auth.currentUser;
    QuerySnapshot list = await FirebaseFirestore.instance.collection("Trucks").where("createBy", isEqualTo: user!.uid).get();
    truckList.clear();

    for (var subTruck in list.docs) {
      Object? map = subTruck.data();
      truckModal = TruckModal.fromJson(map as Map<String, dynamic>?);
      truckList.add(truckModal);
    }
    print("truck id");
    print(truckModal.truckId);
    isTruckListDataLoading.value = true;
    update();
  }

  DateTime? dropdownValueReminderDates;
  selectDates(BuildContext context, int index) async {
    DateTime? selectDate;
    await DatePicker.showDatePicker(context, showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
      selectDate = date;
      update();
    }, currentTime: DateTime.now());
    if (selectDate != null) {
      if (index == 0) {
        dropdownValueReminderDates = selectDate!;
        update();
      }
      // update();
    }
  }

  XFile? image;
  XFile? updateImage;
  final ImagePicker picker = ImagePicker();
  getImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);

    update();
    print("image ${image}");
  }

  // todo Diesel functions
  final amountController = TextEditingController();
  final pumpNameController = TextEditingController();
  final kmController = TextEditingController();
  final fuelQuantityController = TextEditingController();
  final rateLiterController = TextEditingController();

  Map<String, dynamic> createDieselExpense(String docId) {
    var user = auth.currentUser;
    DieselModal dieselModal = DieselModal(
        rateOper: rateLiterController.text,
        pumpName: pumpNameController.text,
        fuelQty: fuelQuantityController.text,
        expenseType: "fuelExpense",
        date: dropdownValueReminderDates,
        currentKm: kmController.text,
        image: "",
        createAt: DateTime.now(),
        truckId: truckModal.truckId,
        amount: amountController.text,
        createBy: user!.uid,
        dieselId: docId,
        paymentMethod: "cash");
    update();
    return dieselModal.toJson();
  }

  void createDieselFunction() {
    DocumentReference doc = fireStore.doc();
    fireStore.doc(truckModalSingleData.truckId).collection("DieselExpenses").doc(doc.id).set(createDieselExpense(doc.id)).then((value) {
      Utils().toastMessage("success");
      update();
    }).onError((error, stackTrace) {
      print(error.toString());
      Utils().toastMessage(error.toString());
      update();
    });
  }

  final dieselList = <DieselModal>[];

  Future<void> getDieselData() async {
    QuerySnapshot list = await fireStore.doc(truckModalSingleData.truckId).collection("DieselExpenses").get();
    dieselList.clear();
    for (var subDieselList in list.docs) {
      Map<String, dynamic>? map = subDieselList.data() as Map<String, dynamic>?;
      DieselModal dieselModals = DieselModal.fromJson(map);
      print("list");
      print(dieselModals.amount);
      dieselList.add(dieselModals);
      update();
    }

    update();
  }

  //todo for diesel
  // void dieselCreateFunction() {
  //   DocumentReference doc = fireStore.doc();
  //   fireStore.doc(truckModal.truckId).collection("DieselExpenses").doc(doc.id).set(createTruck(doc.id)).then((value) {
  //     Utils().toastMessage("success");
  //     isLoading.value = true;
  //     Get.back();
  //     update();
  //   }).onError((error, stackTrace) {
  //     Utils().toastMessage(error.toString());
  //     isLoading.value = true;
  //
  //     update();
  //   });
  // }
}
