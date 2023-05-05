import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebasetransbook/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../modals/auth_modals/user_business_info_modal.dart';
import '../../ui/auth/login_screen.dart';
import '../../ui/auth/otp_verification_screen.dart';
import '../../ui/auth/user_registration_screen.dart';
import '../../ui/home_screen/home_screen.dart';

class AuthControllers extends GetxController {
  String? code;

  final auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final nameController = TextEditingController();
  final businessController = TextEditingController();

  bool? status;
  File? image;
  //String? uid;
  RxBool isOtpVerifyLoading = false.obs;
  UserBusinessInfoModal userBusinessInfoModal = UserBusinessInfoModal();

  ImagePicker imgPick = ImagePicker();
  Future getImage() async {
    final imgs = await imgPick.pickImage(source: ImageSource.gallery);
    if (imgs != null) {
      image = File(imgs.path);
    } else {}
  }

  int b = 0;
  void radioFunction(int a) {
    b = a;
    update();
  }

  void splashFunction() async {
    final user = auth.currentUser;

    if (user != null) {
      getUserData();
      // await getUserData(user.phoneNumber.toString());
      // Timer(Duration(seconds: 2), () => Get.to(HomScreen())); //Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadImagesScreens()));
    } else {
      Timer(Duration(seconds: 2), () => Get.to(LoginScreen()));
    }

    isLoginLoading.value = true;
    update();
  }

  // todo login

  RxBool isLoginLoading = false.obs;
  void loginFunction() async {
    await auth.verifyPhoneNumber(
        phoneNumber: code! + phoneController.text,
        verificationCompleted: (_) {
          isLoginLoading.value = true;

          print("verification complete");
          Utils().toastMessage("verification complete");
          update();
        },
        verificationFailed: (e) {
          isLoginLoading.value = true;
          Utils().toastMessage(e.toString());
          update();
        },
        codeSent: (String verifyCationId, int? token) {
          // verificationIds = verifyCationId;
          isLoginLoading.value = true;
          isOtpVerifyLoading.value = true;
          Get.to(VerificationScreen(
            verificationId: verifyCationId,
          ));
          // Get.to(VerificationScreen(
          //   verificationId: verifyCationId,
          // ));
          Utils().toastMessage("send for verify");
          update();
        },
        codeAutoRetrievalTimeout: (e) {
          isLoginLoading.value = true;
          Utils().toastMessage("send for codeAutoRetrievalTimeout");
        });
  }

  String? verificationIds;
  String? imageUrl;
  RxBool isRegistrationLoading = false.obs;
  Map<String, dynamic> userBusinessInfoFunction() {
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
    );

    return userData.toJson();
  }

  String? avatarText;
  String? userNme;
  Future<UserBusinessInfoModal?> getUserData() async {
    final user = auth.currentUser;

    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((document) {
      userBusinessInfoModal = UserBusinessInfoModal.fromJson(document.data());
      // userBusinessInfoModal = UserBusinessInfoModal.fromJson(documents.);
      userNme = userBusinessInfoModal.name ?? "";
      userBusinessInfoModal.name == null
          ? Timer(Duration(seconds: 2), () => Get.to(UserRegistrationScreen()))
          : Timer(Duration(seconds: 2), () => Get.to(HomScreen()));
      ;

      List<String> nameSubstrings = userNme!.split(' ') ?? [];
      String avatarText1 = nameSubstrings[0].substring(0, 1) ?? '';
      String avatarText2 = '';
      if (nameSubstrings.length > 1) {
        avatarText2 = nameSubstrings[1].substring(0, 1) ?? '';
      }
      avatarText = (avatarText1 + avatarText2).toUpperCase();

      update();
      return userBusinessInfoModal;
    });
    return null;
  }

  // Future<UserBusinessInfoModal> userBusinessInfoFunction(){
  //
  //
  // }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
    // getUserData();
    // splashFunction();
  }
}
