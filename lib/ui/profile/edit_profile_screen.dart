import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebasetransbook/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../controllers/auth_controllers/auth_controller.dart';
import '../../controllers/profile_controller/profile_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';
import '../../values/size_config.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController());
  final authController = Get.put(AuthControllers());
  // final countryController = Get.put(CountryController());
  final fireStore = FirebaseFirestore.instance.collection("users");
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: MyColors.white,
        appBar: controller.isEditScreen.value
            ? AppBar(
                backgroundColor: MyColors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          //Get.back();
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          MyImgs.arrowBack,
                          width: getWidth(
                            Dimens.size24,
                          ),
                          height: getHeight(Dimens.size16),
                        )),
                    SizedBox(
                      width: getWidth(Dimens.size28),
                    ),
                    Text(
                      "editProfile",
                      style: TextStyles.blackMediumWeight18PtTextStyle,
                    ),
                  ],
                ),
              )
            : null,
        body: controller.isEditScreen.value
            ? Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(Dimens.size20), vertical: getHeight(Dimens.size20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.imagefile != null
                            ? Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: getWidth(Dimens.size65),

                                  backgroundImage: FileImage(File(controller.imagefile!.path)), //Text
                                ),
                              )
                            : Center(
                                child: controller.img != null
                                    ? Center(
                                        child: CircleAvatar(
                                          backgroundColor: MyColors.grey200,
                                          radius: getWidth(Dimens.size65),
                                          backgroundImage: NetworkImage(controller.img!),
                                          // CachedNetworkImageProvider(
                                          //   controller.img!,
                                          //   // authController.userBusinessInfoModal.image.toString(),
                                          // ),
                                        ),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: getWidth(Dimens.size65),

                                        backgroundImage: ExactAssetImage(MyImgs.profileImg), //Text
                                      ),
                              ),

                        SizedBox(
                          height: getHeight(Dimens.size12),
                        ),

                        GestureDetector(
                          onTap: () {
                            controller.getImage();
                            controller.update();
                          },
                          child: Center(
                            child: Text(
                              "changeLogo",
                              style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getHeight(Dimens.size30),
                        ),

                        Text(
                          "userName",
                          style: TextStyles.veryDarkGrey12400PtTextStyle,
                        ),
                        TextFormField(
                          controller: controller.nameController,
                          style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: MyColors.black1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "pleaseEnterYourName";
                            } else if (value.length < 3) {
                              return "mustbe3latters";
                            }
                          },
                          decoration: InputDecoration(

                              // focusedBorder: UnderlineInputBorder(),

                              hintText: 'userName',
                              hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                        ),

                        SizedBox(
                          height: getHeight(Dimens.size14),
                        ),
                        Text(
                          "businessName",
                          style: TextStyles.veryDarkGrey12400PtTextStyle,
                        ),
                        TextFormField(
                          controller: controller.businessController,
                          style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: MyColors.black1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "pleaseEnterYourBusinessName";
                            } else if (value.length < 3) {
                              return "mustbe3latters";
                            }
                          },
                          decoration: InputDecoration(

                              // focusedBorder: UnderlineInputBorder(),

                              hintText: 'businessName',
                              hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                        ),
                        SizedBox(
                          height: getHeight(Dimens.size14),
                        ),
                        Text(
                          "city",
                          style: TextStyles.veryDarkGrey12400PtTextStyle,
                        ),
                        TextFormField(
                          controller: controller.cityController,
                          style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                          keyboardType: TextInputType.text,
                          cursorColor: MyColors.black1,
                          decoration: InputDecoration(

                              // focusedBorder: UnderlineInputBorder(),

                              hintText: 'city',
                              hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                        ),
                        SizedBox(
                          height: getHeight(Dimens.size14),
                        ),
                        Text(
                          "addressline",
                          style: TextStyles.veryDarkGrey12400PtTextStyle,
                        ),
                        TextFormField(
                          controller: controller.addressLine1Controller,
                          style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                          keyboardType: TextInputType.text,
                          cursorColor: MyColors.black1,
                          decoration: InputDecoration(

                              // focusedBorder: UnderlineInputBorder(),

                              hintText: 'enterAddress',
                              hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                        ),

                        SizedBox(
                          height: getHeight(Dimens.size14),
                        ),
                        Text(
                          "assressline2",
                          style: TextStyles.veryDarkGrey12400PtTextStyle,
                        ),
                        TextFormField(
                          controller: controller.addressLine2Controller,
                          style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                          keyboardType: TextInputType.text,
                          cursorColor: MyColors.black1,
                          decoration: InputDecoration(

                              // focusedBorder: UnderlineInputBorder(),

                              hintText: 'enterAddress2',
                              hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                        ),

                        // SizedBox(
                        //   height: getHeight(Dimens.size14),
                        // ),
                        // Text(
                        //   easy.tr("state"),
                        //   style: TextStyles.veryDarkGrey12400PtTextStyle,
                        // ),
                        // TextFormField(
                        //   //   controller: controller.stateController,
                        //   style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                        //
                        //   keyboardType: TextInputType.text,
                        //
                        //   cursorColor: MyColors.black1,
                        //   decoration: InputDecoration(
                        //
                        //       // focusedBorder: UnderlineInputBorder(),
                        //
                        //       hintText: easy.tr('enterState'),
                        //       hintStyle:
                        //           TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                        // ),
                        SizedBox(
                          height: getHeight(Dimens.size14),
                        ),

                        // SelectState(
                        //
                        //   onCountryChanged: (value) {
                        //       countryValue = value;
                        //
                        //   },
                        //   onStateChanged:(value) {
                        //
                        //       stateValue = value;
                        //
                        //   },
                        //   onCityChanged:(value) {
                        //
                        //       cityValue = value;
                        //   },
                        // ),

                        Text(
                          "pincode",
                          style: TextStyles.veryDarkGrey12400PtTextStyle,
                        ),
                        TextFormField(
                          controller: controller.pinCodeController,
                          style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: MyColors.black1,
                          decoration: InputDecoration(

                              // focusedBorder: UnderlineInputBorder(),

                              hintText: "enterPincode",
                              hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                        ),

                        SizedBox(
                          height: getHeight(Dimens.size30),
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
                            controller.radioFunction(0);
                          },
                          child: Container(
                            color: Colors.transparent,
                            width: getWidth(Dimens.size210),
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                  groupValue: controller.b,
                                  value: 0,
                                  activeColor: AppColors.mainColor,
                                  onChanged: (int? v) {
                                    controller.radioFunction(v!);
                                    controller.update();
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
                            controller.radioFunction(1);
                          },
                          child: Container(
                            color: Colors.transparent,
                            width: getWidth(Dimens.size150),
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  //   materialTapTargetSize:
                                  //       MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    //vertical: VisualDensity.minimumDensity
                                  ),
                                  groupValue: controller.b,
                                  value: 1,
                                  activeColor: AppColors.mainColor,
                                  onChanged: (int? v) {
                                    controller.radioFunction(v!);
                                    controller.update();
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
                            controller.radioFunction(2);
                          },
                          child: Container(
                            color: Colors.transparent,
                            width: getWidth(Dimens.size100),
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
                                  groupValue: controller.b,
                                  value: 2,
                                  activeColor: AppColors.mainColor,
                                  onChanged: (int? v) {
                                    controller.radioFunction(v!);
                                    controller.update();
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
                        SizedBox(
                          height: getHeight(Dimens.size33),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              // controller.updateProfileButton();
                              controller.isUpdateProfileLoading.value = !controller.isUpdateProfileLoading.value;

                              Reference ref = FirebaseStorage.instance.ref("/imageFolder");
                              UploadTask uploadeImage = ref.putFile(File(controller.imagefile!.path));
                              if (controller.imagefile != null) {
                                Future.value(uploadeImage).then((value) async {
                                  controller.imageUrl = await ref.getDownloadURL();
                                  fireStore
                                      .doc(authController.userBusinessInfoModal.phoneNum)
                                      .update(controller.updateUserBusinessInfoFunction())
                                      .then((value) {
                                    Utils().toastMessage("success update");
                                    controller.isUpdateProfileLoading.value = true;
                                    controller.update();
                                  }).onError((error, stackTrace) {
                                    Utils().toastMessage(error.toString());
                                    controller.isUpdateProfileLoading.value = true;

                                    controller.update();
                                  });
                                });
                              } else {
                                fireStore
                                    .doc(authController.userBusinessInfoModal.phoneNum)
                                    .update(controller.updateUserBusinessInfoFunction())
                                    .then((value) {
                                  Utils().toastMessage("success update");
                                  controller.isUpdateProfileLoading.value = true;
                                  controller.update();
                                }).onError((error, stackTrace) {
                                  Utils().toastMessage(error.toString());
                                  controller.isUpdateProfileLoading.value = true;

                                  controller.update();
                                });
                                controller.update();
                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: getHeight(Dimens.size50),
                            width: getWidth(Dimens.size320),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100), color: MyColors.blue1, border: Border.all(color: MyColors.blue1, width: 2)),
                            child: controller.isUpdateProfileLoading.value
                                ? Text(
                                    "save",
                                    style: TextStyles.white1PtMediumWeightTextStyle,
                                  )
                                : Center(
                                    child: CircularProgressIndicator(color: MyColors.white, strokeWidth: 3),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}
