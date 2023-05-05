import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants.dart';

import '../controllers/client_controller/client_controller.dart';
import '../controllers/country_code_controller/country_code_controller.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import '../values/size_config.dart';

import 'county_code_widget.dart';

void createClientBottomSheet(context) {
  ClientController clientController = Get.find();
  //final controller = Get.put(ClientController());
  final _formKey = GlobalKey<FormState>();
  final countryControllers = Get.put(CountryController());

  SizeConfig().init(context);
  clientController.countryCode = countryControllers.selectedValue?.name.toString();
  clientController.phoneController.clear();
  clientController.nameController.clear();
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      isScrollControlled: true,
      //backgroundColor: Colors.black12,
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(Dimens.size20), vertical: getHeight(Dimens.size20)),
            child: Container(
              // padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom > 50
                      ? MediaQuery.of(context).viewInsets.bottom - 50
                      : MediaQuery.of(context).viewInsets.bottom),
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
                          Text("Create Client", style: TextStyles.whiteLessWeight2050PtTextStyle),
                          InkWell(
                            onTap: () {
                              // Get.back();
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
                      Text(
                        "Client Name",
                        style: TextStyles.black1LessWeight12PtTextStyle,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "pleaseEnterName";
                          } else if (value.length < 3) {
                            return "mustbe3latters";
                          }
                        },
                        controller: clientController.nameController,
                        cursorColor: MyColors.grey3,
                        style: TextStyles.black1PtLessWeightTextStyle,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.grey3),
                          ),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                          hintText: "enterClientName",
                          hintStyle: TextStyles.black1LessWeight12PtTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size14),
                      ),
                      Text("phoneoptional"),
                      // SizedBox(
                      //   height: getHeight(Dimens.size20),
                      // ),
                      Row(
                        //  mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 24),
                            child: Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetBuilder<CountryController>(builder: (countryCodController) {
                                  //  codeNum = countryCodController.selectedValue?.name;
                                  clientController.countryCode = countryControllerClient.selectedValueCountry?.name.toString();
                                  print("this is code");
                                  print(clientController.countryCode);
                                  return Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          var data = await countryCodeBottomSheet(context);
                                          if (data != null) {
                                            countryControllerClient.selectedValueCountry = data;
                                          }
                                          countryCodController.update();
                                          // driverController.update();
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              countryControllerClient.selectedValueCountry!.flag.toString(),
                                              width: getHeight(Dimens.size16),
                                              height: getHeight(Dimens.size16),
                                            ),
                                            SizedBox(
                                              width: getWidth(Dimens.size8),
                                            ),
                                            Text(countryControllerClient.selectedValueCountry!.name.toString(),
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
                                  height: 24,
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
                            width: getWidth(Dimens.size20),
                          ),
                          SizedBox(
                            width: getWidth(Dimens.size230),
                            child: TextFormField(
                              controller: clientController.phoneController,

                              keyboardType: TextInputType.phone,

                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(11),
                              ],
                              //controller: mobileNumberController,
                              maxLines: 1,
                              onChanged: (str) {
                                if (str.isNotEmpty) {
                                  // setState(() {
                                  //   isMobileNumberValid = true;
                                  // });
                                } else {
                                  // setState(() {
                                  //   isMobileNumberValid = false;
                                  // });
                                }
                              },
                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,

                              cursorColor: MyColors.grey3,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.grey3),
                                ),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                //   contentPadding: EdgeInsets.fromLTRB(2, 13, 8, 12),
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
                      GetBuilder<ClientController>(builder: (controller) {
                        return GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                controller.isCreateClientLoading.value = !controller.isCreateClientLoading.value;

                                controller.createClientFunction();
                                clientController.update();
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
                                child: controller.isCreateClientLoading.value
                                    ? Center(
                                        child: Text(
                                        "confrim",
                                        style: TextStyles.white1PtMediumWeightTextStyle,
                                      )
                                        //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),

                                        )
                                    : Center(
                                        child: CircularProgressIndicator(color: MyColors.white, strokeWidth: 3),
                                      )));
                      }),
                      SizedBox(
                        height: getHeight(Dimens.size20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
