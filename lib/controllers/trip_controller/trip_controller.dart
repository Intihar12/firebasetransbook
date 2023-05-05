import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetransbook/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../modals/radio_modal/radio_modal.dart';
import '../../modals/trip_modals/trip_modal.dart';

class TripController extends GetxController {
  bool clientData = true;
  String? clientName;
  String? truckName;
  String? supplierId;
  String? driverName;
  String? supplierName;
  String? localOrigin;
  String? localDistination;
  String? clientBillinType;
  RadioModel? supplierBilling;
  int fixed = 1;
  int addDetails = 1;
  RxBool isFixed = false.obs;
  RxBool isAddDetails = false.obs;
  RxBool isCreateTripLoading = false.obs;
  RadioModel? clientBillingText;
  RadioModel? tempClientBilling;

  RadioModel? supplierBillingText;
  String? updateClientBilling;
  String? updateSupplierBilling;
  String? updateSupplierBillingText;
  String? updateClientBillingText;
  List<RadioModel> billingType = <RadioModel>[];
  final partyAmountController = TextEditingController();
  final startKmController = TextEditingController();
  final noteController = TextEditingController();
  final supplierAmountController = TextEditingController();
  final supplierRateController = TextEditingController();
  final clientBillingTexts = TextEditingController();
  final supplierBillingTexts = TextEditingController();
  final totalRateController = TextEditingController();
  final rateController = TextEditingController();
  final supplierTotalRateController = TextEditingController();
  String? selectStartDateTrip;
  var totalAmount = 0;
  void totalAmountFunction() {
    int rate = int.parse(rateController.text);
    int totalRate = int.parse(totalRateController.text);
    totalAmount = rate * totalRate;
    partyAmountController.text = totalAmount.toString();
    update();
    print("total amount ${partyAmountController.text}");
  }

  var supplierTotalAmount = 0;
  void SupplierTotalAmountFunction() {
    int supplierRate = int.parse(supplierRateController.text);
    int supplierTotalRate = int.parse(supplierTotalRateController.text);
    supplierTotalAmount = supplierRate * supplierTotalRate;
    supplierAmountController.text = supplierTotalAmount != null ? supplierTotalAmount.toString() : "";
    update();
    print("total amount ${supplierAmountController.text}");
  }

  selectDates(BuildContext context, int index) async {
    DateTime? selectDate;
    await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onChanged: (date) {},
      onConfirm: (date) {
        selectDate = date;
        update();
      },
      currentTime: DateTime.now(),
      minTime: DateTime.now(),
    );
    if (selectDate != null) {
      if (index == 0) {
        selectStartDateTrip = DateFormat('yyyy-MM-dd').format(selectDate!);
        update();
      }
      // update();
    }
  }

  final tripModal = TripModal();
  final fireStore = FirebaseFirestore.instance.collection("Trips");
  final auth = FirebaseAuth.instance;

  Map<String, dynamic> tripCreateFunction(String tripId) {
    var user = auth.currentUser;
    TripModal tripModal = TripModal(
      clientName: clientName,
      truckNumber: truckName,
      driverName: driverName,
      supplierName: supplierName,
      origin: "naltar",
      destination: "gilgit",
      clientBillingType: clientBillingText?.text.toString(),
      supplierBillingType: "",
      tripId: tripId,
      createBy: user!.uid,
    );
    return tripModal.toJson();
  }

  void tripCreateButton() {
    DocumentReference doc = fireStore.doc();
    fireStore
        .doc(doc.id)
        .set(tripCreateFunction(doc.id))
        .then((value) => {Utils().toastMessage("Success"), isCreateTripLoading.value = true, update()});
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    billingType.add(new RadioModel(false, 'A', 'per_km'));
    billingType.add(new RadioModel(false, 'B', 'per_trip'));
    billingType.add(new RadioModel(false, 'C', 'per_day'));
    billingType.add(new RadioModel(false, 'D', 'per_hour'));
    //billingType.add(new RadioModel(false, 'D', 'per_trip'));
    billingType.add(new RadioModel(false, 'D', 'per_bag'));
    billingType.add(new RadioModel(false, 'D', 'fixed'));
    billingType.add(new RadioModel(false, 'D', 'per_tonne'));
    billingType.add(new RadioModel(false, 'D', ' per_kg'));

    supplierBillingText = billingType[5];
    updateClientBillingText = billingType[5].toString();
    updateSupplierBillingText = billingType.toString();
    clientBillingText = billingType[5];
  }
}
