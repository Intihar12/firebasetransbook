import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../constants.dart';

import '../../controllers/driver_controller/driver_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';
import '../../values/size_config.dart';
import '../../widgets/driver_create_bottomsheet_widget.dart';
import 'driver_details_screen.dart';

class DriverScreen extends StatelessWidget {
  DriverScreen({Key? key, this.id}) : super(key: key);
  final int? id;

  bool isMobileNumberValid = false;
  DriverController driverController = Get.find();

  var userName;
  var avatarText;
  Timer? debounce;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<DriverController>(builder: (driverController) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: MyColors.white,
          floatingActionButton: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
            child: FloatingActionButton(
              onPressed: () {
                driverController.isOpeningBalance.value = true;
                driverController.isCreateDriver.value = true;
                driverCreateBottomSheet(context);
                driverController.update();
              },
              child: Icon(
                Icons.add,
                size: 30,
              ),
              backgroundColor: MyColors.blue1,
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: MyColors.white,
            automaticallyImplyLeading: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
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
                            color: MyColors.blue1,
                          )),
                      SizedBox(
                        width: getWidth(Dimens.size28),
                      ),
                      Text(
                        "driver",
                        style: TextStyles.blackMediumWeight18PtTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 37),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("totalDriverBalance", style: TextStyles.veryDarkGrey12400PtTextStyle),
                  SizedBox(
                    height: Dimens.size10,
                  ),
                  Text(
                    "0",
                    style: TextStyles.red30LessWeight14PtTextStyle,
                  ),

                  // GetBuilder<StatisticsController>(builder: (statisticController) {
                  //   return Text(
                  //     easy.tr("currencySymbol") + ("${statisticController.statisticsModal.data?.driverBalance}"),
                  //     style: TextStyles.PtLessWeightRubikTextStyle,
                  //   );
                  // }),
                  SizedBox(
                    height: getHeight(Dimens.size30),
                  ),

                  TextFormField(
                    // controller: driverController.searchController,
                    onChanged: (value) {
                      driverController.filterSearch(value);
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                    keyboardType: TextInputType.text,
                    cursorColor: MyColors.grey3,
                    style: TextStyles.black1PtLessWeightTextStyle,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey3),
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                        // focusedBorder: UnderlineInputBorder(),
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
                        hintText: 'searchByDriverName',
                        hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                  ),
                  SizedBox(
                    height: Dimens.size30,
                  ),
                  Text(
                    "drivers",
                    style: TextStyles.black14500PtHeavyWeightTextStyle,
                  ),
                  SizedBox(
                    height: Dimens.size30,
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
                            Get.to(DriverDetails());
                            driverController.getDriverSingleData(driverController.driverList[index].driverId);

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

                  //  controller.isLoadingNextpage.value? CircularProgressIndicator(): SizedBox()
                ],
              ),
            ),
          ));
    });
  }
}
