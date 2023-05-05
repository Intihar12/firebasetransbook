import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants.dart';

import '../controllers/country_code_controller/country_code_controller.dart';
import '../controllers/supplier_controller/supplier_controller.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import '../values/size_config.dart';

import 'county_code_widget.dart';

void supplierCreateBottomSheet(context) {
  CountryController countryController = Get.find();
  SupplierController supplierController = Get.put(SupplierController());

  SizeConfig().init(context);
  final _formKey = GlobalKey<FormState>();

  supplierController.countryCode = countryController.selectedValue?.name.toString();
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      isScrollControlled: true,
      //isDismissible: true,
      //isDismissible: false,
      //,
      //backgroundColor: Colors.black12,
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom > 50
                    ? MediaQuery.of(context).viewInsets.bottom - 50
                    : MediaQuery.of(context).viewInsets.bottom),
            // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: GetBuilder<SupplierController>(builder: (controller) {
              return Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),

                // height: getHeight(Dimens.size420),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    //physics: NeverScrollableScrollPhysics(),
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("CreateSupplier", style: TextStyles.whiteLessWeight2050PtTextStyle),
                          InkWell(
                            onTap: () {
                              //Get.back();

                              Navigator.pop(context);
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
                            return "pleaseEnterName";
                          } else if (value.length < 3) {
                            return "mustbe3latters";
                          }
                          return null;
                        },
                        controller: supplierController.nameController,
                        cursorColor: MyColors.grey3,
                        //  style: TextStyles.black1LessWeight12PtTextStyle,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.grey3),
                          ),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                          hintText: "hinttext",
                          hintStyle: TextStyles.black14500PtHeavyWeightTextStyle,
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
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetBuilder<CountryController>(builder: (countryCodController) {
                                  //  codeNum = countryCodController.selectedValue?.name;
                                  controller.countryCode = countryCodController.selectedValueCountry?.name.toString();
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
                                              countryCodController.selectedValueCountry!.flag.toString(),
                                              width: getHeight(Dimens.size16),
                                              height: getHeight(Dimens.size16),
                                            ),
                                            SizedBox(
                                              width: getWidth(Dimens.size8),
                                            ),
                                            Text(countryCodController.selectedValueCountry!.name.toString(),
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
                                  height: 14,
                                  width: getWidth(Dimens.size70),
                                  child: Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: MyColors.grey3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: getWidth(Dimens.size230),
                            child: TextFormField(
                              controller: supplierController.phoneController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(11),
                              ],
                              //controller: mobileNumberController,
                              maxLines: 1,
                              onChanged: (str) {
                                if (str.isNotEmpty) {
                                  supplierController.isMobileNumberValid = true;
                                } else {
                                  supplierController.isMobileNumberValid = false;
                                }
                              },
                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,

                              cursorColor: MyColors.grey3,
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
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            supplierController.supplierfunction();
                            supplierController.update();
                            // controller.buttonLoading.value = !controller.buttonLoading.value;
                            // controller.buttonLoading.value == true ? null : controller.creatSupplierListButton(context);
                            //
                            // controller.buttonLoading.value = false;
                            controller.update();
                          }
                          ;
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: getHeight(Dimens.size50),
                            width: getWidth(Dimens.size320),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
                            child:
                                // controller.buttonLoading.value
                                //     ?
                                Center(
                                    child: Text(
                              "confrim",
                              style: TextStyles.white1PtMediumWeightTextStyle,
                            )
                                    //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),

                                    )
                            // : LoadingCircle()
                            ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size5),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      });
}
