import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../modals/auth_modals/user_business_info_modal.dart';

class ProfileController extends GetxController {
  RxBool isLoadingProfile = false.obs;
  RxBool isUpdateProfileLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  XFile? imagefile;

  getImage() async {
    imagefile = await picker.pickImage(source: ImageSource.gallery);

    update();
    print("image ${imagefile}");
  }

  int b = 0;
  int radioFunction(int a) {
    print("a is" + a.toString());
    b = a;
    update();
    return a;
  }

  String? imageUrl;
  RxBool isRegistrationLoading = false.obs;
  Map<String, dynamic> updateUserBusinessInfoFunction() {
    final user = auth.currentUser;
    isRegistrationLoading.value = true;
    UserBusinessInfoModal userData = UserBusinessInfoModal(
      name: nameController.text,
      businessName: businessController.text,
      image: imageUrl,
      transportContractor: b == 0 ? true : false,
      truckOwner: b == 1 ? true : false,
      other: b == 2 ? true : false,
      uid: user?.uid,
      phoneNum: user?.phoneNumber,
      city: cityController.text,
      addressLine1: addressLine1Controller.text,
      addressLine2: addressLine2Controller.text,
      pinCode: pinCodeController.text,
    );
    update();
    return userData.toJson();
  }

  final auth = FirebaseAuth.instance;
  UserBusinessInfoModal userBusinessInfoModal = UserBusinessInfoModal();
  String? img;
  RxBool isEditScreen = false.obs;
  Future<UserBusinessInfoModal?> getUserData() async {
    final user = auth.currentUser;

    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((document) {
      userBusinessInfoModal = UserBusinessInfoModal.fromJson(document.data());
      // userBusinessInfoModal = UserBusinessInfoModal.fromJson(documents.);
      nameController.text = userBusinessInfoModal.name.toString();
      businessController.text = userBusinessInfoModal.businessName.toString();
      cityController.text = userBusinessInfoModal.city ?? "";
      addressLine1Controller.text = userBusinessInfoModal.addressLine1 ?? "";
      addressLine2Controller.text = userBusinessInfoModal.addressLine2 ?? "";
      pinCodeController.text = userBusinessInfoModal.pinCode ?? "";
      img = userBusinessInfoModal.image.toString();
      b = userBusinessInfoModal.transportContractor == true ? 0 : 1;
      b = userBusinessInfoModal.truckOwner == true ? 1 : 2;
      // b = userBusinessInfoModal.other == true ? 2 : 3;
      print("image");
      print(userBusinessInfoModal.image.toString());
      isEditScreen.value = true;
      update();
      return userBusinessInfoModal;
    });
    return null;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //getUserData();
  }
}
