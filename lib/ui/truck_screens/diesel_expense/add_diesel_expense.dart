import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

import 'package:image_picker/image_picker.dart';

import '../../../controllers/truck_controller/truck_controller.dart';
import '../../../values/dimens.dart';
import '../../../values/my_colors.dart';
import '../../../values/my_imgs.dart';
import '../../../values/size_config.dart';
import '../../../widgets/custom_button_supplier1.dart';

class AddDieselExpenses extends StatelessWidget {
  AddDieselExpenses({Key? key, this.id}) : super(key: key);
  //DieselController controller = Get.find();
  TruckController truckController = Get.find();
  int? id;
  String? selectDate;
  String? selectImage;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TruckController>(builder: (truckController) {
      return Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.white,
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
            ),
          ),
          title: Text(
            "addFuelExpense",
            style: TextStyles.blackMediumWeight18PtTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "expenseAmount",
                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: truckController.amountController,
                    style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                    cursorColor: MyColors.grey3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enterAmount";
                      }
                    },
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey3),
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                        //contentPadding: EdgeInsets.only(top: 15,),
                        prefixIcon: Container(
                            height: 0,
                            width: getWidth(Dimens.size18),
                            padding: EdgeInsets.only(right: 10, top: 7, bottom: 5),
                            //color: MyColors.yellow,
                            child: Text(
                              "\$",
                              style: TextStyles.blackLessWeight14PtTextStyle,
                            )
                            //Image.asset(MyImgs.dollarIcon),

                            ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 25,
                        ),
                        hintText: "0",
                        hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                    onChanged: (value) {
                      // if (controller.amountController.text.isNotEmpty) {
                      //   validaterColor() == true;
                      //   controller.update();
                      // } else {
                      //   validaterColor() == false;
                      //   controller.update();
                      // }
                    },
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "fuelQuantity",
                            style: TextStyles.veryDarkGrey12400PtTextStyle,
                          ),
                          SizedBox(
                            width: getWidth(Dimens.size150),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: truckController.fuelQuantityController,
                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              cursorColor: MyColors.grey3,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: MyColors.grey3),
                                  ),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                  //contentPadding: EdgeInsets.only(top: 15,),
                                  prefixIcon: Container(
                                      height: 0,
                                      width: getWidth(Dimens.size18),
                                      padding: EdgeInsets.only(right: 10, top: 7, bottom: 5),
                                      //color: MyColors.yellow,
                                      child: Text(
                                        "L",
                                        style: TextStyles.blackLessWeight14PtTextStyle,
                                      )),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 12,
                                    minHeight: 25,
                                  ),
                                  hintText: "0",
                                  hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "rateOperLitre",
                            style: TextStyles.veryDarkGrey12400PtTextStyle,
                          ),
                          SizedBox(
                            width: getWidth(Dimens.size150),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: truckController.rateLiterController,
                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              cursorColor: MyColors.grey3,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: MyColors.grey3),
                                  ),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                  //contentPadding: EdgeInsets.only(top: 15,),
                                  prefixIcon: Container(
                                      height: 0,
                                      width: getWidth(Dimens.size18),
                                      padding: EdgeInsets.only(right: 10, top: 7, bottom: 5),
                                      //color: MyColors.yellow,
                                      child: Text(
                                        "\$",
                                        style: TextStyles.blackLessWeight14PtTextStyle,
                                      )
                                      //Image.asset(MyImgs.dollarIcon),
                                      ),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 12,
                                    minHeight: 25,
                                  ),
                                  hintText: "0",
                                  hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),
                  Row(
                    children: [
                      Container(
                        //  color: MyColors.green1,
                        width: getWidth(Dimens.size154),
                        child: Text(
                          "expenseDay",
                          style: TextStyles.veryDarkGrey12400PtTextStyle,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: getWidth(Dimens.size14)),
                          width: getWidth(Dimens.size154),
                          child: Text(
                            "currentKmReading",
                            style: TextStyles.veryDarkGrey12400PtTextStyle,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        //   padding: EdgeInsets.only(top: getHeight(Dimens.size4)),
                        width: getWidth(Dimens.size150),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                              onTap: () {
                                // controller.selectDates(context, 0);
                                //
                                // controller.update();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                  Text(
                                    truckController.dropdownValueReminderDates != null
                                        ? "${truckController.dropdownValueReminderDates}"
                                        : "selectDate",
                                    style: truckController.dropdownValueReminderDates != null
                                        ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                                        : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
                                  ),
                                  //
                                  Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Colors.blueAccent,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              height: 24,
                              thickness: 1,
                              // indent: 20,
                              endIndent: 0,
                              color: MyColors.grey3,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: getWidth(Dimens.size154),
                        child: SizedBox(
                          width: getWidth(Dimens.size150),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: truckController.kmController,
                            style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                            cursorColor: MyColors.grey3,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.grey3),
                                ),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                //contentPadding: EdgeInsets.only(top: 15,),
                                prefixIcon: Container(
                                    height: 0,
                                    width: 20,
                                    padding: EdgeInsets.only(right: 10, top: 6, bottom: 5),
                                    //color: MyColors.yellow,
                                    child: Container(
                                      // color: Colors.red,
                                      child: Text(
                                        "km",
                                        style: TextStyles.blackLessWeight14PtTextStyle,
                                      ),
                                    )),
                                prefixIconConstraints: BoxConstraints(
                                  minWidth: 35,
                                  minHeight: 25,
                                ),
                                hintText: "0",
                                hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                          ),
                        ),
                      )
                    ],
                  ),
                  truckController.dropdownValueReminderDates == null
                      ? Text(
                          selectDate != null ? selectDate.toString() : "",
                          style: TextStyles.black1LessWeightred12PtTextStyle,
                        )
                      : SizedBox(),
                  // SizedBox(
                  //   height: getHeight(Dimens.size30),
                  // ),
                  Text(
                    "addPhoto",
                    style: TextStyles.black14500PtHeavyWeightTextStyle,
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),
                  GestureDetector(
                    onTap: () {
                      truckController.getImage();
                      truckController.update();
                    },
                    child: Container(
                      height: getHeight(Dimens.size100),
                      width: getWidth(Dimens.size100),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey1),
                      child: truckController.image?.path == null
                          ? const Icon(
                              Icons.add,
                              color: MyColors.blue1,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(truckController.image!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  truckController.image == null
                      ? Text(
                          selectImage != null ? selectImage.toString() : "",
                          style: TextStyles.black1LessWeightred12PtTextStyle,
                        )
                      : SizedBox(),
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),
                  Text(
                    "paymentMethod",
                    style: TextStyles.black14500PtHeavyWeightTextStyle,
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),
                  // Row(
                  //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     FilterButton(
                  //       index: 1,
                  //       text: "cash",
                  //       ontap: () {
                  //         truckController.isDieselButtons = 1;
                  //         truckController.isDieselButtton.value = !truckController.isDieselButtton.value;
                  //         truckController.driverId = null;
                  //         truckController.driverNameSelect = null;
                  //         truckController.shopId = null;
                  //         truckController.shopNameSelect = null;
                  //         truckController.transactionIdController.clear();
                  //         if (controller.isDieselButtons == 1) {
                  //           controller.intuu = "cash";
                  //         }
                  //         print(controller.intuu);
                  //         controller.update();
                  //       },
                  //       select: controller.isDieselButtons,
                  //     ),
                  //     SizedBox(
                  //       width: getWidth(Dimens.size8),
                  //     ),
                  //     FilterButton(
                  //       index: 2,
                  //       text: "credit",
                  //       ontap: () {
                  //         controller.isDieselButtons = 2;
                  //         controller.isDieselButtton.value = !controller.isDieselButtton.value;
                  //         controller.driverId = null;
                  //         controller.driverNameSelect = null;
                  //         controller.transactionIdController.clear();
                  //         if (controller.isDieselButtons == 2) {
                  //           controller.intuu = "credit";
                  //         }
                  //         print(controller.intuu);
                  //         controller.update();
                  //       },
                  //       select: controller.isDieselButtons,
                  //     ),
                  //     SizedBox(
                  //       width: getWidth(Dimens.size8),
                  //     ),
                  //     FilterButton(
                  //       index: 3,
                  //       text: "paidByDriver",
                  //       ontap: () {
                  //         controller.isDieselButtons = 3;
                  //         controller.isDieselButtton.value = !controller.isDieselButtton.value;
                  //         controller.shopId = null;
                  //         controller.shopNameSelect = null;
                  //         controller.transactionIdController.clear();
                  //         if (controller.isDieselButtons == 3) {
                  //           controller.intuu = "paid_by_driver";
                  //         }
                  //         controller.update();
                  //       },
                  //       select: controller.isDieselButtons,
                  //     ),
                  //     SizedBox(
                  //       width: getWidth(Dimens.size8),
                  //     ),
                  //     FilterButton(
                  //       index: 4,
                  //       text: "online",
                  //       ontap: () {
                  //         controller.isDieselButtons = 4;
                  //         controller.isDieselButtton.value = !controller.isDieselButtton.value;
                  //         controller.shopId = null;
                  //         controller.shopNameSelect = null;
                  //         controller.driverId = null;
                  //         controller.driverNameSelect = null;
                  //         if (controller.isDieselButtons == 4) {
                  //           controller.intuu = "online";
                  //         }
                  //         controller.update();
                  //         print("truck id:  ${truckController.truckFountsearchlist[0].id}");
                  //       },
                  //       select: controller.isDieselButtons,
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),
                  // controller.isDieselButtons == 2
                  //     ? Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(easy.tr("shopName"), style: TextStyles.veryDarkGrey12400PtTextStyle),
                  //           SizedBox(
                  //             height: Dimens.size10,
                  //           ),
                  //           GestureDetector(
                  //             onTap: () async {
                  //               var data = await Get.to(ShopeScreen());
                  //
                  //               if (data != null) {
                  //                 controller.shopNameSelect = data;
                  //               }
                  //               // drivertruckBottomSheet(context);
                  //               controller.update();
                  //             },
                  //             child: Container(
                  //               //color: MyColors.yellow,
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                  //                   Text(
                  //                     controller.shopNameSelect ?? easy.tr("chooseShop"),
                  //                     style: controller.shopNameSelect != null
                  //                         ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                  //                         : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
                  //                   ),
                  //
                  //                   Icon(
                  //                     Icons.arrow_drop_down_outlined,
                  //                     color: Colors.blueAccent,
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //           Divider(
                  //             //height: 20,
                  //             thickness: 1,
                  //             // indent: 20,
                  //             endIndent: 0,
                  //             color: MyColors.grey3,
                  //           ),
                  //           controller.shopNameSelect == null
                  //               ? Text(
                  //                   chooseShop != null ? easy.tr(chooseShop.toString()) : "",
                  //                   style: TextStyles.black1LessWeightred12PtTextStyle,
                  //                 )
                  //               : SizedBox(),
                  //           SizedBox(
                  //             height: getHeight(Dimens.size14),
                  //           )
                  //         ],
                  //       )
                  //     : SizedBox(),
                  // controller.isDieselButtons == 3
                  //     ? Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(easy.tr("driverName"), style: TextStyles.veryDarkGrey12400PtTextStyle),
                  //           SizedBox(
                  //             height: Dimens.size10,
                  //           ),
                  //           GestureDetector(
                  //             onTap: () async {
                  //               var data = await Get.to(ChooseDriver());
                  //
                  //               if (data != null) {
                  //                 controller.driverNameSelect = data;
                  //               }
                  //               // drivertruckBottomSheet(context);
                  //               controller.update();
                  //             },
                  //             child: Container(
                  //               //color: MyColors.yellow,
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                  //                   Text(
                  //                     controller.driverNameSelect ?? easy.tr("chooseDriver"),
                  //                     style: controller.driverNameSelect != null
                  //                         ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                  //                         : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
                  //                   ),
                  //
                  //                   Icon(
                  //                     Icons.arrow_drop_down_outlined,
                  //                     color: Colors.blueAccent,
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //           Divider(
                  //             //height: 20,
                  //             thickness: 1,
                  //             // indent: 20,
                  //             endIndent: 0,
                  //             color: MyColors.grey3,
                  //           ),
                  //           controller.driverNameSelect == null
                  //               ? Text(
                  //                   chooseDriver != null ? easy.tr(chooseDriver.toString()) : "",
                  //                   style: TextStyles.black1LessWeightred12PtTextStyle,
                  //                 )
                  //               : SizedBox(),
                  //           SizedBox(
                  //             height: getHeight(Dimens.size14),
                  //           )
                  //         ],
                  //       )
                  //     : SizedBox(),
                  // controller.isDieselButtons == 4
                  //     ? Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             easy.tr("transactionId"),
                  //             style: TextStyles.veryDarkGrey12400PtTextStyle,
                  //           ),
                  //           TextFormField(
                  //             validator: (value) {
                  //               if (value == null || value.isEmpty) {
                  //                 return easy.tr("enterTransactionId");
                  //               }
                  //             },
                  //             controller: controller.transactionIdController,
                  //             decoration:
                  //                 InputDecoration(hintText: easy.tr("transactionId"), hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                  //             onChanged: (value) {
                  //               if (controller.transactionIdController.text.isNotEmpty) {
                  //                 validaterColor() == true;
                  //                 controller.update();
                  //               } else {
                  //                 validaterColor() == false;
                  //                 controller.update();
                  //               }
                  //             },
                  //           ),
                  //           SizedBox(
                  //             height: getHeight(Dimens.size14),
                  //           )
                  //         ],
                  //       )
                  //     : SizedBox(),
                  // Text(
                  //   easy.tr("dieselPumpName"),
                  //   style: TextStyles.veryDarkGrey12400PtTextStyle,
                  // ),
                  TextField(
                    controller: truckController.pumpNameController,
                    style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                    cursorColor: MyColors.grey3,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey3),
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                        hintText: "enterDieselPumpName",
                        hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size30),
                  ),
                  GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          truckController.createDieselFunction();
                          truckController.update();
                          // validate();
                          //controller.update();
                        }

                        print("truck id--:  ${id}");
                        truckController.update();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: getHeight(Dimens.size50),
                          width: getWidth(Dimens.size320),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: MyColors.blue1),
                          child: Center(
                              child: Text(
                            "confrim",
                            style: TextStyles.white1PtMediumWeightTextStyle,
                          )
                              //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),

                              )))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  String? expenseType;

  String? chooseShop;
  String? chooseDriver;
  String? enterDriverName;
  // void validate() {
  //   if (controller.dropdownValueReminderDates == null) {
  //     selectDate = "selectDate";
  //   } else if (controller.image == null) {
  //     selectImage = "selectImage";
  //   } else if (controller.isDieselButtons == 2 && controller.shopNameSelect == null) {
  //     chooseShop = "chooseShop";
  //   } else if (controller.isDieselButtons == 3 && controller.driverNameSelect == null) {
  //     chooseDriver = "chooseDriver";
  //   } else {
  //     controller.isFullLoading.value = !controller.isFullLoading.value;
  //     controller.isFullLoading.value == true ? null : controller.createFueleExpenseButton(id);
  //     controller.isFullLoading.value = false;
  //     controller.update();
  //   }
  // }
  //
  // bool validaterColor() {
  //   if (controller.isDieselButtons == 1 &&
  //           controller.dropdownValueReminderDates != null &&
  //           controller.image != null &&
  //           controller.amountController.text.isNotEmpty ||
  //       controller.isDieselButtons == 2 &&
  //           controller.dropdownValueReminderDates != null &&
  //           controller.image != null &&
  //           controller.amountController.text.isNotEmpty &&
  //           controller.shopNameSelect != null ||
  //       controller.isDieselButtons == 3 &&
  //           controller.dropdownValueReminderDates != null &&
  //           controller.image != null &&
  //           controller.amountController.text.isNotEmpty &&
  //           controller.driverNameSelect != null ||
  //       controller.isDieselButtons == 4 &&
  //           controller.dropdownValueReminderDates != null &&
  //           controller.image != null &&
  //           controller.amountController.text.isNotEmpty &&
  //           controller.transactionIdController.text.isNotEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
