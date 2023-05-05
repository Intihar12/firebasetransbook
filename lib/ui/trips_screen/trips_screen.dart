import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:firebasetransbook/controllers/client_controller/client_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/driver_controller/driver_controller.dart';
import '../../controllers/trip_controller/trip_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';
import '../../values/size_config.dart';
import '../../widgets/trips_list_widget.dart';
import 'add_trips.dart';

class TripsScreen extends StatelessWidget {
  // TripsScreen({Key? key, }) : super(key: key);
  TripController tripController = Get.find();
  DriverController driverController = Get.find();
  ClientController clientController = Get.find();
  //int? id;
  int? selectedId;
  int? selectedClientId;
  bool? isSelected;
  Timer? debounce;
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<TripController>(builder: (controller) {
      return Scaffold(
          backgroundColor: MyColors.white,
          //  floatingActionButtonLocation: controller.isSelectFilter.value == false || controller.tripListModal.data != null && controller.tripListModal.data!.length > 0 ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              child: FloatingActionButton(
                onPressed: () {
                  controller.isCreateTripLoading.value = true;

                  Get.to(AddTrips());

                  // Get.to(AddTrips());
                  // controller.clientData = true;
                  // controller.isaddTrip.value = false;
                  // controller.isCreateTripLoading.value = true;
                  // controller.isAddDetails.value = false;
                  // controller.totalAmount = 0;
                  // //   controller.selectClient.id = null;
                  // //  controller.selectClient = null;
                  // controller.updateRateController.clear();
                  // controller.updateSupplierAmountController.clear();
                  // controller.updateSupplierRateController.clear();
                  //
                  // controller.parentId = null;
                  //
                  // controller.suplierId = null;
                  // controller.drId = null;
                  // controller.truckId = null;
                  // controller.supplierName = null;
                  // controller.driverName = null;
                  // controller.clientName = null;
                  // controller.truckName = null;
                  // controller.localOrigin = null;
                  // controller.localDistination = null;
                  // controller.partyAmountController.clear();
                  // controller.selectStartDateTrip = null;
                  // controller.rateController.clear();
                  // controller.totalRateController.clear();
                  // controller.supplierAmountController.clear();
                  // controller.tripLrController.clear();
                  // controller.startKmController.clear();
                  // controller.materialController.clear();
                  // controller.noteController.clear();

                  controller.update();
                },
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
                backgroundColor: MyColors.blue1,
              )),
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
                      GestureDetector(
                        onTap: () {
                          //   Get.to(CheckBoxInListView());
                        },
                        child: Text(
                          "trips",
                          style: TextStyles.blackMediumWeight18PtTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            // controller: controller.controller,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: getWidth(Dimens.size250),
                        child: TextField(
                          //    cursorColor: MyColors.grey3,
                          focusNode: myFocusNode,
                          // controller: controller.searchControlle,
                          onChanged: (value) {
                            if (debounce?.isActive ?? false) debounce?.cancel();
                            debounce = Timer(Duration(milliseconds: 200), () {
                              // if (controller.searchControlle.text.isNotEmpty) {
                              //   controller.searchTripFunction(value);
                              // } else {
                              //   controller.tripList();
                              // }
                            });
                          },
                          cursorColor: MyColors.grey3,
                          style: TextStyles.black1PtLessWeightTextStyle,

                          inputFormatters: [LengthLimitingTextInputFormatter(20)],
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.grey3),
                              ),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                              labelStyle: TextStyle(color: myFocusNode.hasFocus ? MyColors.grey3 : MyColors.grey3),
                              //contentPadding: EdgeInsets.only(top: 15,),
                              prefixIcon: Container(
                                  height: 0,
                                  width: 0,
                                  padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                                  //color: MyColors.yellow,
                                  child: Icon(Icons.search)),
                              prefixIconConstraints: BoxConstraints(
                                minWidth: 30,
                                minHeight: 25,
                              ),
                              hintText: "searchforTrips",
                              hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            // filterBottomSheet(context);
                            // controller.isSelectFilter.value = true;
                            // controller.isFilterLoading.value = true;
                            // controller.update();
                            // controller.selectStartDateTrip = null;
                            // //
                            // controller.selectEndDateTrip = null;
                            //controller.tripsearchlist.clear();
                          },
                          child: Text(
                            "filters",
                            style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                          ))
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: getHeight(Dimens.size44),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: getHeight(Dimens.size10),
                                  width: getWidth(Dimens.size10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColors.green1,
                                  ),
                                ),
                                Text(
                                  "filterHaveBeenApplied",
                                  style: TextStyles.black14blackBLACKPtHeavyWeightTextStyle,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.update();
                                  },
                                  child: Text(
                                    "clear",
                                    style: TextStyles.red1LessWeight14PtTextStyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size30),
                      ),
                      ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0),
                                child: TripDetailsWidget(
                                  name: "intihar",
                                  idnum: "truck num",
                                  balance: "\$0",
                                  origin: "orign",
                                  destination: "distination",
                                  //    date: "${controller.tripFountsearchlist[index].startDate}",

                                  //  "${formatDate(element.date!,[ dd, ' ', D])}",
                                  date: "2022/2/3",
                                  lrn: "lnr",
                                  status: "status",
                                  //status: easy.tr("started"),
                                ),
                              ),
                            );
                          })
                    ],
                  )

                  //   Center(child: LoadingCircle(),)
                ],
              ),
            ),
          ));
    });
  }
}
