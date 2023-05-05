import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants.dart';

import '../../controllers/country_code_controller/country_code_controller.dart';
import '../../controllers/driver_controller/driver_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';

import '../../values/my_imgs.dart';
import '../../values/size_config.dart';
import '../../widgets/county_code_widget.dart';

class DriverDetails extends StatelessWidget {
  DriverDetails({Key? key, this.id, this.name, this.balance}) : super(key: key);
  final int? id;
  final String? name;
  int? balance;

  final _formKey = GlobalKey<FormState>();
  //TripController tripController=Get.find();
  final countryCodController = Get.put(CountryController());
  DriverController driverController = Get.find();
  //final statisticController = Get.put(StatisticsController());
  String? avatarText;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<DriverController>(builder: (driverController) {
      return Scaffold(
          backgroundColor: MyColors.white,
          bottomNavigationBar: bottomButton(context),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              driverController.driverModal.driverName.toString(),
                              style: TextStyles.blackMediumWeight18PtTextStyle,
                            ),
                            Text(
                              "Available",
                              style: TextStyles.green1LessWeight12PtTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                      onTap: () {
                        driverBottomSheet(context);
                      },
                      child: Icon(
                        Icons.more_horiz,
                        color: MyColors.blue1,
                      ))
                  // Image.asset(
                  //   MyImgs.notificationIcon,
                  //   width: Dimens.size21,
                  //   height: Dimens.size24,
                  // )
                ],
              )),
          body: driverController.isDriverDetailsLoading.value
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getHeight(Dimens.size20),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //    driverController.balanceFunction(),
                            driverController.driverModal.negativeSign == "-"
                                ? Text(
                                    "Collect from driver",
                                    style: TextStyles.black14400BLACKPtHeavyWeightTextStyle,
                                  )
                                : Text(
                                    "   Pay To Driver",
                                    style: TextStyles.black14400BLACKPtHeavyWeightTextStyle,
                                  ),
                            Text(
                              "${driverController.driverModal.negativeSign != null ? driverController.driverModal.negativeSign : ""}" +
                                  "\$${driverController.driverModal.balance != null ? driverController.driverModal.balance.toString() : ""}",
                              style: driverController.driverModal.negativeSign != "-"
                                  ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                                  : TextStyles.red1LessWeight14PtTextStyle,
                            ),
                            SizedBox(
                              width: getWidth(Dimens.size40),
                            ),
                            InkWell(
                              highlightColor: MyColors.white,
                              onTap: () {
                                driverController.driverExpenseLoading.value = true;

                                amountSettleBottomSheet(context, driverController.driverModal.balance, driverController.driverModal.driverId);
                                driverController.update();
                              },
                              child: Text(
                                "settleAmount",
                                style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                              ),
                            )
                          ],
                        ),

                        // Container(
                        //   height: Dimens.size60,
                        //   width: Dimens.size370,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: MyColors.white,
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.black26,
                        //         blurRadius: 3,
                        //         // spreadRadius: 0.3,
                        //         offset: Offset(
                        //           0,
                        //           2,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 15.0, right: 15),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Image.asset(
                        //           MyImgs.viewReporysImg,
                        //           width: Dimens.size17,
                        //           height: Dimens.size20,
                        //           color: MyColors.blue1,
                        //         ),
                        //         GestureDetector(
                        //           onTap: () {
                        //             //Get.to(SupplierDetailsScreen());
                        //           },
                        //           child: Text(
                        //             easy.tr("viewreports"),
                        //             style: TextStyle(
                        //                 fontSize: 14,
                        //                 fontWeight: FontWeight.w500),
                        //           ),
                        //         ),
                        //         GestureDetector(
                        //             onTap: () {
                        //               // Get.to(HomeScreen());
                        //             },
                        //             child: Image.asset(
                        //               MyImgs.arrowForward,
                        //               width: getWidth(
                        //                 Dimens.size14,
                        //               ),
                        //               height: getHeight(Dimens.size10),
                        //               color: MyColors.blue1,
                        //             ))
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: getHeight(Dimens.size30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "reason",
                              style: TextStyles.black14500PtHeavyWeightTextStyle,
                            ),
                            Text(
                              "gave",
                              style: TextStyles.black14500PtHeavyWeightTextStyle,
                            ),
                            Text(
                              "got",
                              style: TextStyles.black14500PtHeavyWeightTextStyle,
                            )
                          ],
                        ),
                        SizedBox(
                          height: getHeight(Dimens.size20),
                        ),
                        // driverController.getDriverGaveGotModal.data != null && driverController.getDriverGaveGotModal.data!.length > 0
                        //     ? ListView.builder(
                        //     itemCount: driverController.getDriverGaveGot.length,
                        //     shrinkWrap: true,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return Padding(
                        //         padding: const EdgeInsets.only(bottom: 20),
                        //         child: Container(
                        //             child: Row(
                        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //               children: [
                        //                 Container(
                        //                   width: getWidth(Dimens.size140),
                        //                   //color: MyColors.yellow,
                        //                   child: Column(
                        //                     crossAxisAlignment: CrossAxisAlignment.start,
                        //                     children: [
                        //                       Text(
                        //                         driverController.getDriverGaveGot[index].type ?? "Trip Payment",
                        //                         style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                        //                       ),
                        //                       SizedBox(
                        //                         height: getHeight(Dimens.size6),
                        //                       ),
                        //                       Text(
                        //                         driverController.getDriverGaveGot[index].date != null ? "${formatDate(driverController.getDriverGaveGot[index].date!, [dd, " ", M, " ", yyyy])}" : "",
                        //                         style: TextStyles.veryDarkGrey12400PtTextStyle,
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //                 Container(
                        //                   width: getWidth(Dimens.size70),
                        //                   //   color: MyColors.red1,
                        //                   child: driverController.getDriverGaveGot[index].amount! < 0
                        //                       ? Text(
                        //                     easy.tr("currencySymbol") + "${driverController.getDriverGaveGot[index].amount.toString()}",
                        //                     style: TextStyles.red1LessWeight14PtTextStyle,
                        //                   )
                        //                       : SizedBox(),
                        //                 ),
                        //                 Container(
                        //                   //  color: MyColors.red1,
                        //                   width: getWidth(Dimens.size90),
                        //                   child: driverController.getDriverGaveGot[index].amount! >= 0
                        //                       ? Column(
                        //                     crossAxisAlignment: CrossAxisAlignment.end,
                        //                     children: [
                        //                       Text(
                        //                         easy.tr("currencySymbol") + driverController.getDriverGaveGot[index].amount.toString(),
                        //                         style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                        //                       ),
                        //                       SizedBox(
                        //                         height: getHeight(Dimens.size6),
                        //                       ),
                        //                       driverController.getDriverGaveGot[index].context?.tripId != null
                        //                           ? Text(
                        //                         "From Trip",
                        //                         style: TextStyles.veryDarkGrey12400PtTextStyle,
                        //                       )
                        //                           : SizedBox()
                        //                     ],
                        //                   )
                        //                       : SizedBox(),
                        //                 )
                        //               ],
                        //             )),
                        //       );
                        //     })
                        //     : Padding(
                        //   padding: const EdgeInsets.only(top: 30.0),
                        //   child: Center(
                        //     child: Text(easy.tr("noDriverGaveGot")),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )
          //     : Center(
          //   child: BlueLoadingCircle(),
          // ),
          );
      // : Center(
      //     child: CircularProgressIndicator(),
      //   );
    });
  }

  Widget bottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GetBuilder<DriverController>(builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                // controller.reduceDriverBalance = "reduceDriverBalance";
                // DriverGraveGotWidget(context);
                // controller.driverExpenseLoading.value = true;
                // controller.driverGave = true;
                // print(controller.driverGave);
              },
              child: Container(
                height: getHeight(Dimens.size50),
                alignment: Alignment.center,
                width: getWidth(Dimens.size154),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100), color: MyColors.white, border: Border.all(color: MyColors.blue1, width: 2)),
                child: Text(
                  "driverGave",
                  style: TextStyles.blue14500PtHeavyWeightTextStyle,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // controller.reduceDriverBalance = "addDriverBalance";
                // DriverGraveGotWidget(context);
                // controller.driverGave = false;
                // controller.driverExpenseLoading.value = true;
                //
                // print(controller.driverGave);
              },
              child: Container(
                height: getHeight(Dimens.size50),
                alignment: Alignment.center,
                width: getWidth(Dimens.size154),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100), color: MyColors.blue1, border: Border.all(color: MyColors.blue1, width: 2)),
                child: Text(
                  "driverGot",
                  style: TextStyles.white1PtMediumWeightTextStyle,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void driverBottomSheet(context) {
    SizeConfig().init(context);

    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        isScrollControlled: true,
        //backgroundColor: Colors.black12,
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: GetBuilder<DriverController>(builder: (driverController) {
              return Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),

                //height: getHeight(Dimens.size348),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                            "${driverController.driverModal.driverName}",
                            style: TextStyles.LessWeight20PtTextStyle,
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
                      InkWell(
                        highlightColor: MyColors.white,
                        onTap: () {
                          driverController.isUpdateDriver.value = true;
                          //  driverController.buttonLoading.value = true;
                          driverController.isOpeningBalance.value = false;
                          Get.back();
                          updateDriverBottomSheet(context, driverController.driverModal.negativeSign == '-' ? true : false);
                          // driverController.getSingleDriverDetails(driverController.singleDriverShowModal.data!.id);

                          //Get.to(EditClient(id: id,),)!.then((value) => Navigator.pop(context));;
                          // controller.update();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "editDriver",
                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                            ),
                            Image.asset(
                              MyImgs.arrowForward,
                              width: getWidth(Dimens.size14),
                              height: getHeight(Dimens.size10),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size30),
                      ),
                      InkWell(
                        highlightColor: MyColors.white,
                        onTap: () {
                          // driverController.buttonLoading.value = true;
                          // Get.back();
                          deleteClientBottomSheet(context);
                          //
                          // driverController.update();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "deleteDriver",
                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                            ),
                            Image.asset(
                              MyImgs.arrowForward,
                              width: getWidth(Dimens.size14),
                              height: getHeight(Dimens.size10),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: getHeight(Dimens.size50),
                      ),
                      // Container(
                      //     alignment: Alignment.center,
                      //     height: getHeight(Dimens.size50),
                      //     width: getWidth(Dimens.size320),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(100),
                      //         color: Colors.blue),
                      //     child:  Center(
                      //         child: Text(
                      //           easy.tr("confrim"),
                      //           style: TextStyles
                      //               .white1PtMediumWeightTextStyle,
                      //         )
                      //       //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),
                      //
                      //     )
                      // )
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }

  void amountSettleBottomSheet(context, int? amount, int id) {
    DriverController driverController = Get.find();
    SizeConfig().init(context);
    TextEditingController amountController = TextEditingController();
    driverController.amountController.text = amount.toString();
    String? selectReason;
    String? selectDate;
    // driverController.driverReason = null;
    // driverController.selectStartDateTrip = null;
    // //driverController.amountController.clear();
    // driverController.noteController.clear();
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        isScrollControlled: true,
        //backgroundColor: Colors.black12,
        context: context,
        builder: (BuildContext bc) {
          print(driverController.amountController.text);
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: GetBuilder<DriverController>(builder: (driverController) {
              return Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),

                //height: getHeight(Dimens.size348),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                            "settleAmount",
                            style: TextStyles.LessWeight20PtTextStyle,
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
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        width: getWidth(Dimens.size320),
                        height: getHeight(Dimens.size44),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "amountToBeSettled",
                              style: TextStyles.black16500PtTextStyle,
                            ),
                            Text("\$${amount}", style: TextStyles.black16500PtTextStyle)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size20),
                      ),
                      Container(
                        //  width: getWidth(Dimens.size150),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getHeight(Dimens.size20),
                            ),
                            // Text(
                            //   easy.tr("amount"),
                            //   style: TextStyles.veryDarkGrey12400PtTextStyle,
                            // ),
                            // TextFormField(
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return easy.tr("enterAmount");
                            //     }
                            //   },
                            //   keyboardType: TextInputType.number,
                            //   controller: driverController.amountController,
                            //   decoration: InputDecoration(
                            //       prefixIconConstraints: BoxConstraints(
                            //         minWidth: 25,
                            //         minHeight: 25,
                            //       ),
                            //       hintText: "amount",
                            //       hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                            // ),
                            // SizedBox(
                            //   height: getHeight(Dimens.size20),
                            // ),
                            Text(
                              "reason",
                              style: TextStyles.veryDarkGrey12400PtTextStyle,
                            ),
                            SizedBox(
                              height: getHeight(Dimens.size10),
                            ),
                            GestureDetector(
                              onTap: () async {
                                // var data = await Get.to(DriverExpenseType());
                                // if (data != null) {
                                //   driverController.driverReason = data;
                                // }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                  Text(
                                    "selectReason",
                                    style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                  ),

                                  Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Colors.blueAccent,
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              //height: 20,
                              thickness: 1,
                              // indent: 20,
                              endIndent: 0,
                              color: MyColors.grey3,
                            ),
                          ],
                        ),
                      ),
                      // driverController.driverReason == null
                      //     ? Text(
                      //   selectReason != null ? easy.tr(selectReason.toString()) : "",
                      //   style: TextStyles.black1LessWeightred12PtTextStyle,
                      // )
                      //     : SizedBox(),
                      SizedBox(
                        height: getHeight(Dimens.size20),
                      ),
                      Text(
                        "date",
                        style: TextStyles.veryDarkGrey12400PtTextStyle,
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size25),
                      ),
                      InkWell(
                        onTap: () {
                          // driverController.selectDates(context, 0);
                          // driverController.update();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                            Text(
                              driverController.selectStartDateTrip != null ? driverController.selectStartDateTrip.toString() : "selectDate",
                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                            ),

                            Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.blueAccent,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        //height: 20,
                        thickness: 1,
                        // indent: 20,
                        endIndent: 0,
                        color: MyColors.grey3,
                      ),
                      // driverController.selectStartDateTrip == null
                      //     ? Text(
                      //         selectDate != null ? easy.tr(selectDate.toString()) : "",
                      //         style: TextStyles.black1LessWeightred12PtTextStyle,
                      //       )
                      //     : SizedBox(),
                      SizedBox(
                        height: getHeight(Dimens.size20),
                      ),
                      Text(
                        "notesOptional",
                        style: TextStyles.veryDarkGrey12400PtTextStyle,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        //controller: driverController.noteController,
                        decoration: InputDecoration(
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 25,
                              minHeight: 25,
                            ),
                            hintText: "yourTextHere",
                            hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size50),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // if (driverController.driverReason == null) {
                          //   selectReason = "selectReason";
                          // } else if (driverController.selectStartDateTrip == null) {
                          //   selectDate = "selectDate";
                          // } else {
                          //   driverController.driverExpenseLoading.value = !driverController.driverExpenseLoading.value;
                          //
                          //   driverController.driverExpenseLoading.value == true
                          //       ? null
                          //       : driverController.createGaveGotButton(driverController.singleDriverShowModal.data?.id);
                          //
                          //   driverController.driverExpenseLoading.value = false;
                          //   driverController.update();
                          // controller.update();
                          //   }

                          // controller.driverExpenseLoading.value = true;
                          // driverController.update();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: getHeight(Dimens.size50),
                            width: getWidth(Dimens.size320),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: MyColors.blue1,
                            ),
                            child: Center(
                                child: Text(
                              "confrim",
                              style: TextStyles.white1PtMediumWeightTextStyle,
                            )
                                //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),

                                )
                            // : LoadingCircle()
                            ),
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }

  void deleteClientBottomSheet(context) {
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
                          GetBuilder<DriverController>(builder: (driverController) {
                            return GestureDetector(
                                onTap: () {
                                  Get.back();
                                  // driverController.buttonLoading.value = !driverController.buttonLoading.value;
                                  // driverController.deleteDriverFunctions(driverController.singleDriverShowModal.data!.id);
                                  // driverController.update();
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    alignment: Alignment.center,
                                    height: getHeight(Dimens.size40),
                                    // width: getWidth(Dimens.size70),
                                    decoration: BoxDecoration(color: MyColors.blue1, borderRadius: BorderRadius.circular(20)),
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

  /// update driver bottom sheet

  void updateDriverBottomSheet(BuildContext context, bool isEditing) {
    // Api api = Api();
    SizeConfig().init(context);

    if (isEditing) {
      driverController.character = SingingCharacter.driverHasToPay;
      driverController.driverGaveGotBool = true;
    } else {
      driverController.character = SingingCharacter.driverHasToGet;
      driverController.driverGaveGotBool = false;
    }
    // isEditing ? driverController.driverModal.negativeSign =='-' ? SingingCharacter.driverHasToPay : SingingCharacter.driverHasToGet ;
    // driverController.driverModal.negativeSign == '-'
    //     ? driverController.character = SingingCharacter.driverHasToPay
    //     : driverController.character = SingingCharacter.driverHasToGet;
    // driverController.driverModal.negativeSign == '-' ? driverController.driverGaveGotBool = true : driverController.driverGaveGotBool = false;
    String? chooseCode;
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
                              "updateDriver",
                              style: TextStyles.LessWeight20PtTextStyle,
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
                              return "pleaseEnterNmae";
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
                            hintStyle: TextStyles.blackLessWeight14PtTextStyle,
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
                                  driverController.codeNum = countryController.selectedValueCountry?.name.toString();
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
                                driverController.codeNum == null
                                    ? Text(
                                        "chooseCode",
                                        style: TextStyles.red1LessWeight14PtTextStyle,
                                      )
                                    : SizedBox(),
                              ],
                            ),
                            SizedBox(
                              width: getWidth(Dimens.size230),
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(11),
                                ],
                                controller: driverController.phoneController,
                                keyboardType: TextInputType.number,
                                //controller: mobileNumberController,
                                maxLines: 1,
                                onChanged: (str) {
                                  if (str.isNotEmpty) {
                                    driverController.update();
                                    // setState(() {
                                    //   isMobileNumberValid = true;
                                    // });
                                  } else {
                                    driverController.update();
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
                                  contentPadding: EdgeInsets.fromLTRB(2, 13, 8, 0),
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
                        GestureDetector(
                            onTap: () {
                              driverController.isOpeningBalance.value = !driverController.isOpeningBalance.value;
                              //  driverController.isOpeningBalance.value = false;
                              print("textValue");
                              print(driverController.isOpeningBalance.value);
                              driverController.update();
                            },
                            child: Text(
                              "addOpeningBalances",
                              style: driverController.isOpeningBalance.value || driverController.amountController.text.isNotEmpty
                                  ? TextStyles.black14500PtHeavyWeightTextStyle
                                  : TextStyles.blue16textStyle,
                            )),
                        driverController.isOpeningBalance.value == true || driverController.amountController.text.isNotEmpty
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   easy.tr("openingBalance"),
                                    //   style: TextStyles.black14500PtHeavyWeightTextStyle,
                                    // ),
                                    // SizedBox(
                                    //   height: getHeight(Dimens.size23),
                                    // ),
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

                                                  driverController.intuu();
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
                                ))
                            : SizedBox(),
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
                        //     Switch(
                        //       value: driverController.status,
                        //       onChanged: (value) {
                        //         driverController.status = value;
                        //         // clientModal.shareBank=controller.status;
                        //         driverController.update();
                        //       },
                        //       activeColor: Colors.blue,
                        //       activeTrackColor: Colors.blue,
                        //       inactiveThumbColor: Colors.black45,
                        //       inactiveTrackColor: Colors.grey,
                        //     ),
                        //     // onPressed: ()=>"",
                        //   ],
                        // ),
                        SizedBox(
                          height: getHeight(Dimens.size57),
                        ),
                        GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                if (driverController.phoneController.text.isNotEmpty && driverController.codeNum == null) {
                                  chooseCode = "chooseCode";
                                  driverController.update();
                                } else {
                                  driverController.isUpdateDriver.value = !driverController.isUpdateDriver.value;
                                  // Get.back();
                                  driverController.isUpdateDriver.value == true
                                      ? null
                                      : driverController.updateDriver(driverController.driverModal.driverId);
                                  driverController.isUpdateDriver.value = false;
                                  print("driver");
                                  driverController.update();
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
                                child: driverController.isUpdateDriver.value
                                    ? Center(
                                        child: Text(
                                        "confrim",
                                        style: TextStyles.white1PtMediumWeightTextStyle,
                                      )
                                        //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),

                                        )
                                    : Center(
                                        child: CircularProgressIndicator(),
                                      )))
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
