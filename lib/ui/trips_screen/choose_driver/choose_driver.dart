import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

import '../../../controllers/driver_controller/driver_controller.dart';
import '../../../values/dimens.dart';
import '../../../values/my_colors.dart';
import '../../../values/my_imgs.dart';
import '../../../values/size_config.dart';

import '../../../widgets/driver_create_bottomsheet_widget.dart';

class ChooseDriver extends StatelessWidget {
  ChooseDriver({Key? key, this.id}) : super(key: key);
  DriverController driverController = Get.find();

  final int? id;
  var avatarText;
  Timer? debounce;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<DriverController>(builder: (controller) {
      return Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
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
                      "choose Driver",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: MyColors.textAppbarcolor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  //   width: getWidth(Dimens.size250),
                  child: TextField(
                    // controller: driverController.searchController,
                    // onChanged: (value) {
                    //   if (debounce?.isActive ?? false) debounce?.cancel();
                    //   debounce = Timer(const Duration(milliseconds: 500), () {
                    //     if (driverController.searchController.text.isNotEmpty) {
                    //       driverController.driverSearchFunction(value);
                    //     } else {
                    //       driverController.driverList();
                    //     }
                    //   });
                    // },
                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(top: 15,),
                        prefixIcon: Container(
                            height: 0,
                            width: 0,
                            padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                            //color: MyColors.yellow,
                            child: Icon(Icons.search)),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 25,
                          minHeight: 25,
                        ),
                        hintText: "searchNameOrNumber",
                        hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                  ),
                ),
                SizedBox(
                  height: getHeight(Dimens.size20),
                ),
                GestureDetector(
                  onTap: () {
                    //driverController.buttonLoading.value = true;
                    driverCreateBottomSheet(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: getHeight(Dimens.size50),
                    width: getWidth(Dimens.size320),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100), border: Border.all(color: MyColors.blue1, width: 2), color: MyColors.white),
                    child: Text(
                      "addDriver",
                      style: TextStyles.blue16textStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(Dimens.size20),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    // itemCount: 2,

                    itemCount: driverController.driverList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      String? amount = driverController.driverList[index].balance.toString();
                      //int balance = int.parse(amount.toString());

                      String name = driverController.driverList[index].driverName ?? '';

                      List<String> nameSubstrings = name.split(' ') ?? [];
                      String avatarText1 = nameSubstrings[0].substring(0, 1) ?? '';
                      String avatarText2 = '';
                      if (nameSubstrings.length > 1) {
                        avatarText2 = nameSubstrings[1].substring(0, 1) ?? '';
                      }
                      avatarText = (avatarText1 + avatarText2).toUpperCase();
                      return InkWell(
                        highlightColor: MyColors.white,
                        onTap: () {
                          driverController.isDriverDetailsLoading.value = false;
                          print("objectlll");
                          print(driverController.driverModal.balance);
                          driverController.driverName = driverController.driverList[index].driverName;
                          driverController.getDriverSingleData(driverController.driverList[index].driverId);
                          Get.back(result: driverController.driverName);
                          print("driver name");
                          print(driverController.driverName);
                          driverController.update();
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: Dimens.size28,
                                          height: Dimens.size28,
                                          decoration: BoxDecoration(color: MyColors.black2, shape: BoxShape.circle),
                                          child: Text(
                                            "${avatarText}",
                                            style: TextStyles.white14500PtLessWeightTextStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimens.size10,
                                        ),
                                        Text(
                                          driverController.driverList[index].driverName.toString(),
                                          style: TextStyles.blackLessWeight14PtTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                            "${driverController.driverList[index].negativeSign != null ? driverController.driverList[index].negativeSign : ""}" +
                                                driverController.driverList[index].balance.toString(),
                                            style: TextStyles.red16BigWeight16PtTextStyle),
                                        SizedBox(
                                          width: Dimens.size10,
                                        ),
                                        Image.asset(
                                          MyImgs.arrowForward,
                                          width: getWidth(
                                            Dimens.size14,
                                          ),
                                          height: getHeight(Dimens.size10),
                                          color: MyColors.blue1,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      );
                    })
              ],
            ),
          ),
        ),
      );
    });
  }
}
