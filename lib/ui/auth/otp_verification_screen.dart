import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetransbook/ui/auth/user_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../constants.dart';
import '../../controllers/auth_controllers/auth_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/size_config.dart';
import '../home_screen/home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key, this.verificationId}) : super(key: key);
  AuthControllers authControllers = Get.put(AuthControllers());
  FocusNode myFocusNode = FocusNode();
  String? verificationId;
  final fireStore = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    authControllers.verificationIds = verificationId;
    //30, 60, 87, 1
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    return Scaffold(
      bottomNavigationBar: otpButton(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
              length: 6,
              errorText: "",
              controller: authControllers.otpController,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme,
              focusNode: myFocusNode,
              onCompleted: (enteredOTP) async {
                // verifyOTP();
                await Future.delayed(Duration(seconds: 2), () {});
              },
            ),
          ],
        ),
      ),
    );
  }

  final auth = FirebaseAuth.instance;
  Widget otpButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(Dimens.size20), vertical: getHeight(Dimens.size20)),
      child: GetBuilder<AuthControllers>(builder: (authController) {
        return GestureDetector(
          onTap: () {
            authControllers.isOtpVerifyLoading.value = !authControllers.isOtpVerifyLoading.value;
            final credentials = PhoneAuthProvider.credential(verificationId: verificationId.toString(), smsCode: authControllers.otpController.text);

            authControllers.isRegistrationLoading.value = true;
            try {
              auth.signInWithCredential(credentials).then((value) async {
                String? uid = value.user?.uid;
                print("this is uid");
                //  await storage.write(key: "uid", value: value.user?.uid);
                print(uid);
                if (uid != null) {
                  DocumentSnapshot data = await FirebaseFirestore.instance.collection('users').doc(uid).get();

                  if (data.exists) {
                    Get.to(HomScreen());
                  } else {
                    print("going to registration");
                    Get.to(UserRegistrationScreen());
                  }
                } else {
                  print("SomeThing went wrong please try again later");
                }
                // Get.to(UserRegistrationScreen());
              }).onError((error, stackTrace) {
                print(error.toString());
              });
            } catch (e) {
              print(e);
              // authControllers.isOtpVerifyLoading.value = true;
            }
            // authControllers.loginFunction();
            authControllers.update();
          },
          child: Container(
            alignment: Alignment.center,
            width: getWidth(Dimens.size320),
            height: getHeight(Dimens.size50),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.blue1),
            child: authControllers.isOtpVerifyLoading.value
                ? Text(
                    "Confirm",
                    style: TextStyles.white16PtMediumWeightTextStyle,
                  )
                : Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
