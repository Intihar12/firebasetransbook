import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetransbook/controllers/supplier_controller/supplier_controller.dart';
import 'package:firebasetransbook/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants.dart';

import '../../controllers/country_code_controller/country_code_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';

import '../../values/size_config.dart';
import '../../widgets/county_code_widget.dart';

class SupplierDetailsScreen extends StatelessWidget {
  SupplierDetailsScreen({Key? key, this.id}) : super(key: key);

  int? id;
  final controller = Get.put(SupplierController());
  final _formKey = GlobalKey<FormState>();
  bool isMobileNumberValid = false;
  Timer? debounce;
  final fireStore = FirebaseFirestore.instance.collection("Suppliers");
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<SupplierController>(builder: (controller) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: MyColors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: MyColors.white,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset(
                  MyImgs.arrowBack,
                  width: getWidth(
                    Dimens.size24,
                  ),
                  height: getHeight(Dimens.size16),
                  color: MyColors.blue1,
                )),
            titleSpacing: 0,
            title: Text(
              "${controller.createSupplierModal.supplierName}",
              style: TextStyles.blackMediumWeight18PtTextStyle,
            ),
            actions: [
              PopupMenuButton<int>(
                icon: Icon(
                  Icons.more_horiz,
                  color: MyColors.blue1,
                ),
                itemBuilder: (context) => [
                  // PopupMenuItem 1
                  PopupMenuItem(
                    value: 1,
                    // row with 2 children
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(color: MyColors.white),
                        )
                      ],
                    ),
                  ),
                  // PopupMenuItem 2
                  PopupMenuItem(
                    value: 2,
                    // row with two children
                    child: Row(
                      children: [
                        Icon(Icons.update),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Update",
                          style: TextStyle(color: MyColors.white),
                        )
                      ],
                    ),
                  ),
                ],
                offset: Offset(0, 40),
                color: Colors.blue,
                elevation: 2,
                // on selected we show the dialog box
                onSelected: (value) {
                  // if value 1 show dialog
                  if (value == 1) {
                    deleteSupplierBottomSheet(context);
                    // controller.buttonLoading.value = true;
                  } else if (value == 2) {
                    // controller.buttonLoading.value = true;
                    //
                    controller.isUpdateLoading.value = true;
                    UpdateSupplierBottomSheet(context);
                    // _showDialog(context);
                  }
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "supplierBalance",
                        style: TextStyles.black1PtTextStyle,
                      ),
                      Text("currencySymbol" + "${controller.createSupplierModal.balance}", style: TextStyles.black17PtTextStyle)
                    ],
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: getWidth(Dimens.size250),
                            child: TextField(
                              //  controller: tripController.searchControlle,
                              cursorColor: MyColors.grey3,
                              style: TextStyles.black1PtLessWeightTextStyle,
                              onChanged: (value) {
                                // if (debounce?.isActive ?? false) debounce?.cancel();
                                // debounce = Timer(const Duration(milliseconds: 200), () {
                                //   if (tripController.searchControlle.text.isNotEmpty) {
                                //     tripController.searchTripFunction(value);
                                //   } else {
                                //     tripController.supplierTripList(id);
                                //   }
                                // });
                              },
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.grey3),
                                ),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                prefixIconConstraints: BoxConstraints(
                                  minWidth: 25,
                                  minHeight: 25,
                                ),
                                border: UnderlineInputBorder(),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ), // icon is 48px widget.
                                ),
                                hintText: 'searchtrip',
                              ),
                            ),
                          ),
                          InkWell(
                            highlightColor: MyColors.white,
                            onTap: () {
                              // tripController.isSelectFilter.value = true;
                              // filterBottomSheet(context);
                              // tripController.isFilterLoading.value = true;
                              // tripController.update();
                            },
                            child: Text(
                              "filters",
                              style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size10),
                  )
                ],
              ),
            ),
          ));
    });
  }

  void UpdateSupplierBottomSheet(context) {
    // Api api = Api();
    SizeConfig().init(context);

    String? chooseCode;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        isScrollControlled: true,
        //backgroundColor: Colors.black12,
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),

              //height: getHeight(Dimens.size348),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: getHeight(Dimens.size6),
                          width: getWidth(Dimens.size30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: MyColors.blue1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size26),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "updateSupplier",
                            style: TextStyles.whiteLessWeight2050PtTextStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              "cancel",
                              style: TextStyles.redLessWeight14PtTextStyle,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size30),
                      ),
                      Text(
                        "supplierstruckowner",
                        style: TextStyles.black1LessWeight12PtTextStyle,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "pleaseEnterNmae";
                          } else if (value.length < 3) {
                            return "mustbe3latters";
                          }
                        },
                        //readOnly: controller.isEdit.value,
                        controller: controller.nameController,
                        cursorColor: MyColors.grey3,
                        //  style: TextStyles.black1LessWeight12PtTextStyle,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.grey3),
                          ),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                          hintText: "hinttext",
                          hintStyle: TextStyles.blackLessWeight14PtTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size14),
                      ),
                      Text("phoneoptional"),
                      SizedBox(
                        height: getHeight(Dimens.size10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetBuilder<CountryController>(builder: (countryCodController) {
                                  //  codeNum = countryCodController.selectedValue?.name;
                                  controller.countryCode = countryControllerSup.selectedValueCountry?.name.toString();
                                  print("this is code");
                                  print(controller.countryCode);
                                  return Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          var data = await countryCodeBottomSheet(context);
                                          if (data != null) {
                                            countryCodController.selectedValueCountry = data;
                                          }
                                          countryCodController.update();
                                          // driverController.update();
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              countryCodController.selectedValueCountry?.flag != null
                                                  ? countryCodController.selectedValueCountry!.flag.toString()
                                                  : "yuy",
                                              width: getHeight(Dimens.size16),
                                              height: getHeight(Dimens.size16),
                                            ),
                                            SizedBox(
                                              width: getWidth(Dimens.size8),
                                            ),
                                            Text(
                                                countryCodController.selectedValueCountry?.name != null
                                                    ? countryCodController.selectedValueCountry!.name.toString()
                                                    : "",
                                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle),
                                            Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: MyColors.blue1,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                                SizedBox(
                                  height: 12,
                                  width: getWidth(Dimens.size70),
                                  child: Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: MyColors.grey3,
                                  ),
                                ),
                                controller.phoneController.text.isNotEmpty && controller.countryCode == null
                                    ? Text(
                                        chooseCode != null ? "${chooseCode}" : "",
                                        style: TextStyles.red1LessWeight14PtTextStyle,
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          SizedBox(
                            width: getWidth(Dimens.size230),
                            child: TextFormField(
                              controller: controller.phoneController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(11),
                              ],
                              //controller: mobileNumberController,
                              maxLines: 1,
                              onChanged: (str) {
                                if (str.isNotEmpty) {
                                  controller.isMobileNumberValid = true;
                                  controller.update();
                                } else {
                                  controller.isMobileNumberValid = false;
                                  controller.update();
                                }
                              },
                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,

                              cursorColor: MyColors.black1,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.grey3),
                                ),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                contentPadding: EdgeInsets.fromLTRB(2, 13, 8, 1),
                                hintText: "enterPhoneNumber",
                                filled: false,
                                hintStyle: TextStyles.hintNormalTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size57),
                      ),
                      GetBuilder<SupplierController>(builder: (controllersub) {
                        return GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                if (controller.phoneController.text.isNotEmpty && controller.countryCode == null) {
                                  chooseCode = "chooseCode";
                                  controller.update();
                                } else {
                                  controller.isUpdateLoading.value = !controller.isUpdateLoading.value;

                                  fireStore
                                      .doc(controller.createSupplierModal.supplierId)
                                      .update(controller.updateSupplier(controller.createSupplierModal.supplierId))
                                      .then((value) {
                                    controller.isUpdateLoading.value = true;
                                    Utils().toastMessage("successfully update");
                                    Get.back();
                                    controller.update();
                                  }).onError((error, stackTrace) {
                                    Utils().toastMessage(error.toString());
                                    controller.isUpdateLoading.value = true;
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
                                  borderRadius: BorderRadius.circular(100),
                                  color: MyColors.blue1,
                                ),
                                child: controller.isUpdateLoading.value
                                    ? Center(
                                        child: Text(
                                        "update",
                                        style: TextStyles.white1PtMediumWeightTextStyle,
                                      )
                                        //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),

                                        )
                                    : Center(
                                        child: CircularProgressIndicator(color: MyColors.white, strokeWidth: 3),
                                      )));
                      })
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void deleteSupplierBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        isScrollControlled: true,
        //backgroundColor: Colors.black12,
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 20),

              //height: getHeight(Dimens.size348),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: getHeight(Dimens.size6),
                        width: getWidth(Dimens.size30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(Dimens.size26),
                    ),
                    Text("areyousure"),
                    SizedBox(
                      height: getHeight(Dimens.size20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(
                                "cancel",
                                style: TextStyle(color: MyColors.red1),
                              )),
                          GetBuilder<SupplierController>(builder: (controllerss) {
                            return GestureDetector(
                                onTap: () {
                                  Get.back();
                                  // controllerss.deleteSuppliersFunctions(controllerss.showSupplierListModal.data!.id);
                                  // controllerss.buttonLoading.value = !controllerss.buttonLoading.value;

                                  controller.update();
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    alignment: Alignment.center,
                                    height: getHeight(Dimens.size40),
                                    // width: getWidth(Dimens.size70),
                                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                                    child: Text(
                                      "confrim",
                                      style: TextStyle(color: MyColors.white),
                                    )));
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
