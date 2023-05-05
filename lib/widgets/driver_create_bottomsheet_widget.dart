import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants.dart';

import '../controllers/country_code_controller/country_code_controller.dart';
import '../controllers/driver_controller/driver_controller.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import '../values/my_imgs.dart';
import '../values/size_config.dart';

import 'county_code_widget.dart';

void driverCreateBottomSheet(context) {
  final _formKey = GlobalKey<FormState>();
  // final controller = Get.put(DriverController());
  DriverController driverController = Get.find();

  final countryControllers = Get.put(CountryController());

  driverController.nameController.clear();
  driverController.phoneController.clear();
  driverController.amountController.clear();
  SizeConfig().init(context);

  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      isScrollControlled: true,
      //backgroundColor: Colors.black12,
      context: context,
      builder: (BuildContext bc) {
        return GetBuilder<DriverController>(builder: (driverController) {
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
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom > 50
                        ? MediaQuery.of(context).viewInsets.bottom - 50
                        : MediaQuery.of(context).viewInsets.bottom),
                //  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                          Text("createDriver", style: TextStyles.whiteLessWeight2050PtTextStyle),
                          InkWell(
                            onTap: () {
                              //  Get.back();
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
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            child: Text(
                              "name",
                              style: TextStyles.black1LessWeight12PtTextStyle,
                            ),
                          ),
                          Positioned(
                            top: -1,
                            right: -8,
                            child: Container(
                              child: Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          )
                        ],
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "pleaseEnterName";
                          } else if (value.length < 3) {
                            return "mustbe3latters";
                          }
                        },
                        controller: driverController.nameController,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              GetBuilder<CountryController>(builder: (countryCodController) {
                                //  codeNum = countryCodController.selectedValue?.name;
                                driverController.codeNum = countryControllers.selectedValueCountry?.name.toString();
                                print("this is code");
                                print(driverController.codeNum);
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
                                height: 10,
                                width: getWidth(Dimens.size70),
                                child: Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: MyColors.grey3,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: getWidth(Dimens.size230),
                            child: TextFormField(
                              controller: driverController.phoneController,
                              keyboardType: TextInputType.phone,
                              //controller: mobileNumberController,
                              maxLines: 1,

                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,

                              inputFormatters: [
                                LengthLimitingTextInputFormatter(11),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              cursorColor: MyColors.grey3,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.grey3),
                                ),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                contentPadding: EdgeInsets.fromLTRB(2, 13, 8, -4),
                                hintText: "enterPhoneNumber",
                                filled: false,
                                hintStyle: TextStyles.hintNormalTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size30),
                      ),

                      SizedBox(
                        height: getHeight(Dimens.size30),
                      ),
                      GestureDetector(
                          onTap: () {
                            driverController.isOpeningBalance.value = !driverController.isOpeningBalance.value;
                            driverController.isOpeningBalance.value = false;
                            driverController.update();
                          },
                          child: driverController.isOpeningBalance.value
                              ? Text(
                                  "addOpeningBalances",
                                  style: TextStyles.blue16textStyle,
                                )
                              : Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "openingBalance",
                                        style: TextStyles.black14500PtHeavyWeightTextStyle,
                                      ),
                                      SizedBox(
                                        height: getHeight(Dimens.size23),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            // color: Colors.yellow,
                                            width: MediaQuery.of(context).size.width / 2.3,
                                            child: ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              horizontalTitleGap: 0,
                                              minLeadingWidth: 0,
                                              title: Text(
                                                "driverHasToPay",
                                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                              ),
                                              leading: SizedBox(
                                                height: 20,
                                                width: 30,
                                                child: Radio<SingingCharacter>(
                                                  // visualDensity: const VisualDensity(
                                                  //     horizontal: VisualDensity.minimumDensity,
                                                  //     vertical: VisualDensity.minimumDensity),
                                                  // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  value: SingingCharacter.driverHasToPay,
                                                  groupValue: driverController.character,
                                                  onChanged: (SingingCharacter? value) {
                                                    driverController.character = value;
                                                    driverController.driverGaveGotBool = true;
                                                    print(driverController.driverGaveGotBool);
                                                    driverController.update();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            //  color: Colors.red,
                                            width: MediaQuery.of(context).size.width / 2.3,

                                            child: ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              horizontalTitleGap: 0,
                                              minLeadingWidth: 10,
                                              title: Text(
                                                "driverHasToGet",
                                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                              ),
                                              leading: SizedBox(
                                                width: 30,
                                                child: Radio<SingingCharacter>(
                                                  value: SingingCharacter.driverHasToGet,
                                                  groupValue: driverController.character,
                                                  onChanged: (SingingCharacter? value) {
                                                    driverController.character = value;
                                                    driverController.driverGaveGotBool = false;
                                                    print(driverController.driverGaveGotBool);
                                                    driverController.update();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),

                                          // Text(easy.tr("driverHasToPay"),style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                          //   Text(easy.tr("driverHasToGet"),style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,)
                                        ],
                                      ),
                                      SizedBox(
                                        height: getHeight(Dimens.size14),
                                      ),
                                      Text(
                                        "amountOptional",
                                        style: TextStyles.black1LessWeight12PtTextStyle,
                                      ),
                                      TextFormField(
                                        controller: driverController.amountController,
                                        cursorColor: MyColors.black1,
                                        keyboardType: TextInputType.number,
                                        //  style: TextStyles.black1LessWeight12PtTextStyle,
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(),
                                            focusedBorder: UnderlineInputBorder(),
                                            hintText: "amount",
                                            hintStyle: TextStyles.black14500PtHeavyWeightTextStyle
                                            // hintStyle: TextStyles
                                            //     .blackLessWeight14PtTextStyle,
                                            ),
                                      ),
                                    ],
                                  ))),
                      // SizedBox(
                      //   height: getHeight(Dimens.size30),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       easy.tr("enableTransactions"),
                      //       style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                      //     ),
                      //     // Switch(
                      //     //   value: controller.status,
                      //     //   onChanged: (value) {
                      //     //     controller.status=value;
                      //     //     // clientModal.shareBank=controller.status;
                      //     //     controller.update();
                      //     //
                      //     //
                      //     //   },
                      //     //   activeColor: Colors.blue,
                      //     //   activeTrackColor: Colors.blue,
                      //     //   inactiveThumbColor: Colors.black45,
                      //     //   inactiveTrackColor: Colors.grey,
                      //     // ),
                      //     // onPressed: ()=>"",
                      //   ],
                      // ),

                      SizedBox(
                        height: getHeight(Dimens.size57),
                      ),
                      GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              driverController.isCreateDriver.value = !driverController.isCreateDriver.value;
                              driverController.createDriverButtonFunction();
                              driverController.update();
                            }

                            driverController.update();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: getHeight(Dimens.size50),
                              width: getWidth(Dimens.size320),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: MyColors.blue1,
                              ),
                              child: driverController.isCreateDriver.value
                                  ? Center(
                                      child: Text(
                                      "confrim",
                                      style: TextStyles.white1PtMediumWeightTextStyle,
                                    )
                                      //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),

                                      )
                                  : Center(
                                      child: CircularProgressIndicator(color: MyColors.white, strokeWidth: 3),
                                    ))),
                      SizedBox(
                        height: getHeight(Dimens.size20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      });
}
