import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants.dart';

import '../controllers/country_code_controller/country_code_controller.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import '../values/my_imgs.dart';
import '../values/size_config.dart';

Future countryCodeBottomSheet(context) async {
  final _formKey = GlobalKey<FormState>();
  // final controller = Get.put(DriverController());
  //DriverController driverController = Get.find();

  final countryControllers = Get.put(CountryController());

  // driverController.amountController.clear();
  SizeConfig().init(context);

  // driverController.codeNum = countryControllers.selectedValue?.name.toString();
  // print("codenum");
  // print(driverController.codeNum);

  await showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      isScrollControlled: true,
      //backgroundColor: Colors.black12,
      context: context,
      builder: (BuildContext bc) {
        return GetBuilder<CountryController>(builder: (countryControllers) {
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
                          Text("Set country", style: TextStyles.whiteLessWeight2050PtTextStyle),
                          InkWell(
                            onTap: () {
                              //  Get.back();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyles.redLessWeight14PtTextStyle,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size30),
                      ),
                      ListView.builder(
                          itemCount: countryControllers.countryLists.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                countryControllers.selectedValueCountry = countryControllers.countryLists[index];
                                //countryController.countryData = countryControllers.countryLists[index].flag;
                                Navigator.pop(context, countryControllers.selectedValueCountry);

                                countryControllers.update();
                                // Get.back(result: countryControllers.countryLists[index]);
                              },
                              child: Container(
                                padding: EdgeInsets.only(bottom: getHeight(Dimens.size30)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            countryControllers.countryLists[index].flag.toString(),
                                            width: getWidth(Dimens.size16),
                                            height: getHeight(Dimens.size16),
                                          ),
                                          SizedBox(
                                            width: getWidth(Dimens.size16),
                                          ),
                                          Text(
                                            countryControllers.countryLists[index].countryName.toString(),
                                            style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      MyImgs.arrowForward,
                                      width: getWidth(Dimens.size14),
                                      height: getHeight(Dimens.size10),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      });
  return countryControllers.selectedValueCountry;
}
