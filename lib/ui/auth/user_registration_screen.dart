import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/auth_controllers/auth_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';
import '../../values/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../home_screen/home_screen.dart';
import 'otp_verification_screen.dart';

class UserRegistrationScreen extends StatelessWidget {
  UserRegistrationScreen({Key? key, this.verificationId}) : super(key: key);
  AuthControllers authControllers = Get.put(AuthControllers());
  final fireStore = FirebaseFirestore.instance.collection("users");
  firebase_storage.FirebaseStorage firebaseStorage = firebase_storage.FirebaseStorage.instance;
  String? verificationId;

  bool? isValidate;
  final formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    authControllers.isRegistrationLoading.value = true;
    return GetBuilder<AuthControllers>(builder: (authController) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),

                authControllers.image != null
                    ? Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: getWidth(Dimens.size65),
                          backgroundImage: FileImage(File(authControllers.image!.path)),
                        ),
                      )
                    : Center(
                        child: CircleAvatar(
                          backgroundColor: MyColors.grey200,
                          radius: getWidth(Dimens.size65),

                          //backgroundImage: ExactAssetImage(MyImgs.loginIcon),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                MyImgs.loginIcon,
                                width: getWidth(Dimens.size43),
                                height: getHeight(Dimens.size50),
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size13),
                              ),
                              Image.asset(
                                MyImgs.textIcon,
                                width: getWidth(Dimens.size83),
                                height: getHeight(Dimens.size11),
                              )
                            ],
                          ),
                        ),
                      ),

                SizedBox(
                  height: getHeight(Dimens.size12),
                ),

                GestureDetector(
                  onTap: () {
                    authControllers.getImage();
                    authControllers.update();
                    // getImage();
                  },
                  child: Center(
                    child: Text(
                      "Add Logo",
                      style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(Dimens.size30),
                ),
                // Center(
                //   child: RichText(
                //     text: TextSpan(
                //       text: 'Trans',
                //       style: TextStyles.black30PtHeavyWeightTextStyle,
                //       children: <TextSpan>[
                //         TextSpan(
                //             text: 'Book',
                //             style: TextStyles.blue30PtHeavyWeightTextStyle),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 3,
                // ),
                // Center(
                //   child: Text(
                //     easy.tr("manageYourTransportBusiness"),
                //     style: TextStyles.blackNormalTextStyle,
                //   ),
                // ),
                SizedBox(
                  height: getHeight(Dimens.size40),
                ),
                Text(
                  "userName",
                  style: TextStyles.darkGrey15PtMediumWeightTextStyle,
                ),
                Form(
                  key: formKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: authControllers.nameController,
                          maxLines: 1,
                          style: TextStyles.blackNormalTextStyle,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // ignore: missing_return
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "pleaseEnterYourName";
                            } else if (value.length < 3) {
                              return "mustbe3latters";
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            hintText: "enterYourName",
                            filled: false,
                            hintStyle: TextStyles.hintNormalTextStyle,
                          ),
                          onChanged: (value) {
                            if (authControllers.nameController.text.isNotEmpty && authControllers.businessController.text.isNotEmpty) {
                              isValidate = true;
                            } else {
                              isValidate = false;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size20),
                      ),
                      Text(
                        "businessName",
                        style: TextStyles.darkGrey15PtMediumWeightTextStyle,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: authControllers.businessController,
                          maxLines: 1,
                          style: TextStyles.blackNormalTextStyle,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // ignore: missing_return
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "pleaseEnterYourBusinessName";
                            } else if (value.length < 3) {
                              return "mustbe3latters";
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            hintText: "enterYourBusinessName",
                            filled: false,
                            hintStyle: TextStyles.hintNormalTextStyle,
                          ),
                          onChanged: (value) {
                            if (authControllers.nameController.text.isNotEmpty && authControllers.businessController.text.isNotEmpty) {
                              isValidate = true;
                            } else {
                              isValidate = false;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(Dimens.size20),
                ),
                Text(
                  "myWork",
                  style: TextStyles.darkGrey16PtMediumWeightTextStyle,
                ),
                SizedBox(
                  height: getHeight(Dimens.size22),
                ),
                GestureDetector(
                  onTap: () {
                    authControllers.radioFunction(0);
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: getWidth(Dimens.size250),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                          groupValue: authControllers.b,
                          value: 0,
                          activeColor: AppColors.mainColor,
                          onChanged: (int? v) {
                            authControllers.radioFunction(v!);
                          },
                        ),
                        SizedBox(
                          width: getWidth(Dimens.size12),
                        ),
                        Text(
                          "transportContractor",
                          style: TextStyles.black16PtLessWeightTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(Dimens.size27),
                ),
                GestureDetector(
                  onTap: () {
                    authControllers.radioFunction(1);
                  },
                  child: Container(
                    // color: MyColors.yellow1,
                    color: Colors.transparent,
                    width: getWidth(Dimens.size250),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                          groupValue: authControllers.b,
                          value: 1,
                          activeColor: AppColors.mainColor,
                          onChanged: (int? v) {
                            authControllers.radioFunction(v!);
                          },
                        ),
                        SizedBox(
                          width: getWidth(Dimens.size12),
                        ),
                        Text(
                          "truckOwner",
                          style: TextStyles.black16PtLessWeightTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: getHeight(Dimens.size27),
                ),
                GestureDetector(
                  onTap: () {
                    authControllers.radioFunction(2);
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: getWidth(Dimens.size100),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                          groupValue: authControllers.b,
                          value: 2,
                          activeColor: AppColors.mainColor,
                          onChanged: (int? v) {
                            authControllers.radioFunction(v!);
                          },
                        ),
                        SizedBox(
                          width: getWidth(Dimens.size12),
                        ),
                        Text(
                          "other",
                          style: TextStyles.black16PtLessWeightTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
                  child: SizedBox(
                    height: 43,
                    child: GetBuilder<AuthControllers>(builder: (authController) {
                      return GestureDetector(
                        onTap: () {
                          DocumentReference doc = fireStore.doc();

                          final user = auth.currentUser;
                          if (formKey1.currentState!.validate()) {
                            authControllers.isRegistrationLoading.value = !authControllers.isRegistrationLoading.value;
                            if (authControllers.image != null) {
                              firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref("/imageFolder" + user!.uid);
                              firebase_storage.UploadTask uploadImg = ref.putFile(authControllers.image!.absolute);
                              Future.value(uploadImg).then((value) async {
                                authControllers.imageUrl = await ref.getDownloadURL();
                                fireStore.doc(user.uid).set(authControllers.userBusinessInfoFunction()).then((value) {
                                  authControllers.isRegistrationLoading.value = true;
                                  authControllers.getUserData();
                                  Get.to(HomScreen());
                                }).onError((error, stackTrace) {
                                  authControllers.isRegistrationLoading.value = true;
                                  print(error.toString());
                                });
                              });
                            } else {
                              fireStore.doc(user?.uid).set(authControllers.userBusinessInfoFunction()).then((value) {
                                authControllers.isRegistrationLoading.value = true;
                                authControllers.getUserData();
                                Get.to(HomScreen());
                              }).onError((error, stackTrace) {
                                authControllers.isRegistrationLoading.value = true;
                                authControllers.update();
                                print(error.toString());
                              });
                            }
                            authControllers.update();
                          }
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 43,
                            decoration: BoxDecoration(color: AppColors.mainColor, borderRadius: BorderRadius.circular(25)),
                            child: authControllers.isRegistrationLoading.value
                                ? Center(
                                    child: Text(
                                    "save",
                                    style: TextStyles.white15PtLessWeightTextStyle,
                                  ))
                                : Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: Colors.white,
                                    ),
                                  )),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    ;
  }

  final auth = FirebaseAuth.instance;
}
