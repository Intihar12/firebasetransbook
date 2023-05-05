import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

import '../../controllers/truck_controller/truck_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';
import '../../values/size_config.dart';

import '../../widgets/supplier_create_bottomSheet_widget.dart';
import 'diesel_expense/add_diesel_expense.dart';
import 'diesel_expense/diesel_screen.dart';

class TruckDetailsScreen extends StatelessWidget {
  TruckDetailsScreen({
    Key? key,
    // this.id,
  }) : super(key: key);
  // final int? id;
  //  final String? registrationNumber;
  var avatarText;

  // DriverAndExpenseController driverExpenseController = Get.find();

  //ReportController reportsController = Get.find();
  // ServicesController servicesController = Get.find();

  //DocumentsController documentsController = Get.find();

  //DieselController dieselController = Get.find();

  // SupplierController supplierController = Get.find();

  TruckController truckController = Get.find();
  // ExpensesController expenseController = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<TruckController>(builder: (controller) {
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
                            color: MyColors.blue1,
                          )),
                      SizedBox(
                        width: getWidth(Dimens.size28),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ghghg",
                              style: TextStyles.blackMediumWeight18PtTextStyle,
                            ),
                            // SizedBox(
                            //   height: getHeight(Dimens.size4),
                            // ),
                            // controller.truckFountsearchlist[0].status == "on_trip"
                            //     ? Text(
                            //         "On trip",
                            //         style: TextStyles.orang2eLessWeight14PtTextStyle,
                            //       )
                            //     : Text(
                            //         "Available",
                            //         style: TextStyles.green1LessWeight12PtTextStyle,
                            //       ),
                            SizedBox(
                              width: Dimens.size8,
                            ),
                            // Row(
                            //   children: [
                            //     Text("Driver:",style: TextStyles.black10400PtHeavyWeightTextStyle,),
                            //     Text(" Smith Powers",style: TextStyles.black10400PtHeavyWeightTextStyle,)
                            //   ],
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            //   controller.isTruckUpdateLoading.value = true;
                            // controller.updateSupId = null;
                            // controller.selected.name = null;
                            // print("supi");
                            // print(controller.updateSupId);
                            //  controller.getSingleTruckDetails(controller.showSingleDataTruckModal.data?.id);
                            // updatetruckModalBottomSheet(context);

                            // controller.registrationController.text = controller.showSingleDataTruckModal.data!.registrationNumber.toString();
                            //  controller.getSingleTruckDetails(controller.showSingleDataTruckModal.data?.id);
                            // controller.getSingleTruckDetails(controller.showSingleDataTruckModal.data!.id);
                            controller.update();
                          },
                          child: Icon(
                            Icons.edit,
                            color: MyColors.blue1,
                          )),
                      SizedBox(
                        width: getWidth(Dimens.size15),
                      ),
                      //Icon(Icons.delete),
                      GestureDetector(
                        onTap: () {
                          //  controller.buttonLoading.value = true;
                          // deleteTruckBottomSheet(context);
                          controller.update();
                        },
                        child: Image.asset(
                          MyImgs.deleteIcon,
                          width: Dimens.size21,
                          height: Dimens.size24,
                          color: MyColors.blue1,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            // controller: expenseController.controller,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          truckController.getDieselData();
                          Get.to(DieselScreen());
                          // dieselController.isDieselListStartDateEndDateLoading.value = false;
                          // print("diesel length");
                          // print(dieselController.dieselLisByBatetModal.data?.length);
                          // dieselController.dieselLisByBatetModal.data != null ? dieselController.isDieselFilter.value = false : dieselController.isDieselFilter.value = true;
                          // // dieselController.isDieselFilter.value = true;
                          // Get.to(() => DieselScreen(
                          //       id: controller.showSingleDataTruckModal.data!.id,
                          //       driverName: controller.showSingleDataTruckModal.data!.registrationNumber,
                          //     ));
                          // // dieselController.dieselList(
                          // //   controller.showSingleDataTruckModal.data!.id,
                          // // );
                          // controller.thisMonth = null;
                          // dieselController.thisMonthFunction();
                          // dieselController.dieselListByStartDateEndDate(controller.showSingleDataTruckModal.data!.id, dieselController.startDate, dieselController.endDate);
                          // controller.thisMonth = null;
                          // dieselController.update();
                          controller.update();
                        },
                        child: Container(
                            width: getWidth(Dimens.size154),
                            height: getHeight(Dimens.size60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  // spreadRadius: 0.3,
                                  offset: Offset(
                                    0,
                                    2,
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    MyImgs.desilIcon,
                                    width: getHeight(Dimens.size20),
                                    height: getWidth(Dimens.size17),
                                    color: MyColors.blue1,
                                  ),

                                  Text(
                                    "dieselBook",
                                    style: TextStyles.black1PtLessWeightTextStyle,
                                  ),
                                  // Center(
                                  //   child: Column(
                                  //
                                  //     children: [
                                  //     Text(easy.tr("View")),
                                  //     Text(easy.tr("reort")),
                                  //
                                  //   ],),
                                  // ),
                                  Image.asset(
                                    MyImgs.arrowForward,
                                    width: getWidth(
                                      Dimens.size14,
                                    ),
                                    height: getHeight(Dimens.size10),
                                  )
                                ],
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          // documentsController.isDocumentsLoading.value = false;
                          // Get.to(DocumentsBookScreen(
                          //   id: controller.showSingleDataTruckModal.data!.id,
                          //   truckName: controller.showSingleDataTruckModal.data!.registrationNumber,
                          // ));
                          // documentsController.documentsList(controller.showSingleDataTruckModal.data!.id);
                          // documentsController.update();
                          //
                          // print("truck id ${controller.showSingleDataTruckModal.data!.id}");
                        },
                        child: Container(
                            width: getWidth(Dimens.size154),
                            height: getHeight(Dimens.size60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  // spreadRadius: 0.3,
                                  offset: Offset(
                                    0,
                                    2,
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    MyImgs.docIcon,
                                    width: getHeight(Dimens.size20),
                                    height: getWidth(Dimens.size17),
                                    color: MyColors.blue1,
                                  ),

                                  Text(
                                    "documentsBook",
                                    style: TextStyles.black1PtLessWeightTextStyle,
                                  ),
                                  // Center(
                                  //   child: Column(
                                  //
                                  //     children: [
                                  //     Text(easy.tr("View")),
                                  //     Text(easy.tr("reort")),
                                  //
                                  //   ],),
                                  // ),
                                  Image.asset(
                                    MyImgs.arrowForward,
                                    width: getWidth(
                                      Dimens.size14,
                                    ),
                                    height: getHeight(Dimens.size10),
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size12),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // servicesController.isServicesLoading.value = false;
                          // servicesController.getServicesModal.data != null ? servicesController.isServicesFilter.value = false : servicesController.isServicesFilter.value = true;
                          //
                          // Get.to(ServicesScreen(
                          //   id: controller.showSingleDataTruckModal.data!.id,
                          //   name: controller.showSingleDataTruckModal.data!.registrationNumber,
                          // ));
                          // // servicesController.servicesList(
                          // //   controller.showSingleDataTruckModal.data!.id,
                          // // );
                          // controller.thisMonth = null;
                          // servicesController.thisMonthFunction();
                          // servicesController.servicesListByDates(controller.showSingleDataTruckModal.data?.id, servicesController.startDate, servicesController.endDate);
                          //
                          // // controller.thisMonth = null;
                          // servicesController.update();
                          controller.update();
                        },
                        child: Container(
                            width: getWidth(Dimens.size154),
                            height: getHeight(Dimens.size60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  // spreadRadius: 0.3,
                                  offset: Offset(
                                    0,
                                    2,
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    MyImgs.serviceIcon,
                                    width: getHeight(Dimens.size20),
                                    height: getWidth(Dimens.size17),
                                  ),

                                  Text(
                                    "serviceBook",
                                    style: TextStyles.black1PtLessWeightTextStyle,
                                  ),
                                  // Center(
                                  //   child: Column(
                                  //
                                  //     children: [
                                  //     Text(easy.tr("View")),
                                  //     Text(easy.tr("reort")),
                                  //
                                  //   ],),
                                  // ),
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
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          // driverExpenseController.isGetDriverExpense.value = false;
                          // driverExpenseController.getExpensesModal.data != null ? driverExpenseController.isDriverExpenseFilter.value = false : driverExpenseController.isDriverExpenseFilter.value = true;
                          // print("driver length");
                          // print(driverExpenseController.getExpensesModal.data?.length);
                          // Get.to(DriverAndExpenseScreen(
                          //   name: controller.showSingleDataTruckModal.data!.registrationNumber,
                          // ));
                          // driverExpenseController.thisMonth = null;
                          // driverExpenseController.thisMonthFunction();
                          // driverExpenseController.truckIdDriverServices = controller.showSingleDataTruckModal.data!.id;
                          // driverExpenseController.getDriverAndExpenses(controller.showSingleDataTruckModal.data!.id, driverExpenseController.startDate, driverExpenseController.endDate);
                          // driverExpenseController.truckId = controller.showSingleDataTruckModal.data!.id;
                          //
                          // driverExpenseController.update();
                        },
                        child: Container(
                            width: getWidth(Dimens.size154),
                            height: getHeight(Dimens.size60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  // spreadRadius: 0.3,
                                  offset: Offset(
                                    0,
                                    2,
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    MyImgs.deriverIcon,
                                    color: MyColors.blue1,
                                    width: getHeight(Dimens.size20),
                                    height: getWidth(Dimens.size17),
                                  ),

                                  Text(
                                    "otherExpenses",
                                    style: TextStyles.black1PtLessWeightTextStyle,
                                  ),
                                  // Center(
                                  //   child: Column(
                                  //
                                  //     children: [
                                  //     Text(easy.tr("View")),
                                  //     Text(easy.tr("reort")),
                                  //
                                  //   ],),
                                  // ),
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
                            )),
                      )
                    ],
                  ),
                  // SizedBox(height: getHeight(Dimens.size30),),

                  SizedBox(
                    height: getHeight(Dimens.size30),
                  ),
                  Text(
                    "profitAndLossSummary",
                    style: TextStyles.blackLessWeight14PtTextStyle,
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),

                  Container(
                    // height: getHeight(Dimens.size110),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey1),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // PeriodCharacter.thisMonth;
                                  // periodtruckModalBottomSheet(context);
                                  //controller.isStatisticsLoading.value = true;
                                  controller.update();
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        controller.thisMonth != null ? "${controller.thisMonth}" : "thisMonth",
                                        style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: MyColors.blue1,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size12),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "revenue",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                  SizedBox(
                                    width: Dimens.size9,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // customDialogBox(context, "truckProfitAndLossSummaryInfo");
                                    },
                                    child: Image.asset(
                                      MyImgs.detailsIcon,
                                      width: getWidth(Dimens.size14),
                                      height: getHeight(Dimens.size14),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size8),
                              ),
                              Text(
                                "0",
                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "tripDays",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                  SizedBox(
                                    width: Dimens.size9,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //   customDialogBox(context, "truckProfitAndLossSummaryInfo");
                                    },
                                    child: Image.asset(
                                      MyImgs.detailsIcon,
                                      width: getWidth(Dimens.size14),
                                      height: getHeight(Dimens.size14),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size8),
                              ),
                              Text(
                                "0",
                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: getHeight(Dimens.size40),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "expenses",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                  SizedBox(
                                    width: Dimens.size9,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //  customDialogBox(context, "truckProfitAndLossSummaryInfo");
                                    },
                                    child: Image.asset(
                                      MyImgs.detailsIcon,
                                      width: getWidth(Dimens.size14),
                                      height: getHeight(Dimens.size14),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size8),
                              ),
                              Text(
                                "0",
                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "reFuel",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                  SizedBox(
                                    width: Dimens.size9,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //customDialogBox(context, "truckProfitAndLossSummaryInfo");
                                    },
                                    child: Image.asset(
                                      MyImgs.detailsIcon,
                                      width: getWidth(Dimens.size14),
                                      height: getHeight(Dimens.size14),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size8),
                              ),
                              Text(
                                "0",
                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Get.to(TruckRevenueReportScreen());

                                  // Get.to(TruckRevenueReportDetailsScreen(
                                  //   truckRegNumber: controller.showSingleDataTruckModal.data?.registrationNumber,
                                  // ));
                                  // reportsController.truckRevenueReportsDetails(controller.showSingleDataTruckModal.data?.id, controller.startDate.toString(), controller.endDate.toString());

                                  // Get.to(() => TruckRevenueReportScreen());
                                  controller.update();
                                },
                                child: Text(
                                  "profitReport",
                                  style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                                ),
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "profit",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                  SizedBox(
                                    width: Dimens.size9,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // customDialogBox(context, "truckProfitAndLossSummaryInfo");
                                    },
                                    child: Image.asset(
                                      MyImgs.detailsIcon,
                                      width: getWidth(Dimens.size14),
                                      height: getHeight(Dimens.size14),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size8),
                              ),
                              Text(
                                "0",
                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "tripsStart",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                  SizedBox(
                                    width: Dimens.size9,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //customDialogBox(context, "truckProfitAndLossSummaryInfo");
                                    },
                                    child: Image.asset(
                                      MyImgs.detailsIcon,
                                      width: getWidth(Dimens.size14),
                                      height: getHeight(Dimens.size14),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(Dimens.size8),
                              ),
                              Text(
                                "0",
                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              )
                            ],
                          ),
                        ],
                      ),
                      // Column(
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         GestureDetector(
                      //           onTap: () {
                      //             // PeriodCharacter.thisMonth;
                      //             periodtruckModalBottomSheet(context);
                      //             controller.isStatisticsLoading.value = true;
                      //             controller.update();
                      //           },
                      //           child: Container(
                      //             child: Row(
                      //               children: [
                      //                 Text(
                      //                   controller.thisMonth != null
                      //                       ? easy.tr("${controller.thisMonth}")
                      //                       : easy.tr("thisMonth"),
                      //                   style: TextStyles
                      //                       .black14500bluePtHeavyWeightTextStyle,
                      //                 ),
                      //                 Icon(
                      //                   Icons.arrow_drop_down_outlined,
                      //                   color: MyColors.blue1,
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         Text(
                      //           easy.tr("profitReport"),
                      //           style: TextStyles
                      //               .black14500bluePtHeavyWeightTextStyle,
                      //         )
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: getHeight(Dimens.size20),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Text(
                      //                   easy.tr("revenue"),
                      //                   style: TextStyles
                      //                       .veryDarkGrey12400PtTextStyle,
                      //                 ),
                      //                 SizedBox(
                      //                   width: Dimens.size9,
                      //                 ),
                      //                 Image.asset(
                      //                   MyImgs.detailsIcon,
                      //                   width: getWidth(Dimens.size14),
                      //                   height: getHeight(Dimens.size14),
                      //                 )
                      //               ],
                      //             ),
                      //             SizedBox(
                      //               height: getHeight(Dimens.size8),
                      //             ),
                      //             Text(
                      //               controller.truckStatisticsModal.data
                      //                           ?.revenue !=
                      //                       null
                      //                   ? controller
                      //                       .truckStatisticsModal.data!.revenue
                      //                       .toString()
                      //                   : "",
                      //               style: TextStyles
                      //                   .black14500BLACKPtHeavyWeightTextStyle,
                      //             ),
                      //           ],
                      //         ),
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Text(
                      //                   easy.tr("expenses"),
                      //                   style: TextStyles
                      //                       .veryDarkGrey12400PtTextStyle,
                      //                 ),
                      //                 SizedBox(
                      //                   width: Dimens.size9,
                      //                 ),
                      //                 Image.asset(
                      //                   MyImgs.detailsIcon,
                      //                   width: getWidth(Dimens.size14),
                      //                   height: getHeight(Dimens.size14),
                      //                 )
                      //               ],
                      //             ),
                      //             SizedBox(
                      //               height: getHeight(Dimens.size8),
                      //             ),
                      //             Text(
                      //               controller.truckStatisticsModal.data
                      //                           ?.expenses !=
                      //                       null
                      //                   ? controller
                      //                       .truckStatisticsModal.data!.expenses
                      //                       .toString()
                      //                   : "",
                      //               style: TextStyles
                      //                   .black14500BLACKPtHeavyWeightTextStyle,
                      //             ),
                      //           ],
                      //         ),
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Text(
                      //                   easy.tr("profit"),
                      //                   style: TextStyles
                      //                       .veryDarkGrey12400PtTextStyle,
                      //                 ),
                      //                 SizedBox(
                      //                   width: Dimens.size9,
                      //                 ),
                      //                 Image.asset(
                      //                   MyImgs.detailsIcon,
                      //                   width: getWidth(Dimens.size14),
                      //                   height: getHeight(Dimens.size14),
                      //                 )
                      //               ],
                      //             ),
                      //             SizedBox(
                      //               height: getHeight(Dimens.size8),
                      //             ),
                      //             Text(
                      //               controller.truckStatisticsModal.data
                      //                           ?.profit !=
                      //                       null
                      //                   ? controller
                      //                       .truckStatisticsModal.data!.profit
                      //                       .toString()
                      //                   : "",
                      //               style: TextStyles
                      //                   .black14500BLACKPtHeavyWeightTextStyle,
                      //             ),
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: getHeight(Dimens.size20),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Text(
                      //                   easy.tr("tripDays"),
                      //                   style: TextStyles
                      //                       .veryDarkGrey12400PtTextStyle,
                      //                 ),
                      //                 SizedBox(
                      //                   width: Dimens.size9,
                      //                 ),
                      //                 Image.asset(
                      //                   MyImgs.detailsIcon,
                      //                   width: getWidth(Dimens.size14),
                      //                   height: getHeight(Dimens.size14),
                      //                 )
                      //               ],
                      //             ),
                      //             SizedBox(
                      //               height: getHeight(Dimens.size8),
                      //             ),
                      //             Text(
                      //               controller.truckStatisticsModal.data
                      //                           ?.tripDays !=
                      //                       null
                      //                   ? controller
                      //                       .truckStatisticsModal.data!.tripDays
                      //                       .toString()
                      //                   : "",
                      //               style: TextStyles
                      //                   .black14500BLACKPtHeavyWeightTextStyle,
                      //             ),
                      //           ],
                      //         ),
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Text(
                      //                   easy.tr("reFuel"),
                      //                   style: TextStyles
                      //                       .veryDarkGrey12400PtTextStyle,
                      //                 ),
                      //                 SizedBox(
                      //                   width: Dimens.size9,
                      //                 ),
                      //                 Image.asset(
                      //                   MyImgs.detailsIcon,
                      //                   width: getWidth(Dimens.size14),
                      //                   height: getHeight(Dimens.size14),
                      //                 )
                      //               ],
                      //             ),
                      //             SizedBox(
                      //               height: getHeight(Dimens.size8),
                      //             ),
                      //             Text(
                      //               controller.truckStatisticsModal.data
                      //                           ?.refuel !=
                      //                       null
                      //                   ? controller
                      //                       .truckStatisticsModal.data!.refuel
                      //                       .toString()
                      //                   : "",
                      //               style: TextStyles
                      //                   .black14500BLACKPtHeavyWeightTextStyle,
                      //             ),
                      //           ],
                      //         ),
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Text(
                      //                   easy.tr("tripsStart"),
                      //                   style: TextStyles
                      //                       .veryDarkGrey12400PtTextStyle,
                      //                 ),
                      //                 SizedBox(
                      //                   width: Dimens.size9,
                      //                 ),
                      //                 Image.asset(
                      //                   MyImgs.detailsIcon,
                      //                   width: getWidth(Dimens.size14),
                      //                   height: getHeight(Dimens.size14),
                      //                 )
                      //               ],
                      //             ),
                      //             SizedBox(
                      //               height: getHeight(Dimens.size8),
                      //             ),
                      //             Text(
                      //               controller.truckStatisticsModal.data
                      //                           ?.tripsStart !=
                      //                       null
                      //                   ? controller
                      //                       .truckStatisticsModal.data!.tripsStart
                      //                       .toString()
                      //                   : "",
                      //               style: TextStyles
                      //                   .black14500BLACKPtHeavyWeightTextStyle,
                      //             ),
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size30),
                  ),
                  Text(
                    "tripsExpenses",
                    style: TextStyles.black14500PtHeavyWeightTextStyle,
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // startDateAndEndDateTruckPeriod(context);
                          // expenseController.isStartDateAndEndDateTruckExpensesList.value = true;
                          // expenseController.update();
                        },
                        child: Row(
                          children: [
                            controller.thisMonthTrue != null
                                ? Text(
                                    "${controller.thisMonthTrue}",
                                    style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                                  )
                                : Text("thisMonth", style: TextStyles.black14500bluePtHeavyWeightTextStyle),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              color: MyColors.blue1,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //  allTripstruckModalBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            Text(
                              "allTripsExpenses",
                              style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                            ),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              color: MyColors.blue1,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),

                  // GetBuilder<ExpensesController>(builder: (expenseController) {
                  //   return expenseController.truckExpensesList.length > 0
                  //       ? ListView.builder(
                  //           shrinkWrap: true,
                  //           physics: NeverScrollableScrollPhysics(),
                  //           itemCount: expenseController.truckExpensesList.length,
                  //           itemBuilder: (BuildContext context, int index) {
                  //             return Padding(
                  //               padding: const EdgeInsets.only(bottom: 20.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Container(
                  //                     child: Row(
                  //                       children: [
                  //                         Container(
                  //                           padding: EdgeInsets.all(10),
                  //                           height: getHeight(Dimens.size50),
                  //                           width: getWidth(Dimens.size50),
                  //                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey1),
                  //                           child: SizedBox(
                  //                               height: 20,
                  //                               child: Image.asset(
                  //                                 MyImgs.truckIcon,
                  //                                 color: MyColors.black1,
                  //                                 width: getWidth(Dimens.size20),
                  //                                 height: getHeight(Dimens.size17),
                  //                               )),
                  //                         ),
                  //                         SizedBox(
                  //                           width: Dimens.size14,
                  //                         ),
                  //                         Container(
                  //                           //  color: MyColors.red1,
                  //                           width: getWidth(Dimens.size177),
                  //                           child: Column(
                  //                             crossAxisAlignment: CrossAxisAlignment.start,
                  //                             children: [
                  //                               Text(
                  //                                 expenseController.truckExpensesList[index].type != null ? expenseController.truckExpensesList[index].type.toString() : "Load in progress",
                  //                                 style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                  //                               ),
                  //                               SizedBox(
                  //                                 height: getHeight(Dimens.size6),
                  //                               ),
                  //                               Text(
                  //                                 expenseController.truckExpensesList[index].date != null ? "${formatDate(expenseController.truckExpensesList[index].date!, [dd, " ", M, " ", yyyy])}" : "",
                  //                                 style: TextStyles.veryDarkGrey12400PtTextStyle,
                  //                               ),
                  //                               // Text(
                  //                               //   // expenseController
                  //                               //   //     .expensesList[index].date !=null ?  expenseController
                  //                               //   //     .expensesList[index].date +  "26 Aug 2022 |Medellín - Panamá | Party 1" :"",
                  //                               //   style: TextStyles
                  //                               //       .veryDarkGrey12400PtTextStyle,
                  //                               // ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment: CrossAxisAlignment.end,
                  //                     children: [
                  //                       Text(easy.tr("currencySymbol") + "${expenseController.truckExpensesList[index].amount}"),
                  //                       Container(
                  //                         alignment: Alignment.center,
                  //                         width: getWidth(Dimens.size72),
                  //                         height: getHeight(Dimens.size22),
                  //                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.black1),
                  //                         child: Text(
                  //                           easy.tr("fromATrip"),
                  //                           style: TextStyles.white12500LessWeight20PtTextStyle,
                  //                         ),
                  //                       )
                  //                     ],
                  //                   )
                  //                 ],
                  //               ),
                  //             );
                  //           })
                  //       : Center(
                  //           child: Text("No truck expenses add yet"),
                  //         );
                  // })
                ],
              ),
            ),
          ));
    });
  }

  // void updatetruckModalBottomSheet(context) {
  //   int? id;
  //   String? selectSupplier;
  //   final formkey = GlobalKey<FormState>();
  //   SizeConfig().init(context);
  //   supplier.Datum selectedDriver;
  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
  //       isScrollControlled: true,
  //       //backgroundColor: Colors.black12,
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return GetBuilder<TruckController>(builder: (controller) {
  //           return SingleChildScrollView(
  //             physics: ScrollPhysics(),
  //             child: Container(
  //               padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),
  //
  //               //height: getHeight(Dimens.size348),
  //
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
  //                 color: Colors.white,
  //               ),
  //               child: Padding(
  //                 padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Center(
  //                       child: Container(
  //                         height: getHeight(Dimens.size6),
  //                         width: getWidth(Dimens.size30),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(100),
  //                           color: MyColors.blue1,
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size26),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           easy.tr("updateTruck"),
  //                           style: TextStyles.whiteBigWeightTextStyle.copyWith(color: MyColors.textAppbarcolor),
  //                         ),
  //                         GestureDetector(
  //                           onTap: () {
  //                             Get.back();
  //                           },
  //                           child: Text(
  //                             easy.tr("cancel"),
  //                             style: TextStyles.redLessWeight14PtTextStyle,
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size30),
  //                     ),
  //                     Stack(
  //                       clipBehavior: Clip.none,
  //                       children: [
  //                         Container(
  //                           child: Text(
  //                             easy.tr("truckRegisterNumber"),
  //                             style: TextStyles.black1LessWeight12PtTextStyle,
  //                           ),
  //                         ),
  //                         Positioned(
  //                           left: getWidth(Dimens.size130),
  //                           //  bottom: getHeight(Dimens.size1),
  //                           top: -5,
  //                           child: Container(
  //                             child: Text(
  //                               "*",
  //                               style: TextStyle(color: MyColors.red1, fontSize: 20),
  //                             ),
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     Form(
  //                       key: formkey,
  //                       child: TextFormField(
  //                         controller: controller.registrationController,
  //                         validator: (value) {
  //                           if (value == null || value.isEmpty) {
  //                             return easy.tr("pleaseEnterNumber");
  //                           }
  //                         },
  //
  //                         cursorColor: MyColors.black1,
  //                         //  style: TextStyles.black1LessWeight12PtTextStyle,
  //                         decoration: InputDecoration(
  //                           border: UnderlineInputBorder(),
  //                           focusedBorder: UnderlineInputBorder(),
  //                           hintText: easy.tr("hintText"),
  //                           hintStyle: TextStyles.blackLessWeight14PtTextStyle,
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size23),
  //                     ),
  //                     Row(
  //                       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                           // color: Colors.yellow,
  //                           width: MediaQuery.of(context).size.width / 2.3,
  //                           child: ListTile(
  //                             contentPadding: EdgeInsets.zero,
  //                             horizontalTitleGap: 15,
  //                             minLeadingWidth: 0,
  //                             title: Text(
  //                               easy.tr("myTruck"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             ),
  //                             leading: SizedBox(
  //                               height: 20,
  //                               width: 20,
  //                               child: Radio<SingingCharacters>(
  //                                 value: SingingCharacters.myTruck,
  //                                 groupValue: controller.supId != null ? controller.characters : controller.character,
  //                                 onChanged: (SingingCharacters? value) {
  //                                   controller.isTruck.value = !controller.isTruck.value;
  //                                   print(controller.isTruck.value);
  //                                   controller.supId != null ? controller.characters : controller.character = value;
  //                                   // controller.character = value;
  //                                   // controller.characters = value;
  //                                   if (controller.character == value) {
  //                                     controller.supId = null;
  //                                     controller.supName = null;
  //
  //                                     //controller.supplierUpdateId = null;
  //                                   }
  //
  //                                   if (controller.characters == value) {
  //                                     controller.supId = null;
  //
  //                                     controller.supName = null;
  //                                     // controller.supplierUpdateId = null;
  //                                   }
  //
  //                                   controller.isTruck.value = false;
  //                                   controller.update();
  //                                 },
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Container(
  //                           //  color: Colors.red,
  //                           width: MediaQuery.of(context).size.width / 2.3,
  //
  //                           child: ListTile(
  //                             contentPadding: EdgeInsets.zero,
  //                             horizontalTitleGap: 15,
  //                             minLeadingWidth: 10,
  //                             title: Text(
  //                               easy.tr("marketTruck"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             ),
  //                             leading: SizedBox(
  //                               width: 10,
  //                               child: Radio<SingingCharacters>(
  //                                 value: SingingCharacters.marketTruck,
  //                                 groupValue: controller.supId != null ? controller.characters : controller.character,
  //                                 onChanged: (SingingCharacters? value) {
  //                                   controller.getSingleTruckDetails(controller.showSingleDataTruckModal.data?.id);
  //                                   controller.isTruck.value = !controller.isTruck.value;
  //                                   controller.supId != null ? controller.characters : controller.character = value;
  //                                   // controller.characters = value;
  //                                   // controller.character = value;
  //                                   controller.isTruck.value = true;
  //                                   print(controller.isTruck.value);
  //                                   controller.update();
  //                                 },
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //
  //                         // Text(easy.tr("driverHasToPay"),style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
  //                         //   Text(easy.tr("driverHasToGet"),style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,)
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size14),
  //                     ),
  //                     controller.isTruck.value || controller.supId != null
  //                         ? GestureDetector(
  //                             onTap: () async {
  //                               // controller.selectDates(context, 0);
  //
  //                               var data = await drivertruckBottomSheet(context, controller.showSingleDataTruckModal.data!.id);
  //
  //                               if (data != null) {
  //                                 //  selectedDriver = data;
  //                                 // controller.supName = data.toString();
  //                               }
  //
  //                               // drivertruckBottomSheet(context);
  //                               controller.update();
  //                             },
  //                             child: Container(
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(easy.tr("supplierTruckOwner")),
  //                                   SizedBox(
  //                                     height: Dimens.size10,
  //                                   ),
  //                                   Row(
  //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                     children: [
  //                                       //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
  //                                       Text(
  //                                         controller.supName != null ? "${controller.supName}" : easy.tr("selectSupplier"),
  //                                         style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                                       ),
  //
  //                                       Icon(
  //                                         Icons.arrow_drop_down_outlined,
  //                                         color: Colors.blueAccent,
  //                                       )
  //                                     ],
  //                                   ),
  //                                   Divider(
  //                                     //height: 20,
  //                                     thickness: 1,
  //                                     // indent: 20,
  //                                     endIndent: 0,
  //                                     color: MyColors.grey3,
  //                                   ),
  //                                   controller.supName == null
  //                                       ? Text(
  //                                           selectSupplier != null ? easy.tr(selectSupplier.toString()) : "",
  //                                           style: TextStyles.red1LessWeight14PtTextStyle,
  //                                         )
  //                                       : SizedBox()
  //                                 ],
  //                               ),
  //                             ),
  //                           )
  //                         : SizedBox(),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size57),
  //                     ),
  //                     GestureDetector(
  //                         onTap: () async {
  //                           //controller.registrationController.clear();
  //                           // controller.selected.isBlank;
  //
  //                           if (formkey.currentState!.validate()) {
  //                             if (controller.isTruck.value == true && controller.supName == null) {
  //                               selectSupplier = "selectSupplier";
  //                               controller.update();
  //                             } else {
  //                               controller.isTruckUpdateLoading.value = !controller.isTruckUpdateLoading.value;
  //                               controller.isTruckUpdateLoading.value == true ? null : controller.updateTruckFunctionButton(controller.showSingleDataTruckModal.data!.id);
  //                               controller.isTruckUpdateLoading.value = false;
  //                               controller.supId = null;
  //                               controller.supName = null;
  //                               controller.update();
  //                             }
  //                           }
  //                           // controller.updateTruckFunctionButton(
  //                           //     controller.showSingleDataTruckModal.data!.id);
  //                           controller.update();
  //                         },
  //                         child: Container(
  //                             alignment: Alignment.center,
  //                             height: getHeight(Dimens.size50),
  //                             width: getWidth(Dimens.size320),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(100),
  //                               color: MyColors.blue1,
  //                             ),
  //                             child: controller.isTruckUpdateLoading.value
  //                                 ? Center(
  //                                     child: Text(
  //                                     easy.tr("save"),
  //                                     style: TextStyles.white1PtMediumWeightTextStyle,
  //                                   ))
  //                                 : Center(
  //                                     child: LoadingCircle(),
  //                                   )))
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         });
  //       });
  // }

  // Future<supplier.Datum> drivertruckBottomSheet(context, id) async {
  //   //  driver.Datum selected=driver.Datum();
  //   SizeConfig().init(context);
  //
  //   await showModalBottomSheet(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
  //       isScrollControlled: true,
  //       //backgroundColor: Colors.black12,
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return GetBuilder<SupplierController>(builder: (supplierController) {
  //           return Container(
  //             padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),
  //             height: getHeight(Dimens.size750),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
  //               color: Colors.white,
  //             ),
  //             child: Padding(
  //               padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //               child: ListView(
  //                 // mainAxisSize: MainAxisSize.min,
  //                 // crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Center(
  //                     child: Container(
  //                       height: getHeight(Dimens.size6),
  //                       width: getWidth(Dimens.size30),
  //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: getHeight(Dimens.size26),
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         easy.tr("addSupplier"),
  //                         style: TextStyles.LessWeight20PtTextStyle,
  //                       ),
  //                       GestureDetector(
  //                         onTap: () {
  //                           Get.back();
  //                         },
  //                         child: Text(
  //                           easy.tr("cancel"),
  //                           style: TextStyles.redLessWeight14PtTextStyle,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: getHeight(Dimens.size30),
  //                   ),
  //                   TextField(
  //                     decoration: InputDecoration(
  //                         //contentPadding: EdgeInsets.only(top: 15,),
  //                         prefixIcon: Container(
  //                             height: 0,
  //                             width: 0,
  //                             padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
  //                             //color: MyColors.yellow,
  //                             child: Icon(Icons.search)),
  //                         prefixIconConstraints: BoxConstraints(
  //                           minWidth: 25,
  //                           minHeight: 25,
  //                         ),
  //                         hintText: easy.tr("searchNameOrNumber"),
  //                         hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
  //                   ),
  //                   SizedBox(
  //                     height: getHeight(Dimens.size20),
  //                   ),
  //                   GestureDetector(
  //                     onTap: () {
  //                       supplierController.buttonLoading.value = true;
  //                       supplierCreateBottomSheet(context);
  //                     },
  //                     child: Container(
  //                       alignment: Alignment.center,
  //                       height: getHeight(Dimens.size50),
  //                       width: getWidth(Dimens.size320),
  //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: MyColors.blue1, width: 2), color: MyColors.white),
  //                       child: Text(
  //                         easy.tr("addSupplier"),
  //                         style: TextStyles.blue16textStyle,
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: getHeight(Dimens.size20),
  //                   ),
  //                   SizedBox(
  //                     height: getHeight(Dimens.size530),
  //                     child: ListView.builder(
  //
  //                         //physics: NeverScrollableScrollPhysics(),
  //                         itemCount: supplierController.fondsearchlist.length,
  //                         //  itemCount: apiData.length,
  //                         controller: supplierController.controller,
  //                         shrinkWrap: true,
  //                         scrollDirection: Axis.vertical,
  //                         itemBuilder: (BuildContext context, int index) {
  //                           String name = supplierController.fondsearchlist[index].name ?? '';
  //
  //                           List<String> nameSubstrings = name.split(' ') ?? [];
  //                           String avatarText1 = nameSubstrings[0].substring(0, 1) ?? '';
  //                           String avatarText2 = '';
  //                           if (nameSubstrings.length > 1) {
  //                             avatarText2 = nameSubstrings[1].substring(0, 1) ?? '';
  //                           }
  //                           avatarText = (avatarText1 + avatarText2).toUpperCase();
  //                           return GestureDetector(
  //                             onTap: () {
  //                               //driver.Datum datum=driver.Datum();
  //
  //                               truckController.selected = supplierController.fondsearchlist[index];
  //                               truckController.supName = supplierController.fondsearchlist[index].name;
  //                               truckController.supId = supplierController.fondsearchlist[index].id;
  //
  //                               truckController.updateSupId = truckController.selected.id;
  //                               print(truckController.updateSupId);
  //                               Get.back(result: truckController.supName);
  //                               truckController.update();
  //                             },
  //                             child: Padding(
  //                                 padding: const EdgeInsets.only(bottom: 20.0),
  //                                 child: Container(
  //                                   child: Row(
  //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                     children: [
  //                                       Container(
  //                                         child: Row(
  //                                           children: [
  //                                             Container(
  //                                               alignment: Alignment.center,
  //                                               width: Dimens.size28,
  //                                               height: Dimens.size28,
  //                                               decoration: BoxDecoration(color: MyColors.black2, shape: BoxShape.circle),
  //                                               child: Text(
  //                                                 "${avatarText}",
  //                                                 style: TextStyle(color: MyColors.white),
  //                                               ),
  //                                             ),
  //                                             SizedBox(
  //                                               width: Dimens.size10,
  //                                             ),
  //                                             Column(
  //                                               crossAxisAlignment: CrossAxisAlignment.start,
  //                                               children: [
  //                                                 Text(
  //                                                   "${supplierController.fondsearchlist[index].name}",
  //                                                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: MyColors.black1),
  //                                                 ),
  //                                                 supplierController.fondsearchlist[index].phone != null
  //                                                     ? Text(
  //                                                         "${supplierController.fondsearchlist[index].phone}",
  //                                                         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: MyColors.black1),
  //                                                       )
  //                                                     : SizedBox(),
  //                                               ],
  //                                             ),
  //                                           ],
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                           child: Image.asset(
  //                                         MyImgs.arrowForward,
  //                                         width: getWidth(Dimens.size14),
  //                                         height: getHeight(Dimens.size10),
  //                                       ))
  //                                     ],
  //                                   ),
  //                                 )),
  //                           );
  //                         }),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           );
  //         });
  //       });
  //
  //   return truckController.selected;
  // }

  // void deleteTruckBottomSheet(context) {
  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
  //       isScrollControlled: true,
  //       //backgroundColor: Colors.black12,
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return SingleChildScrollView(
  //           physics: ScrollPhysics(),
  //           child: Container(
  //             padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 20),
  //
  //             //height: getHeight(Dimens.size348),
  //
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
  //               color: Colors.white,
  //             ),
  //             child: Padding(
  //               padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //               child: Column(
  //                 children: [
  //                   Center(
  //                     child: Container(
  //                       height: getHeight(Dimens.size6),
  //                       width: getWidth(Dimens.size30),
  //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: getHeight(Dimens.size26),
  //                   ),
  //                   Text(easy.tr("areYouSureDeleteTruck")),
  //                   SizedBox(
  //                     height: getHeight(Dimens.size20),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 40.0, right: 40),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         GestureDetector(
  //                             onTap: () {
  //                               Get.back();
  //                             },
  //                             child: Text(
  //                               easy.tr("cancel"),
  //                               style: TextStyle(color: MyColors.red1),
  //                             )),
  //                         GetBuilder<TruckController>(builder: (controllerss) {
  //                           return GestureDetector(
  //                               onTap: () {
  //                                 controllerss.buttonLoading.value = !controllerss.buttonLoading.value;
  //                                 controllerss.buttonLoading.value == true ? null : controllerss.deleteTruckFunctions(truckController.showSingleDataTruckModal.data!.id);
  //                                 controllerss.buttonLoading.value = false;
  //                                 print("truck id: ");
  //                                 print(truckController.showSingleDataTruckModal.data!.id);
  //                                 Get.back();
  //                                 controllerss.update();
  //                                 //  Get.back();
  //                               },
  //                               child: Container(
  //                                   padding: EdgeInsets.symmetric(horizontal: 10),
  //                                   alignment: Alignment.center,
  //                                   height: getHeight(Dimens.size40),
  //                                   // width: getWidth(Dimens.size70),
  //                                   decoration: BoxDecoration(color: MyColors.blue1, borderRadius: BorderRadius.circular(20)),
  //                                   child: controllerss.buttonLoading.value
  //                                       ? Text(
  //                                           easy.tr("confrim"),
  //                                           style: TextStyle(color: MyColors.white),
  //                                         )
  //                                       : LoadingCircle()));
  //                         })
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
  //
  // void periodtruckModalBottomSheet(context) {
  //   SizeConfig().init(context);
  //   String? startDates;
  //   String? endDates;
  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
  //       isScrollControlled: true,
  //       //backgroundColor: Colors.black12,
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return GetBuilder<TruckController>(builder: (controller) {
  //           return SingleChildScrollView(
  //             physics: ScrollPhysics(),
  //             child: Container(
  //               padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),
  //
  //               //height: getHeight(Dimens.size348),
  //
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
  //                 color: Colors.white,
  //               ),
  //               child: Padding(
  //                 padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Center(
  //                       child: Container(
  //                         height: getHeight(Dimens.size6),
  //                         width: getWidth(Dimens.size30),
  //                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size26),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           easy.tr("period"),
  //                           style: TextStyles.LessWeight20PtTextStyle,
  //                         ),
  //                         GestureDetector(
  //                           onTap: () {
  //                             Get.back();
  //                           },
  //                           child: Text(
  //                             easy.tr("cancel"),
  //                             style: TextStyles.redLessWeight14PtTextStyle,
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size30),
  //                     ),
  //
  //                     SizedBox(
  //                       height: getHeight(Dimens.size14),
  //                     ),
  //                     //
  //                     // Container(
  //                     //   child: ListTile(
  //                     //     contentPadding: EdgeInsets.zero,
  //                     //     horizontalTitleGap: 0,
  //                     //     //  minLeadingWidth: 0,
  //                     //     leading: Container(
  //                     //         // color: Colors.red,
  //                     //         width: getWidth(Dimens.size300),
  //                     //         child: Text(
  //                     //           easy.tr("thisYear"),
  //                     //           style: TextStyles
  //                     //               .black14500BLACKPtHeavyWeightTextStyle,
  //                     //         )),
  //                     //
  //                     //     title: SizedBox(
  //                     //       height: 10,
  //                     //       //  width: 20,
  //                     //       child: Radio<PeriodCharacter>(
  //                     //         value: PeriodCharacter.thisYear,
  //                     //         groupValue: controller.periodCharacter,
  //                     //         onChanged: (PeriodCharacter? value) {
  //                     //           controller.periodCharacter = value;
  //                     //           controller.yearFunction();
  //                     //           controller.update();
  //                     //         },
  //                     //       ),
  //                     //     ),
  //                     //   ),
  //                     // ),
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.only(bottom: 5),
  //                         horizontalTitleGap: 0,
  //
  //                         //minLeadingWidth: 10,
  //                         leading: Container(
  //                             alignment: Alignment.centerLeft,
  //                             height: getHeight(Dimens.size100),
  //                             //color: MyColors.yellow,
  //                             width: getWidth(Dimens.size300),
  //                             child: Text(
  //                               easy.tr("thisMonth"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //                         title: SizedBox(
  //                           // width: 10,
  //                           child: Radio<PeriodCharacter>(
  //                             // visualDensity: VisualDensity(vertical: -5),
  //                             value: PeriodCharacter.thisMonth,
  //                             groupValue: controller.periodCharacter,
  //                             onChanged: (PeriodCharacter? value) {
  //                               controller.isCustomPeriod.value = false;
  //                               controller.periodCharacter = value;
  //                               controller.thisMonthFunction();
  //                               controller.thisMonthTruck = "thisMonth";
  //                               controller.update();
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.zero,
  //                         horizontalTitleGap: 0,
  //                         //  minLeadingWidth: 10,
  //                         leading: Container(
  //                             //color: MyColors.red1,
  //                             alignment: Alignment.centerLeft,
  //                             height: getHeight(Dimens.size100),
  //                             width: getWidth(Dimens.size300),
  //                             child: Text(
  //                               easy.tr("threeMonth"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //                         title: SizedBox(
  //                           // width: 10,
  //                           child: Radio<PeriodCharacter>(
  //                             value: PeriodCharacter.threeMonth,
  //                             groupValue: controller.periodCharacter,
  //                             onChanged: (PeriodCharacter? value) {
  //                               controller.isCustomPeriod.value = false;
  //                               controller.periodCharacter = value;
  //                               controller.threeMonthFunction();
  //                               controller.thisMonthTruck = "threeMonth";
  //                               controller.update();
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     // Container(
  //                     //   child: ListTile(
  //                     //     contentPadding: EdgeInsets.zero,
  //                     //     horizontalTitleGap: 0,
  //                     //     //  minLeadingWidth: 10,
  //                     //     leading: Container(
  //                     //         width: getWidth(Dimens.size300),
  //                     //         child: Text(
  //                     //           easy.tr("allMonths"),
  //                     //           style: TextStyles
  //                     //               .black14500BLACKPtHeavyWeightTextStyle,
  //                     //         )),
  //                     //     title: SizedBox(
  //                     //       // width: 10,
  //                     //       child: Radio<PeriodCharacter>(
  //                     //         value: PeriodCharacter.allMonths,
  //                     //         groupValue: controller.periodCharacter,
  //                     //         onChanged: (PeriodCharacter? value) {
  //                     //           controller.periodCharacter = value;
  //                     //           controller.update();
  //                     //         },
  //                     //       ),
  //                     //     ),
  //                     //   ),
  //                     // ),
  //
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.zero,
  //                         horizontalTitleGap: 0,
  //                         visualDensity: VisualDensity(horizontal: 0, vertical: 0),
  //                         //  minLeadingWidth: 10,
  //                         leading: Container(
  //                             alignment: Alignment.centerLeft,
  //                             height: getHeight(Dimens.size100),
  //                             width: getWidth(Dimens.size300),
  //                             // color: MyColors.yellow,
  //                             child: Text(
  //                               easy.tr("custom"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //                         title: Radio<PeriodCharacter>(
  //                           value: PeriodCharacter.custom,
  //                           groupValue: controller.periodCharacter,
  //                           onChanged: (PeriodCharacter? value) {
  //                             controller.isCustomPeriod.value = !controller.isCustomPeriod.value;
  //
  //                             controller.startDate = null;
  //                             controller.endDate = null;
  //
  //                             controller.periodCharacter = value;
  //                             controller.thisMonthTruck = "custom";
  //                             controller.update();
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //
  //                     controller.isCustomPeriod.value
  //                         ? Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Container(
  //                                 height: getHeight(Dimens.size115),
  //                                 width: getWidth(Dimens.size140),
  //                                 child: Column(
  //                                   crossAxisAlignment: CrossAxisAlignment.start,
  //                                   children: [
  //                                     SizedBox(
  //                                       height: getHeight(Dimens.size20),
  //                                     ),
  //                                     Text(
  //                                       easy.tr("startDate"),
  //                                       style: TextStyles.veryDarkGrey12400PtTextStyle,
  //                                     ),
  //                                     SizedBox(
  //                                       height: getHeight(Dimens.size10),
  //                                     ),
  //                                     GestureDetector(
  //                                       onTap: () async {
  //                                         controller.selectStartDates(context, 0);
  //                                         controller.update();
  //                                       },
  //                                       child: Row(
  //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                         children: [
  //                                           //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
  //                                           Container(
  //                                               width: getWidth(Dimens.size112),
  //                                               //   color: MyColors.yellow,
  //                                               child: Text(
  //                                                 controller.startDate ?? "selectStartDate",
  //                                                 style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                                                 overflow: TextOverflow.ellipsis,
  //                                               )),
  //
  //                                           Icon(
  //                                             Icons.arrow_drop_down_outlined,
  //                                             color: Colors.blueAccent,
  //                                           )
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     Divider(
  //                                       //height: 20,
  //                                       thickness: 1,
  //                                       // indent: 20,
  //                                       endIndent: 0,
  //                                       color: MyColors.grey3,
  //                                     ),
  //                                     controller.startDate == null
  //                                         ? Text(
  //                                             startDates != null ? easy.tr(startDates.toString()) : "",
  //                                             style: TextStyles.red1MediumShadeSmallTextStyle,
  //                                           )
  //                                         : SizedBox(),
  //                                   ],
  //                                 ),
  //                               ),
  //                               // Container(
  //                               //   width: getWidth(Dimens.size150),
  //                               // ),
  //                               Container(
  //                                 height: getHeight(Dimens.size115),
  //                                 width: getWidth(Dimens.size170),
  //                                 child: Column(
  //                                   crossAxisAlignment: CrossAxisAlignment.start,
  //                                   children: [
  //                                     SizedBox(
  //                                       height: getHeight(Dimens.size20),
  //                                     ),
  //                                     Text(
  //                                       easy.tr("endDate"),
  //                                       style: TextStyles.veryDarkGrey12400PtTextStyle,
  //                                     ),
  //                                     SizedBox(
  //                                       height: getHeight(Dimens.size10),
  //                                     ),
  //                                     GestureDetector(
  //                                       onTap: () async {
  //                                         controller.selectEndDates(context, 0);
  //                                         controller.update();
  //                                       },
  //                                       child: Row(
  //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                         children: [
  //                                           //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
  //                                           Container(
  //                                               width: getWidth(Dimens.size140),
  //                                               //color: MyColors.yellow,
  //                                               child: Text(
  //                                                 controller.endDate ?? "selectEndDate",
  //                                                 style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                                                 overflow: TextOverflow.ellipsis,
  //                                               )),
  //                                           Icon(
  //                                             Icons.arrow_drop_down_outlined,
  //                                             color: Colors.blueAccent,
  //                                           )
  //                                         ],
  //                                       ),
  //                                     ),
  //                                     Divider(
  //                                       //height: 20,
  //                                       thickness: 1,
  //                                       // indent: 20,
  //                                       endIndent: 0,
  //                                       color: MyColors.grey3,
  //                                     ),
  //                                     controller.endDate == null
  //                                         ? Text(
  //                                             endDates != null ? easy.tr(endDates.toString()) : "",
  //                                             style: TextStyles.red1MediumShadeSmallTextStyle,
  //                                           )
  //                                         : SizedBox(),
  //                                   ],
  //                                 ),
  //                               ),
  //                             ],
  //                           )
  //                         : SizedBox(),
  //
  //                     SizedBox(
  //                       height: getHeight(Dimens.size57),
  //                     ),
  //                     GestureDetector(
  //                         onTap: () async {
  //                           if (controller.startDate == null) {
  //                             startDates = "selectDate";
  //                           } else if (controller.endDate == null) {
  //                             endDates = "selectDate";
  //                           } else {
  //                             controller.truckStatisticFunctions(controller.showSingleDataTruckModal.data!.id, controller.startDate, controller.endDate);
  //                             controller.isStatisticsLoading.value = !controller.isStatisticsLoading.value;
  //                             controller.thisMonth = controller.thisMonthTruck;
  //                             controller.update();
  //                           }
  //                           controller.update();
  //                         },
  //                         child: Container(
  //                             alignment: Alignment.center,
  //                             height: getHeight(Dimens.size50),
  //                             width: getWidth(Dimens.size320),
  //                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
  //                             child: controller.isStatisticsLoading.value
  //                                 ? Center(
  //                                     child: Text(
  //                                     easy.tr("apply"),
  //                                     style: TextStyles.white1PtMediumWeightTextStyle,
  //                                   )
  //                                     //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),
  //
  //                                     )
  //                                 : Center(
  //                                     child: LoadingCircle(),
  //                                   )))
  //                     // : LoadingCircle()));
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         });
  //       });
  // }
  //
  // // todo expense perio
  //
  // void startDateAndEndDateTruckPeriod(context) {
  //   final expenseController = Get.put(ExpensesController());
  //   SizeConfig().init(context);
  //   String? startDates;
  //   String? endDates;
  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
  //       isScrollControlled: true,
  //       //backgroundColor: Colors.black12,
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return GetBuilder<TruckController>(builder: (controller) {
  //           return SingleChildScrollView(
  //             physics: ScrollPhysics(),
  //             child: Container(
  //               padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),
  //
  //               //height: getHeight(Dimens.size348),
  //
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
  //                 color: Colors.white,
  //               ),
  //               child: Padding(
  //                 padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Center(
  //                       child: Container(
  //                         height: getHeight(Dimens.size6),
  //                         width: getWidth(Dimens.size30),
  //                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size26),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           easy.tr("period"),
  //                           style: TextStyles.LessWeight20PtTextStyle,
  //                         ),
  //                         GestureDetector(
  //                           onTap: () {
  //                             Get.back();
  //                           },
  //                           child: Text(
  //                             easy.tr("cancel"),
  //                             style: TextStyles.redLessWeight14PtTextStyle,
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size30),
  //                     ),
  //
  //                     SizedBox(
  //                       height: getHeight(Dimens.size14),
  //                     ),
  //                     //
  //                     // Container(
  //                     //   child: ListTile(
  //                     //     contentPadding: EdgeInsets.zero,
  //                     //     horizontalTitleGap: 0,
  //                     //     //  minLeadingWidth: 0,
  //                     //     leading: Container(
  //                     //         // color: Colors.red,
  //                     //         width: getWidth(Dimens.size300),
  //                     //         child: Text(
  //                     //           easy.tr("thisYear"),
  //                     //           style: TextStyles
  //                     //               .black14500BLACKPtHeavyWeightTextStyle,
  //                     //         )),
  //                     //
  //                     //     title: SizedBox(
  //                     //       height: 10,
  //                     //       //  width: 20,
  //                     //       child: Radio<PeriodCharacter>(
  //                     //         value: PeriodCharacter.thisYear,
  //                     //         groupValue: controller.periodCharacter,
  //                     //         onChanged: (PeriodCharacter? value) {
  //                     //           controller.periodCharacter = value;
  //                     //           controller.yearFunction();
  //                     //           controller.update();
  //                     //         },
  //                     //       ),
  //                     //     ),
  //                     //   ),
  //                     // ),
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.only(bottom: 5),
  //                         horizontalTitleGap: 0,
  //
  //                         //minLeadingWidth: 10,
  //                         leading: Container(
  //                             alignment: Alignment.centerLeft,
  //                             height: getHeight(Dimens.size100),
  //                             //color: MyColors.yellow,
  //                             width: getWidth(Dimens.size300),
  //                             child: Text(
  //                               easy.tr("thisMonth"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //                         title: SizedBox(
  //                           // width: 10,
  //                           child: Radio<PeriodCharacter>(
  //                             // visualDensity: VisualDensity(vertical: -5),
  //                             value: PeriodCharacter.thisMonth,
  //                             groupValue: controller.periodCharacter,
  //                             onChanged: (PeriodCharacter? value) {
  //                               controller.isCustomPeriod.value = false;
  //                               controller.periodCharacter = value;
  //                               expenseController.thisMonthFunction();
  //                               controller.thisMonthTruckTrue = "thisMonth";
  //                               controller.update();
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.zero,
  //                         horizontalTitleGap: 0,
  //                         //  minLeadingWidth: 10,
  //                         leading: Container(
  //                             //color: MyColors.red1,
  //                             alignment: Alignment.centerLeft,
  //                             height: getHeight(Dimens.size100),
  //                             width: getWidth(Dimens.size300),
  //                             child: Text(
  //                               easy.tr("threeMonth"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //                         title: SizedBox(
  //                           // width: 10,
  //                           child: Radio<PeriodCharacter>(
  //                             value: PeriodCharacter.threeMonth,
  //                             groupValue: controller.periodCharacter,
  //                             onChanged: (PeriodCharacter? value) {
  //                               controller.isCustomPeriod.value = false;
  //                               controller.periodCharacter = value;
  //                               expenseController.threeMonthFunction();
  //                               controller.thisMonthTruckTrue = "threeMonth";
  //                               controller.update();
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     // Container(
  //                     //   child: ListTile(
  //                     //     contentPadding: EdgeInsets.zero,
  //                     //     horizontalTitleGap: 0,
  //                     //     //  minLeadingWidth: 10,
  //                     //     leading: Container(
  //                     //         width: getWidth(Dimens.size300),
  //                     //         child: Text(
  //                     //           easy.tr("allMonths"),
  //                     //           style: TextStyles
  //                     //               .black14500BLACKPtHeavyWeightTextStyle,
  //                     //         )),
  //                     //     title: SizedBox(
  //                     //       // width: 10,
  //                     //       child: Radio<PeriodCharacter>(
  //                     //         value: PeriodCharacter.allMonths,
  //                     //         groupValue: controller.periodCharacter,
  //                     //         onChanged: (PeriodCharacter? value) {
  //                     //           controller.periodCharacter = value;
  //                     //           controller.update();
  //                     //         },
  //                     //       ),
  //                     //     ),
  //                     //   ),
  //                     // ),
  //
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.zero,
  //                         horizontalTitleGap: 0,
  //                         visualDensity: VisualDensity(horizontal: 0, vertical: 0),
  //                         //  minLeadingWidth: 10,
  //                         leading: Container(
  //                             alignment: Alignment.centerLeft,
  //                             height: getHeight(Dimens.size100),
  //                             width: getWidth(Dimens.size300),
  //                             // color: MyColors.yellow,
  //                             child: Text(
  //                               easy.tr("custom"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //                         title: Radio<PeriodCharacter>(
  //                           value: PeriodCharacter.custom,
  //                           groupValue: controller.periodCharacter,
  //                           onChanged: (PeriodCharacter? value) {
  //                             controller.isCustomPeriod.value = !controller.isCustomPeriod.value;
  //
  //                             controller.startDate = null;
  //                             controller.endDate = null;
  //
  //                             controller.periodCharacter = value;
  //                             controller.thisMonthTruckTrue = "custom";
  //                             controller.update();
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //
  //                     controller.isCustomPeriod.value
  //                         ? GetBuilder<ExpensesController>(builder: (expenseController) {
  //                             return Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Container(
  //                                   height: getHeight(Dimens.size115),
  //                                   width: getWidth(Dimens.size140),
  //                                   child: Column(
  //                                     crossAxisAlignment: CrossAxisAlignment.start,
  //                                     children: [
  //                                       SizedBox(
  //                                         height: getHeight(Dimens.size20),
  //                                       ),
  //                                       Text(
  //                                         easy.tr("startDate"),
  //                                         style: TextStyles.veryDarkGrey12400PtTextStyle,
  //                                       ),
  //                                       SizedBox(
  //                                         height: getHeight(Dimens.size10),
  //                                       ),
  //                                       GestureDetector(
  //                                         onTap: () async {
  //                                           expenseController.selectDates(context, 0);
  //                                           expenseController.update();
  //                                         },
  //                                         child: Row(
  //                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                           children: [
  //                                             //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
  //                                             Container(
  //                                                 width: getWidth(Dimens.size112),
  //                                                 //   color: MyColors.yellow,
  //                                                 child: Text(
  //                                                   expenseController.selectStartDateTrip ?? "selectStartDate",
  //                                                   style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                                                   overflow: TextOverflow.ellipsis,
  //                                                 )),
  //
  //                                             Icon(
  //                                               Icons.arrow_drop_down_outlined,
  //                                               color: Colors.blueAccent,
  //                                             )
  //                                           ],
  //                                         ),
  //                                       ),
  //                                       Divider(
  //                                         //height: 20,
  //                                         thickness: 1,
  //                                         // indent: 20,
  //                                         endIndent: 0,
  //                                         color: MyColors.grey3,
  //                                       ),
  //                                       expenseController.selectStartDateTrip == null
  //                                           ? Text(
  //                                               startDates != null ? easy.tr(startDates.toString()) : "",
  //                                               style: TextStyles.red1MediumShadeSmallTextStyle,
  //                                             )
  //                                           : SizedBox(),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 // Container(
  //                                 //   width: getWidth(Dimens.size150),
  //                                 // ),
  //                                 Container(
  //                                   height: getHeight(Dimens.size115),
  //                                   width: getWidth(Dimens.size170),
  //                                   child: Column(
  //                                     crossAxisAlignment: CrossAxisAlignment.start,
  //                                     children: [
  //                                       SizedBox(
  //                                         height: getHeight(Dimens.size20),
  //                                       ),
  //                                       Text(
  //                                         easy.tr("endDate"),
  //                                         style: TextStyles.veryDarkGrey12400PtTextStyle,
  //                                       ),
  //                                       SizedBox(
  //                                         height: getHeight(Dimens.size10),
  //                                       ),
  //                                       GestureDetector(
  //                                         onTap: () async {
  //                                           expenseController.selectEndDates(context, 0);
  //                                           expenseController.update();
  //                                         },
  //                                         child: Row(
  //                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                           children: [
  //                                             //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
  //                                             Container(
  //                                                 width: getWidth(Dimens.size140),
  //                                                 //color: MyColors.yellow,
  //                                                 child: Text(
  //                                                   expenseController.endDate ?? "selectEndDate",
  //                                                   style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                                                   overflow: TextOverflow.ellipsis,
  //                                                 )),
  //                                             Icon(
  //                                               Icons.arrow_drop_down_outlined,
  //                                               color: Colors.blueAccent,
  //                                             )
  //                                           ],
  //                                         ),
  //                                       ),
  //                                       Divider(
  //                                         //height: 20,
  //                                         thickness: 1,
  //                                         // indent: 20,
  //                                         endIndent: 0,
  //                                         color: MyColors.grey3,
  //                                       ),
  //                                       expenseController.endDate == null
  //                                           ? Text(
  //                                               endDates != null ? easy.tr(endDates.toString()) : "",
  //                                               style: TextStyles.red1MediumShadeSmallTextStyle,
  //                                             )
  //                                           : SizedBox(),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             );
  //                           })
  //                         : SizedBox(),
  //
  //                     SizedBox(
  //                       height: getHeight(Dimens.size57),
  //                     ),
  //                     GestureDetector(
  //                         onTap: () async {
  //                           if (expenseController.selectStartDateTrip == null) {
  //                             startDates = "selectDate";
  //                           } else if (expenseController.endDate == null) {
  //                             endDates = "selectDate";
  //                           } else {
  //                             expenseController.startDateAndEndDteTruckExpensesList(expenseController.selectStartDateTrip, expenseController.endDate);
  //                             expenseController.isStartDateAndEndDateTruckExpensesList.value = !expenseController.isStartDateAndEndDateTruckExpensesList.value;
  //                             controller.thisMonthTrue = controller.thisMonthTruckTrue;
  //                             controller.update();
  //                           }
  //                           controller.update();
  //                           expenseController.update();
  //                         },
  //                         child: Container(
  //                             alignment: Alignment.center,
  //                             height: getHeight(Dimens.size50),
  //                             width: getWidth(Dimens.size320),
  //                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
  //                             child: expenseController.isStartDateAndEndDateTruckExpensesList.value
  //                                 ? Center(
  //                                     child: Text(
  //                                     easy.tr("apply"),
  //                                     style: TextStyles.white1PtMediumWeightTextStyle,
  //                                   )
  //                                     //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),
  //
  //                                     )
  //                                 : Center(
  //                                     child: LoadingCircle(),
  //                                   )))
  //                     // : LoadingCircle()));
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         });
  //       });
  // }
  //
  // void allTripstruckModalBottomSheet(context) {
  //   SizeConfig().init(context);
  //   String? book;
  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
  //       isScrollControlled: true,
  //       //backgroundColor: Colors.black12,
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return GetBuilder<TruckController>(builder: (controller) {
  //           return SingleChildScrollView(
  //             physics: ScrollPhysics(),
  //             child: Container(
  //               padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),
  //
  //               //height: getHeight(Dimens.size348),
  //
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
  //                 color: Colors.white,
  //               ),
  //               child: Padding(
  //                 padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Center(
  //                       child: Container(
  //                         height: getHeight(Dimens.size6),
  //                         width: getWidth(Dimens.size30),
  //                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size26),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           easy.tr("books"),
  //                           style: TextStyles.LessWeight20PtTextStyle,
  //                         ),
  //                         GestureDetector(
  //                           onTap: () {
  //                             Get.back();
  //                           },
  //                           child: Text(
  //                             easy.tr("cancel"),
  //                             style: TextStyles.redLessWeight14PtTextStyle,
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size30),
  //                     ),
  //
  //                     SizedBox(
  //                       height: getHeight(Dimens.size14),
  //                     ),
  //
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.zero,
  //                         horizontalTitleGap: 0,
  //                         //  minLeadingWidth: 0,
  //                         leading: Container(
  //                             alignment: Alignment.centerLeft,
  //                             //  color: Colors.red,
  //                             height: getHeight(Dimens.size100),
  //                             width: getWidth(Dimens.size300),
  //                             child: Text(
  //                               easy.tr("allTripsExpenses"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //
  //                         title: SizedBox(
  //                           height: 10,
  //                           //  width: 20,
  //                           child: Radio<AllTripsCharacter>(
  //                             value: AllTripsCharacter.allTripsExpenses,
  //                             groupValue: controller.allTripsCharacter,
  //                             onChanged: (AllTripsCharacter? value) {
  //                               controller.allTripsCharacter = value;
  //                               book = "";
  //                               controller.booksName = "allTripsExpenses";
  //                               print(book);
  //                               controller.update();
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.zero,
  //                         horizontalTitleGap: 0,
  //                         //  minLeadingWidth: 10,
  //                         leading: Container(
  //                             //  color: MyColors.yellow,
  //                             alignment: Alignment.centerLeft,
  //                             height: getHeight(Dimens.size100),
  //                             width: getWidth(Dimens.size300),
  //                             child: Text(
  //                               easy.tr("tripBook"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //                         title: SizedBox(
  //                           // width: 10,
  //                           child: Radio<AllTripsCharacter>(
  //                             value: AllTripsCharacter.tripBook,
  //                             groupValue: controller.allTripsCharacter,
  //                             onChanged: (AllTripsCharacter? value) {
  //                               controller.allTripsCharacter = value;
  //                               book = "trip";
  //                               controller.booksName = "tripBook";
  //                               print(book);
  //                               controller.update();
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.zero,
  //                         horizontalTitleGap: 0,
  //                         //  minLeadingWidth: 10,
  //                         leading: Container(
  //                             alignment: Alignment.centerLeft,
  //                             height: getHeight(Dimens.size100),
  //                             width: getWidth(Dimens.size300),
  //                             child: Text(
  //                               easy.tr("fuelBook"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //                         title: SizedBox(
  //                           // width: 10,
  //                           child: Radio<AllTripsCharacter>(
  //                             value: AllTripsCharacter.fuelBook,
  //                             groupValue: controller.allTripsCharacter,
  //                             onChanged: (AllTripsCharacter? value) {
  //                               controller.allTripsCharacter = value;
  //                               book = "fuel";
  //                               controller.booksName = "fuelBook";
  //                               print(book);
  //                               controller.update();
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.zero,
  //                         horizontalTitleGap: 0,
  //                         //  minLeadingWidth: 10,
  //                         leading: Container(
  //                             alignment: Alignment.centerLeft,
  //                             height: getHeight(Dimens.size100),
  //                             width: getWidth(Dimens.size300),
  //                             child: Text(
  //                               easy.tr("serviceBooks"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //                         title: SizedBox(
  //                           // width: 10,
  //                           child: Radio<AllTripsCharacter>(
  //                             value: AllTripsCharacter.serviceBooks,
  //                             groupValue: controller.allTripsCharacter,
  //                             onChanged: (AllTripsCharacter? value) {
  //                               controller.allTripsCharacter = value;
  //                               book = "service";
  //                               controller.booksName = "serviceBooks";
  //                               print(book);
  //                               controller.update();
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       child: ListTile(
  //                         contentPadding: EdgeInsets.zero,
  //                         horizontalTitleGap: 0,
  //                         //  minLeadingWidth: 0,
  //                         leading: Container(
  //                             alignment: Alignment.centerLeft,
  //                             height: getHeight(Dimens.size100),
  //                             // color: Colors.red,
  //                             width: getWidth(Dimens.size300),
  //                             child: Text(
  //                               easy.tr("otherExpense"),
  //                               style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
  //                             )),
  //
  //                         title: SizedBox(
  //                           height: 10,
  //                           //  width: 20,
  //                           child: Radio<AllTripsCharacter>(
  //                             value: AllTripsCharacter.driversExpense,
  //                             groupValue: controller.allTripsCharacter,
  //                             onChanged: (AllTripsCharacter? value) {
  //                               controller.allTripsCharacter = value;
  //                               book = "other";
  //                               controller.booksName = "otherExpense";
  //                               print(book);
  //                               controller.update();
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: getHeight(Dimens.size57),
  //                     ),
  //                     GetBuilder<ExpensesController>(builder: (expenseController) {
  //                       return GestureDetector(
  //                           onTap: () async {
  //                             expenseController.isTruckLoading.value = !expenseController.isTruckLoading.value;
  //                             expenseController.getTruckExpensesList(book, expenseController.startDate.toString(), expenseController.endDate.toString());
  //                             controller.booksNameBYSelecting = controller.booksName;
  //                             expenseController.update();
  //                             controller.update();
  //                             expenseController.isTruckLoading.value == true ? null : Get.back();
  //                           },
  //                           child: Container(
  //                               alignment: Alignment.center,
  //                               height: getHeight(Dimens.size50),
  //                               width: getWidth(Dimens.size320),
  //                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
  //                               child: expenseController.isTruckLoading.value
  //                                   ? Center(
  //                                       child: Text(
  //                                       easy.tr("apply"),
  //                                       style: TextStyles.white1PtMediumWeightTextStyle,
  //                                     )
  //                                       //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),
  //
  //                                       )
  //                                   : Center(
  //                                       child: LoadingCircle(),
  //                                     )));
  //                     })
  //                     // : LoadingCircle()));
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         });
  //       });
  // }
}
