import 'dart:async';

import 'package:firebasetransbook/ui/truck_screens/truck_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants.dart';

import '../../controllers/supplier_controller/supplier_controller.dart';
import '../../controllers/truck_controller/truck_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';
import '../../values/size_config.dart';
import '../../widgets/truck_create_bottomsheet_widget.dart';

class TruckScreen extends StatelessWidget {
  TruckScreen({Key? key}) : super(key: key);
  TruckController truckController = Get.find();
  // DriverController driverController = Get.find();
  SupplierController supplierController = Get.find();
  // DieselController dieselController = Get.find();

  Timer? debounce;
  int? selectedId;
  var avatarText;
  int? id;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<TruckController>(builder: (controller) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: MyColors.white,
          floatingActionButton: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
            child: FloatingActionButton(
              onPressed: () {
                controller.isLoading.value = true;
                truckCreateBottomSheet(context);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            //  Get.back();
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
                        "trucks",
                        style: TextStyles.blackMediumWeight18PtTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: truckController.isTruckListDataLoading.value
              ? SingleChildScrollView(
                  //controller: controller.controller,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getHeight(Dimens.size15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //  Get.to(TruckDetailsSupplierOrOwner());
                              },
                              child: Container(
                                padding: EdgeInsets.all(Dimens.size10),
                                width: getWidth(Dimens.size100),
                                // height: getHeight(Dimens.size80),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "allTrucks",
                                      style: TextStyles.veryDarkGrey12400PtTextStyle,
                                    ),
                                    SizedBox(
                                      height: getHeight(Dimens.size10),
                                    ),
                                    Text(
                                      "0",
                                      // "2",
                                      style: TextStyles.whiteLessWeight2050PtTextStyle,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: getHeight(Dimens.size10), vertical: getWidth(Dimens.size10)),

                              width: getWidth(Dimens.size100),
                              //  height: getHeight(Dimens.size80),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "availableTrucks",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                  SizedBox(
                                    height: getHeight(Dimens.size10),
                                  ),
                                  Text(
                                    "avalable",
                                    //  "1",
                                    style: TextStyles.whiteLessWeight2050PtTextStyle,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(Dimens.size10),

                              width: getWidth(Dimens.size100),
                              //  height: getHeight(Dimens.size80),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "trucksOnTrip",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                  SizedBox(
                                    height: getHeight(Dimens.size10),
                                  ),
                                  Text(
                                    "ontrip",
                                    // "1",
                                    style: TextStyles.whiteLessWeight2050PtTextStyle,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: getHeight(Dimens.size30),
                        ),
                        TextFormField(
                          // controller: controller.searchControlle,
                          cursorColor: MyColors.grey3,
                          style: TextStyles.black1PtLessWeightTextStyle,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(14),
                          ],
                          onChanged: (value) {
                            if (debounce?.isActive ?? false) debounce?.cancel();
                            debounce = Timer(const Duration(milliseconds: 300), () {
                              // if (controller.searchControlle.text.isNotEmpty) {
                              //   print("duration intuu");
                              //   controller.searchTruckFunction(value);
                              // } else {
                              //   controller.truckList();
                              //   //    controller.truckFountsearchlist.value;
                              // }
                              // do something with query
                            });

                            // Future.delayed(Duration(seconds: 5), () {
                            //   if (controller.searchControlle.text.isNotEmpty) {
                            //     print("duration intuu");
                            //     controller.searchTruckFunction(value);
                            //   } else {
                            //     controller.truckList();
                            //     //    controller.truckFountsearchlist.value;
                            //   }
                            // });
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.grey3),
                              ),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                              // focusedBorder: UnderlineInputBorder(),
                              border: UnderlineInputBorder(),
                              prefixIconConstraints: BoxConstraints(maxWidth: 25, maxHeight: 25),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ), // icon is 48px widget.
                              ),
                              hintText: 'searchTruckNumber',
                              hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                        ),
                        SizedBox(
                          height: getHeight(Dimens.size30),
                        ),
                        Text(
                          "truck",
                          style: TextStyles.black14500PtHeavyWeightTextStyle,
                        ),
                        SizedBox(
                          height: getHeight(Dimens.size20),
                        ),
                        ListView.builder(
                            itemCount: controller.truckList.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                highlightColor: MyColors.white,
                                onTap: () {
                                  controller.getSingleData(controller.truckList[index].truckId);

                                  Get.to(TruckDetailsScreen());
                                  controller.update();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  controller.truckList[index].registrationNumber.toString(),
                                                  style: TextStyles.black17PtTextStyle,
                                                ),
                                              ),
                                              SizedBox(
                                                height: getHeight(Dimens.size4),
                                              ),

                                              // print(""),
                                              controller.truckList[index].supplierId == null
                                                  ? Container(
                                                      padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                                                      // height: getHeight(Dimens.size22),
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: MyColors.green4),
                                                      child: Text(
                                                        "own",
                                                        style: TextStyles.white12500LessWeight20PtTextStyle,
                                                      ))
                                                  : Container(
                                                      padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                                                      // height: getHeight(Dimens.size22),
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: MyColors.orange3),
                                                      child: Text(
                                                        "market",
                                                        style: TextStyles.white12500LessWeight20PtTextStyle,
                                                      ))
                                            ],
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              //  crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                controller.status == true
                                                    ? Column(children: [
                                                        Text(
                                                          "On trip",
                                                          style: TextStyles.orangeLessWeight14PtTextStyle,
                                                        ),
                                                        SizedBox(
                                                          height: getHeight(Dimens.size8),
                                                        ),
                                                        Text(
                                                          "panama",
                                                          style: TextStyles.veryDarkGrey12400PtTextStyle,
                                                        ),
                                                      ])
                                                    : Text(
                                                        "Available",
                                                        style: TextStyles.green4LessWeight12PtTextStyle,
                                                      ),
                                                SizedBox(
                                                  width: getWidth(Dimens.size13),
                                                ),
                                                Image.asset(
                                                  MyImgs.arrowForward,
                                                  width: getWidth(
                                                    Dimens.size14,
                                                  ),
                                                  height: getHeight(Dimens.size10),
                                                )
                                                // Icon(Icons.arrow_forward,color: MyColors.blue1,)
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ));
    });
  }
}
