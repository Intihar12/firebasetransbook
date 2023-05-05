import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetransbook/controllers/country_code_controller/country_code_controller.dart';
import 'package:firebasetransbook/modals/client_modal/client_modal.dart';
import 'package:firebasetransbook/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

CountryController countryControllerClient = Get.find();

class ClientController extends GetxController {
  final searchControlle = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  String? countryCode;

  final fireStore = FirebaseFirestore.instance.collection("Clients");

  RxBool isCreateClientLoading = false.obs;
  final auth = FirebaseAuth.instance;
  String? clId;
  void createClientFunction() {
    var user = auth.currentUser;
    DocumentReference doc = fireStore.doc();
    clId = doc.id;
    fireStore.doc(doc.id).set(createClient()).then((value) {
      Utils().toastMessage("success");
      getClientData();
      Get.back();
      isCreateClientLoading.value = true;
      update();
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      isCreateClientLoading.value = true;

      update();
    });
  }

  Map<String, dynamic> createClient() {
    var user = auth.currentUser;
    ClientModal clientModal = ClientModal(
        balance: 0, phoneNum: phoneController.text, clientName: nameController.text, clientId: clId, createBy: user!.uid, createAt: DateTime.now());
    update();
    return clientModal.toJson();
  }

  final clientList = <ClientModal>[];
  bool isClientScreenLoading = false;
  Future<void> getClientData() async {
    var user = auth.currentUser;
    try {
      QuerySnapshot list = await FirebaseFirestore.instance.collection("Clients").where("createBy", isEqualTo: user!.uid).get();

      clientList.clear();
      for (var subList in list.docs) {
        Map<String, dynamic>? modal = subList.data() as Map<String, dynamic>?;
        ClientModal map = ClientModal.fromJson(modal);

        clientList.add(map);
      }
      isClientScreenLoading = true;
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
