import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

import '../../controllers/client_controller/client_controller.dart';
import '../../controllers/driver_controller/driver_controller.dart';
import '../../controllers/trip_controller/trip_controller.dart';
import '../../controllers/truck_controller/truck_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';
import '../../values/size_config.dart';
import '../../widgets/radio_custom_widget.dart';
import 'choose_clients/choose_clients.dart';
import 'choose_driver/choose_driver.dart';
import 'choose_truck/choose_truck.dart';

class AddTrips extends StatelessWidget {
  AddTrips({
    Key? key,
    this.id,
  }) : super(key: key);
  final int? id;
  String? selectedId;
  ClientController clientController = Get.find();
  DriverController driverController = Get.find();
  TruckController truckController = Get.find();
  // TruckController truckController = Get.find();
  final formKey = GlobalKey<FormState>();

  //radioButton.RadioModel selectedItem;
  TripController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<TripController>(builder: (controller) {
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
                      "Add Trips",
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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //  width: getWidth(Dimens.size150),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getHeight(Dimens.size20),
                        ),
                        Text(
                          "Client",
                          style: TextStyles.veryDarkGrey12400PtTextStyle,
                        ),
                        SizedBox(
                          height: getHeight(Dimens.size10),
                        ),
                        InkWell(
                          highlightColor: MyColors.white,
                          onTap: controller.clientData == true
                              ? () async {
                                  clientController.getClientData();
                                  var data = await Get.to(ChooseClients());
                                  if (data != null) {
                                    controller.clientName = data;
                                  }
                                  clientController.update();
                                  // controller.isChooseClientLoading.value = true;
                                  // clientController.isLoad.value = false;
                                  // clientController.isContactLoading.value = false;
                                  // clientController.clientList();
                                  //
                                  // clientController.allContact();
                                  // var data = await Get.to(ChooseClients(
                                  //   id: id,
                                  // ));
                                  //
                                  // clientController.update();
                                  // controller.update();
                                  // // clientController.update();
                                  // // print("onTab client");
                                  // if (data != null) {
                                  //   controller.clientName = data;
                                  // }
                                }
                              : () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                              Text(
                                controller.clientName ?? "chooseClient",
                                style: controller.clientName != null
                                    ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                                    : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
                              ),

                              controller.clientData == true
                                  ? Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Colors.blueAccent,
                                    )
                                  : SizedBox()
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
                  controller.clientName == null
                      ? Text(
                          selectClient != null ? selectClient! : "",
                          style: TextStyles.black1LessWeightred12PtTextStyle,
                        )
                      : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: getHeight(Dimens.size115),
                        width: getWidth(Dimens.size154),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getHeight(Dimens.size20),
                            ),
                            Text(
                              "truckss",
                              style: TextStyles.veryDarkGrey12400PtTextStyle,
                            ),
                            SizedBox(
                              height: getHeight(Dimens.size10),
                            ),
                            GestureDetector(
                              onTap: () async {
                                truckController.getTruckData();
                                var data = await Get.to(ChooseTruck());
                                if (data != null) {
                                  controller.truckName = data;
                                }
                                // var data = await Get.to(ChooseTruckNumber(
                                //   id: id,
                                // ));
                                //
                                // if (data != null) {
                                //   controller.truckName = data;
                                //   if (controller.selectTruck.supplierId != null) {
                                //     controller.drId = "";
                                //   } else {
                                //     controller.suplierId = "";
                                //   }
                                // }
                                // truckController.truckList();
                                truckController.update();
                                controller.update();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                  Container(
                                    width: getWidth(Dimens.size120),
                                    // color: MyColors.yellow,
                                    child: Text(
                                      controller.truckName != null ? controller.truckName.toString() : "chooseTruck",
                                      maxLines: 1,
                                      style: controller.truckName != null
                                          ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                                          : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
                                    ),
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
                            controller.truckName == null
                                ? Text(
                                    selectTruck != null ? selectTruck! : "",
                                    style: TextStyles.black1LessWeightred12PtTextStyle,
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      // Container(
                      //   width: getWidth(Dimens.size150),
                      // ),

                      truckController.truckModalSingleData.supplierId == null
                          ? GestureDetector(
                              onTap: () async {
                                driverController.getDriverListData();
                                var data = await Get.to(ChooseDriver());
                                if (data != null) {
                                  controller.driverName = data;
                                }
                                driverController.update();
                                controller.update();
                              },
                              child: Container(
                                height: getHeight(Dimens.size115),
                                width: getWidth(Dimens.size154),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: getHeight(Dimens.size20),
                                    ),
                                    Text(
                                      "driverNameOptional",
                                      style: TextStyles.veryDarkGrey12400PtTextStyle,
                                    ),
                                    SizedBox(
                                      height: getHeight(Dimens.size10),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                        Container(
                                            //color:Colors.red,
                                            width: getWidth(Dimens.size120),
                                            child: Text(
                                              controller.driverName != null ? controller.driverName.toString() : "enterName",
                                              style: controller.driverName != null
                                                  ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                                                  : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
                                              overflow: TextOverflow.ellipsis,
                                            )),

                                        Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Colors.blueAccent,
                                        )
                                      ],
                                    ),
                                    Divider(
                                      //height: 20,
                                      thickness: 1,
                                      // indent: 20,
                                      endIndent: 0,
                                      color: MyColors.grey3,
                                    ),
                                    controller.driverName == null
                                        ? Text(
                                            selectDriverOrSupplier != null ? selectDriverOrSupplier! : "",
                                            style: TextStyles.black1LessWeightred12PtTextStyle,
                                          )
                                        : SizedBox()
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              height: getHeight(Dimens.size115),
                              width: getWidth(Dimens.size154),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getHeight(Dimens.size20),
                                  ),
                                  Text(
                                    "supplierNameOptional",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                  SizedBox(
                                    height: getHeight(Dimens.size10),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      // var data = await Get.to(ChooseSupplier(id: id));
                                      // if (data != null) {
                                      //   controller.supplierName = data;
                                      // }
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                        Text(
                                          "enterName",
                                          style: controller.supplierName != null
                                              ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                                              : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
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
                                  controller.supplierName == null
                                      ? Text(
                                          selectDriverOrSupplier != null ? selectDriverOrSupplier! : "",
                                          style: TextStyles.black1LessWeightred12PtTextStyle,
                                        )
                                      : SizedBox()
                                ],
                              ),
                            ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: getHeight(Dimens.size115),
                        width: getWidth(Dimens.size154),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getHeight(Dimens.size20),
                            ),
                            Text(
                              "origin",
                              style: TextStyles.veryDarkGrey12400PtTextStyle,
                            ),
                            SizedBox(
                              height: getHeight(Dimens.size10),
                            ),
                            GestureDetector(
                              onTap: () async {
//                                 controller.searchCityController.clear();
//                                 controller.getSFCitiesSuggestions();
//
// // Get.to(SetOriginScreen());
//                                 var data = await Get.to(() => SetOriginScreen());
//
//                                 if (data != null) {
//                                   controller.localOrigin = data;
//                                 }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                  Container(
                                      width: getWidth(Dimens.size112),
                                      //   color: MyColors.yellow,
                                      child: Text(
                                        "chooseOrigin",
                                        style: controller.localOrigin != null
                                            ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                                            : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      )),

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
                            controller.localOrigin == null
                                ? Text(
                                    chooseOrigin != null ? chooseOrigin! : "",
                                    style: TextStyles.black1LessWeightred12PtTextStyle,
                                  )
                                : SizedBox()
                          ],
                        ),
                      ),
                      // Container(
                      //   width: getWidth(Dimens.size150),
                      // ),
                      Container(
                        height: getHeight(Dimens.size115),
                        width: getWidth(Dimens.size154),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getHeight(Dimens.size20),
                            ),
                            Text(
                              "destination",
                              style: TextStyles.veryDarkGrey12400PtTextStyle,
                            ),
                            SizedBox(
                              height: getHeight(Dimens.size10),
                            ),
                            GestureDetector(
                              onTap: () async {
                                // controller.searchCityController.clear();
                                // controller.getSFCitiesSuggestions();
                                //
                                // var data = await Get.to(() => SetOriginScreen());
                                // if (data != null) {
                                //   controller.localDistination = data;
                                // }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                  Container(
                                      width: getWidth(Dimens.size124),
                                      //color: MyColors.yellow,
                                      child: Text(
                                        controller.localDistination ?? "chooseDestination",
                                        style: controller.localDistination != null
                                            ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                                            : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      )),
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
                            controller.localDistination == null
                                ? Text(
                                    chooseDestination != null ? chooseDestination! : "",
                                    style: TextStyles.black1LessWeightred12PtTextStyle,
                                  )
                                : SizedBox()
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size30),
                  ),
                  ////////
                  Row(
                    children: [
                      Text(
                        "clientBillingType",
                        style: TextStyles.black14blackBLACKPtHeavyWeightTextStyle,
                      ),
                      SizedBox(
                        width: getWidth(Dimens.size9),
                      ),
                      InkWell(
                        onTap: () {
                          //  customDialogBox(context, "clientBillingTypeInfo");

                          // clientBillingDialog(context);
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
                    height: getHeight(Dimens.size30),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () async {
                            controller.fixed = 4;
                            controller.isFixed.value = !controller.isFixed.value;
                            controller.isAddDetails.value = false;
                            var data = await moreBottomSheet(context);
                            if (data != null) {
                              //   controller.itemSelected=data;
                              controller.clientBillingText = data;

                              controller.update();
                            }
                          },
                          child: Row(
                            children: [
                              // Text(easy.tr(controller.intuu?.text?? 'more'),style: TextStyles.black14500bluePtHeavyWeightTextStyle,),
                              Text(
                                controller.clientBillingText?.text ?? "${controller.billingType[5].text}" ?? "",
                                style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                              ),

                              Icon(
                                Icons.arrow_drop_down_outlined,
                                color: MyColors.blue1,
                              ),
                            ],
                          ))
                    ],
                  ),

                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),
                  controller.clientBillingText?.text == "fixed"
                      ?
                      //  controller.fixed==1?
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  controller.selectTruck.supplierId == null ?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: getWidth(Dimens.size154),
                                  child: Text(
                                    "partyFreightAmount",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                ),
                                Container(
                                  width: getWidth(Dimens.size154),
                                  child: Text(
                                    "tripStartDate",
                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 85,
                                  //  width: getWidth(Dimens.size154),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: getWidth(Dimens.size154),
                                            child: TextFormField(
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return "enterAmount";
                                                }
                                              },
                                              keyboardType: TextInputType.number,
                                              cursorColor: MyColors.grey3,
                                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                              controller: controller.partyAmountController,
                                              decoration: InputDecoration(
                                                  //contentPadding: EdgeInsets.only(top: 15,),
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: MyColors.grey3),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                                  prefixIcon: Container(
                                                    height: 0,
                                                    width: 0,

                                                    padding: EdgeInsets.only(right: 10, top: 6, bottom: 0),
                                                    child: Text(
                                                      "\$",
                                                      style: TextStyles.blackLessWeight14PtTextStyle,
                                                    ),
                                                    //child: Image.asset(MyImgs.dollarIcon),
                                                  ),
                                                  prefixIconConstraints: BoxConstraints(
                                                    minWidth: 15,
                                                    minHeight: 25,
                                                  ),
                                                  hintText: "0",
                                                  hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.selectStartDateTrip;
                                    controller.selectDates(context, 0);
                                    controller.update();
                                  },
                                  child: Container(
                                    // alignment: Alignment.bottomCenter,
                                    //  color: MyColors.yellow1,
                                    height: 85,
                                    width: getWidth(Dimens.size154),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                            Text(
                                              controller.selectStartDateTrip == null ? "selectStartDate" : controller.selectStartDateTrip.toString(),
                                              style: controller.selectStartDateTrip != null
                                                  ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                                                  : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
                                            ),

                                            Icon(
                                              Icons.arrow_drop_down_outlined,
                                              color: Colors.blueAccent,
                                              size: 20,
                                            )
                                          ],
                                        ),
                                        Divider(
                                          height: 26,
                                          thickness: 1,
                                          // indent: 20,
                                          // endIndent: 0,
                                          color: MyColors.grey3,
                                        ),
                                        controller.selectStartDateTrip == null
                                            ? Text(
                                                selectDate != null ? selectDate! : "",
                                                style: TextStyles.black1LessWeightred12PtTextStyle,
                                              )
                                            : SizedBox()
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: getWidth(Dimens.size154),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: getHeight(Dimens.size20),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          //Text(easy.tr("rate" "${controller.supplierBillingText?.text}"),style: TextStyles.veryDarkGrey12400PtTextStyle,),
                                          Text(
                                            "rate" + " " + controller.clientBillingTexts.text ?? "",
                                            style: TextStyles.veryDarkGrey12400PtTextStyle,
                                          ),

                                          SizedBox(
                                            height: getHeight(Dimens.size96),
                                            width: getWidth(Dimens.size154),
                                            child: TextFormField(
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              cursorColor: MyColors.grey3,
                                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                              validator: (value) {
                                                if (controller.clientBillingText?.text != "fixed" && value == null ||
                                                    controller.clientBillingText?.text != "fixed" && value!.isEmpty) {
                                                  return "enterRate" + " ${controller.clientBillingText?.text ?? ""}";
                                                }
                                              },
                                              onChanged: ((value) {
                                                if (controller.totalRateController.text.isNotEmpty) {
                                                  controller.totalAmountFunction();
                                                }
                                              }),
                                              controller: controller.rateController,
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: MyColors.grey3),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                                  //contentPadding: EdgeInsets.only(top: 15,),
                                                  prefixIcon: Container(
                                                      height: 0,
                                                      width: 0,
                                                      padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                                                      //color: MyColors.yellow,
                                                      child: Image.asset(MyImgs.dollarIcon)),
                                                  prefixIconConstraints: BoxConstraints(
                                                    minWidth: 25,
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
                                ),
                                // Container(
                                //   width: getWidth(Dimens.size150),
                                // ),
                                Container(
                                  //  height: getHeight(Dimens.size96),
                                  width: getWidth(Dimens.size154),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: getHeight(Dimens.size20),
                                      ),
                                      Text(
                                        "total" + " " + controller.clientBillingText!.text ?? "",
                                        style: TextStyles.veryDarkGrey12400PtTextStyle,
                                      ),
                                      //SizedBox(height: getHeight(Dimens.size0),),

                                      SizedBox(
                                        height: getHeight(Dimens.size96),
                                        width: getWidth(Dimens.size154),
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          cursorColor: MyColors.grey3,
                                          style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                          validator: (value) {
                                            if (controller.clientBillingText?.text != "fixed" && value == null ||
                                                controller.clientBillingText?.text != "fixed" && value!.isEmpty) {
                                              return "enterTotal" + " ${controller.clientBillingText?.text}";
                                            }
                                          },
                                          onChanged: ((value) {
                                            if (controller.totalRateController.text.isNotEmpty) {
                                              controller.totalAmountFunction();
                                            }
                                          }),
                                          controller: controller.totalRateController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: MyColors.grey3),
                                              ),
                                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                              //contentPadding: EdgeInsets.only(top: 15,),
                                              prefixIcon: Container(
                                                  height: 0,
                                                  width: 0,
                                                  padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                                                  //color: MyColors.yellow,
                                                  child: Text(
                                                    "t",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  )),
                                              prefixIconConstraints: BoxConstraints(
                                                minWidth: 25,
                                                minHeight: 25,
                                              ),
                                              hintText: "0",
                                              hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getHeight(Dimens.size14),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: getHeight(Dimens.size44),
                              width: getWidth(Dimens.size320),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "freightAmountTons" + "rate" + " * " + "total" + " " + controller.clientBillingText!.text ?? "" + ")",
                                    style: TextStyles.black1LessWeight12PtTextStyle,
                                  ),
                                  Text(
                                    "currencySymbol" + "${controller.totalAmount}",
                                    style: TextStyles.black14blackBLACKPtHeavyWeightTextStyle,
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.selectStartDateTrip;
                                controller.selectDates(context, 0);
                                controller.update();
                              },
                              child: Container(
                                // width: getWidth(Dimens.size150),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: getHeight(Dimens.size20),
                                    ),
                                    Text(
                                      "tripStartDate",
                                      style: TextStyles.veryDarkGrey12400PtTextStyle,
                                    ),
                                    SizedBox(
                                      height: getHeight(Dimens.size25),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                        Text(
                                          controller.selectStartDateTrip == null ? "selectStartDate" : controller.selectStartDateTrip.toString(),
                                          style: controller.selectStartDateTrip != null
                                              ? TextStyles.black14500BLACKPtHeavyWeightTextStyle
                                              : TextStyles.black14greyBLACKPtHeavyWeightTextStyle,
                                        ),

                                        Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Colors.blueAccent,
                                        )
                                      ],
                                    ),
                                    Divider(
                                      //height: 20,
                                      thickness: 1,
                                      // indent: 20,
                                      endIndent: 0,
                                      color: MyColors.grey3,
                                    ),
                                    controller.selectStartDateTrip == null
                                        ? Text(
                                            selectDate != null ? selectDate! : "",
                                            style: TextStyles.black1LessWeightred12PtTextStyle,
                                          )
                                        : SizedBox()
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getHeight(Dimens.size20),
                            ),
                          ],
                        ),

/////////////
                  controller.supplierId != null
                      ? Column(children: [
                          SizedBox(
                            height: getHeight(Dimens.size30),
                          ),
                          Row(
                            children: [
                              Text(
                                "supplierBillingType",
                                style: TextStyles.black14blackBLACKPtHeavyWeightTextStyle,
                              ),
                              SizedBox(
                                width: getWidth(Dimens.size9),
                              ),
                              InkWell(
                                onTap: () {
                                  // customDialogBox(context, "supplierBillingTypeInfo");
                                  // supplierBillingDialog(context);
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
                            height: getHeight(Dimens.size20),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () async {
                                    controller.fixed = 5;
                                    controller.isFixed.value = !controller.isFixed.value;
                                    controller.isAddDetails.value = false;
                                    var data = await supplierMoreBottomSheet(context);
                                    if (data != null) {
                                      //   controller.itemSelected=data;
                                      controller.supplierBillingText = data;

                                      controller.update();
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      // Text(easy.tr(controller.intuu?.text?? 'more'),style: TextStyles.black14500bluePtHeavyWeightTextStyle,),
                                      Text(
                                        controller.supplierBillingText?.text ?? "${controller.billingType[5].text}",
                                        style: TextStyles.black14500bluePtHeavyWeightTextStyle,
                                      ),

                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: MyColors.blue1,
                                      ),
                                    ],
                                  ))
                            ],
                          ),

                          SizedBox(
                            height: getHeight(Dimens.size20),
                          ),
                          // controller.supplierBillingText?.text=="fixed"?
                          controller.supplierBillingText?.text.toLowerCase() == "fixed"
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: getWidth(Dimens.size320),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: getHeight(Dimens.size20),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "supplierFreightAmount",
                                                style: TextStyles.veryDarkGrey12400PtTextStyle,
                                              ),
                                              SizedBox(
                                                width: getWidth(Dimens.size320),
                                                child: TextField(
                                                  keyboardType: TextInputType.number,
                                                  controller: controller.supplierAmountController,
                                                  decoration: InputDecoration(
                                                      //contentPadding: EdgeInsets.only(top: 15,),
                                                      prefixIcon: Container(
                                                          height: 0,
                                                          width: 0,
                                                          padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                                                          //color: MyColors.yellow,
                                                          child: Image.asset(MyImgs.dollarIcon)),
                                                      prefixIconConstraints: BoxConstraints(
                                                        minWidth: 25,
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
                                    )
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: getWidth(Dimens.size154),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: getHeight(Dimens.size20),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  //Text(easy.tr("rate" "${controller.supplierBillingText?.text}"),style: TextStyles.veryDarkGrey12400PtTextStyle,),
                                                  Text(
                                                    "rate" + " " + controller.supplierBillingTexts.text ?? "",
                                                    style: TextStyles.veryDarkGrey12400PtTextStyle,
                                                  ),

                                                  SizedBox(
                                                    width: getWidth(Dimens.size154),
                                                    child: TextField(
                                                      onChanged: ((value) {
                                                        if (controller.supplierRateController.text.isNotEmpty) {
                                                          controller.SupplierTotalAmountFunction();
                                                        }
                                                      }),
                                                      controller: controller.supplierRateController,
                                                      keyboardType: TextInputType.number,
                                                      cursorColor: MyColors.grey3,
                                                      style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                                      decoration: InputDecoration(
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: MyColors.grey3),
                                                          ),
                                                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                                          //contentPadding: EdgeInsets.only(top: 15,),
                                                          prefixIcon: Container(
                                                              height: 0,
                                                              width: 0,
                                                              padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                                                              //color: MyColors.yellow,
                                                              child: Image.asset(MyImgs.dollarIcon)),
                                                          prefixIconConstraints: BoxConstraints(
                                                            minWidth: 25,
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
                                        ),
                                        // Container(
                                        //   width: getWidth(Dimens.size150),
                                        // ),
                                        Container(
                                          width: getWidth(Dimens.size154),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: getHeight(Dimens.size20),
                                              ),
                                              Text(
                                                "total" + " " + controller.supplierBillingText!.text ?? "",
                                                style: TextStyles.veryDarkGrey12400PtTextStyle,
                                              ),
                                              //SizedBox(height: getHeight(Dimens.size0),),

                                              SizedBox(
                                                width: getWidth(Dimens.size154),
                                                child: TextField(
                                                  onChanged: ((value) {
                                                    if (controller.supplierTotalRateController.text.isNotEmpty) {
                                                      controller.SupplierTotalAmountFunction();
                                                    }
                                                  }),
                                                  cursorColor: MyColors.grey3,
                                                  style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                                  controller: controller.supplierTotalRateController,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                      enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: MyColors.grey3),
                                                      ),
                                                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                                      //contentPadding: EdgeInsets.only(top: 15,),
                                                      prefixIcon: Container(
                                                          height: 0,
                                                          width: 0,
                                                          padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                                                          //color: MyColors.yellow,
                                                          child: Text(
                                                            "t",
                                                            style: TextStyle(fontWeight: FontWeight.bold),
                                                          )),
                                                      prefixIconConstraints: BoxConstraints(
                                                        minWidth: 25,
                                                        minHeight: 25,
                                                      ),
                                                      hintText: "0",
                                                      hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getHeight(Dimens.size14),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      height: getHeight(Dimens.size44),
                                      width: getWidth(Dimens.size320),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.grey3),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "freightAmountTons" + "rate" + " * " + "total" + " " + controller.supplierBillingText!.text ?? "" + ")",
                                            style: TextStyles.black1LessWeight12PtTextStyle,
                                          ),
                                          Text(
                                            "\$${controller.supplierTotalAmount}",
                                            style: TextStyles.black14blackBLACKPtHeavyWeightTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                    // Container(
                                    //   // width: getWidth(Dimens.size150),
                                    //
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       SizedBox(
                                    //         height: getHeight(Dimens.size20),
                                    //       ),
                                    //       // Text(
                                    //       //   easy.tr("tripStartDate"),
                                    //       //   style: TextStyles
                                    //       //       .veryDarkGrey12400PtTextStyle,
                                    //       // ),
                                    //       // SizedBox(
                                    //       //   height: getHeight(Dimens.size25),
                                    //       // ),
                                    //       // GestureDetector(
                                    //       //   onTap: () {
                                    //       //     controller.selectStartDateTrip;
                                    //       //     controller.selectDates(
                                    //       //         context, 0);
                                    //       //     controller.update();
                                    //       //   },
                                    //       //   child: Row(
                                    //       //     mainAxisAlignment:
                                    //       //         MainAxisAlignment
                                    //       //             .spaceBetween,
                                    //       //     children: [
                                    //       //       //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                    //       //       Text(
                                    //       //         controller
                                    //       //                 .selectStartDateTrip ??
                                    //       //             "Select start date",
                                    //       //         style: TextStyles
                                    //       //             .black14500BLACKPtHeavyWeightTextStyle,
                                    //       //       ),
                                    //       //
                                    //       //       Icon(
                                    //       //         Icons
                                    //       //             .arrow_drop_down_outlined,
                                    //       //         color: Colors.blueAccent,
                                    //       //       )
                                    //       //     ],
                                    //       //   ),
                                    //       // ),
                                    //       // Divider(
                                    //       //   //height: 20,
                                    //       //   thickness: 1,
                                    //       //   // indent: 20,
                                    //       //   endIndent: 0,
                                    //       //   color: MyColors.grey3,
                                    //       // ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),

                          SizedBox(
                            height: getHeight(Dimens.size20),
                          ),
                        ])
                      : SizedBox(),

                  controller.isAddDetails.value == false
                      ? GestureDetector(
                          onTap: () {
                            controller.addDetails = 1;
                            controller.isAddDetails.value = !controller.isAddDetails.value;
                            //  addMoreDetailsBottomSheet(context);
                            controller.update();
                            controller.isAddDetails.value = true;
                          },
                          child: Text(
                            "addMoreDetails",
                            style: TextStyles.blue16textStyle,
                          ))
                      : SizedBox(),

                  controller.isAddDetails.value
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "startKm",
                              style: TextStyles.veryDarkGrey12400PtTextStyle,
                            ),
                            //SizedBox(height: getHeight(Dimens.size0),),

                            SizedBox(
                              //width: getWidth(Dimens.size150),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: controller.startKmController,
                                cursorColor: MyColors.grey3,
                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: MyColors.grey3),
                                    ),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),

                                    //contentPadding: EdgeInsets.only(top: 15,),
                                    prefixIcon: Container(
                                        height: 0,
                                        width: 0,
                                        padding: EdgeInsets.only(right: 0, top: 3, bottom: 5),
                                        //color: MyColors.yellow,
                                        child: Text(
                                          "km",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 25,
                                      minHeight: 25,
                                    ),
                                    hintText: "0",
                                    hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                              ),
                            ),
                            SizedBox(
                              height: getHeight(Dimens.size20),
                            ),
                            // Text(
                            //   easy.tr("material"),
                            //   style: TextStyles.veryDarkGrey12400PtTextStyle,
                            // ),
                            // TextField(
                            //   controller: controller.materialController,
                            //   decoration: InputDecoration(
                            //       enabledBorder: UnderlineInputBorder(
                            //         borderSide: BorderSide(color: MyColors.grey3, width: 1),
                            //         //  when the TextFormField in unfocused
                            //       ),
                            //       prefixIconConstraints: BoxConstraints(
                            //         minWidth: 25,
                            //         minHeight: 25,
                            //       ),
                            //       hintText: "enterMaterial",
                            //       hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                            // ),
                            // SizedBox(
                            //   height: getHeight(Dimens.size20),
                            // ),
                            Text(
                              "notesOptional",
                              style: TextStyles.veryDarkGrey12400PtTextStyle,
                            ),
                            TextField(
                              controller: controller.noteController,
                              cursorColor: MyColors.grey3,
                              style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: MyColors.grey3),
                                  ),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 25,
                                    minHeight: 25,
                                  ),
                                  hintText: "yourTextHere",
                                  hintStyle: TextStyles.grey14greyBLACKPtHeavyWeightTextStyle),
                            ),
                            SizedBox(
                              height: getHeight(Dimens.size20),
                            ),
                          ],
                        )
                      : SizedBox(),

                  SizedBox(
                    height: getHeight(Dimens.size30),
                  ),

                  SizedBox(
                    height: getHeight(Dimens.size30),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        validator(context);
                        controller.update();
                      }

                      //  print("deiver selected id  " + controller.selectDriver.id.toString());

                      controller.update();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: getWidth(Dimens.size320),
                      height: getHeight(Dimens.size50),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: MyColors.blue1),
                      child: controller.isCreateTripLoading.value
                          ? Text(
                              "save",
                              style: TextStyles.white1PtMediumWeightTextStyle,
                            )
                          : Center(
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Future moreBottomSheet(context) async {
    // List  noteList=[];
    SizeConfig().init(context);

    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        isScrollControlled: true,
        //backgroundColor: Colors.black12,
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: GetBuilder<TripController>(builder: (controller) {
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size26),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "moreFilters",
                            style: TextStyles.whiteLessWeight2050PtTextStyle,
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

////////////

                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: controller.billingType.length,
                          itemBuilder: (BuildContext context, int index) {
                            return new InkWell(
                              //highlightColor: Colors.red,
                              splashColor: Colors.blueAccent,
                              onTap: () {
                                controller.billingType.forEach((element) => element.isSelected = false);
                                controller.billingType[index].isSelected = true;
                                controller.tempClientBilling = controller.billingType[index];
                                controller.update();
                                //   print(easy.tr(controller.sampleData[index].text));
                                print("stringhgg ${controller.tempClientBilling}");
                              },
                              child: new RadioItem(controller.billingType[index]),
                            );
                          },
                        ),
                      ),

                      SizedBox(
                        height: getHeight(Dimens.size20),
                      ),
                      GestureDetector(
                          onTap: () async {
                            controller.clientBillingText = controller.tempClientBilling;
                            print("itemsellected ${controller.clientBillingText?.text}");

                            controller.clientBillinType = controller.clientBillingText.toString();
                            Get.back(result: controller.clientBillingText);

                            print("controller.clientBillinType ${controller.clientBillinType}");
                            // Get.back(result: controller.itemSelected );
                            controller.update();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: getHeight(Dimens.size50),
                              width: getWidth(Dimens.size320),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: controller.tempClientBilling != null ? MyColors.blue1 : MyColors.grey3),
                              child: Center(
                                  child: Text(
                                "applys",
                                style: TextStyles.white1PtMediumWeightTextStyle,
                              )
                                  //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),

                                  )))
                    ],
                  ),
                ),
              );
            }),
          );
        });
    return controller.billingType;
  }

  Future supplierMoreBottomSheet(context) async {
    // List  noteList=[];
    SizeConfig().init(context);

    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        isScrollControlled: true,
        //backgroundColor: Colors.black12,
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: GetBuilder<TripController>(builder: (controller) {
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size26),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "moreFilters",
                            style: TextStyles.whiteLessWeight2050PtTextStyle,
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

////////////

                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: controller.billingType.length,
                          itemBuilder: (BuildContext context, int index) {
                            return new InkWell(
                              //highlightColor: Colors.red,
                              splashColor: Colors.blueAccent,
                              onTap: () {
                                controller.billingType.forEach((element) => element.isSelected = false);
                                controller.billingType[index].isSelected = true;
                                controller.supplierBilling = controller.billingType[index];
                                controller.update();
                                //   print(easy.tr(controller.sampleData[index].text));
                                print("stringhgg ${controller.supplierBilling}");
                              },
                              child: new RadioItem(controller.billingType[index]),
                            );
                          },
                        ),
                      ),

                      SizedBox(
                        height: getHeight(Dimens.size20),
                      ),
                      GestureDetector(
                          onTap: () async {
                            controller.supplierBillingText = controller.supplierBilling;
                            print("itemsellected ${controller.supplierBillingText?.text}");
                            Get.back(result: controller.supplierBillingText);
                            // Get.back(result: controller.itemSelected );
                            controller.update();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: getHeight(Dimens.size50),
                              width: getWidth(Dimens.size320),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: controller.supplierBilling != null ? MyColors.blue1 : MyColors.grey3),
                              child: Center(
                                  child: Text(
                                "applys",
                                style: TextStyles.white1PtMediumWeightTextStyle,
                              )
                                  //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),

                                  )))
                    ],
                  ),
                ),
              );
            }),
          );
        });
    return controller.billingType;
  }

  void clientBottomSheet(context) async {
    // List  noteList=[];
    SizeConfig().init(context);

    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        isScrollControlled: true,
        //backgroundColor: Colors.black12,
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: GetBuilder<TripController>(builder: (controller) {
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size26),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "moreFilters",
                            style: TextStyles.whiteLessWeight2050PtTextStyle,
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
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }

  String? selectClient;
  String? selectTruck;
  String? selectDriverOrSupplier;
  String? chooseOrigin;
  String? chooseDestination;
  String? selectDate;
  void validator(BuildContext context) async {
    if (controller.clientName == null) {
      selectClient = "selectClient";
    } else if (truckController.truckNUmber == null) {
      selectTruck = "selectTruck";
    } else if (controller.driverName == null && controller.supplierName == null) {
      selectDriverOrSupplier = "select driver or supplier";
    }
    // else if (controller.selectedSupplier.name == null) {
    //   CustomToast.failToast(msg: "select supplier");
    // }
    // else if (controller.localOrigin == null) {
    //   chooseOrigin = "chooseOrigin";
    // } else if (controller.localDistination == null) {
    //   chooseDestination = "chooseDestination";
    // } else if (controller.clientBillingText == null) {
    //   // CustomToast.failToast(msg: "select client billing type");
    // } else if (controller.supplierBillingText == null) {
    //   //  CustomToast.failToast(msg: "select supplier billing type");
    // } else if (controller.clientBillingText?.text == "fixed" && controller.selectStartDateTrip == null ||
    //     controller.clientBillingText?.text != "fixed" && controller.selectStartDateTrip == null) {
    //   selectDate = "selectDate";
    // }
    else {
      //TODO: Implement Database functionality here
      controller.isCreateTripLoading.value = !controller.isCreateTripLoading.value;
      // controller.isCreateTripLoading.value == true ? null : controller.CreatTripButton(context);
      controller.tripCreateButton();
      controller.isCreateTripLoading.value = false;

      controller.update();
      // controller.isCreateTripLoading.value == true ||
    }
  }

  // Future clientBillingDialog(BuildContext context) async {
  //   await showGeneralDialog(
  //     barrierLabel: "Label",
  //     barrierDismissible: true,
  //     barrierColor: Colors.white.withOpacity(0.1),
  //     // barrierColor: Colors.black.withOpacity(0.5),
  //     transitionDuration: Duration(milliseconds: 700),
  //     context: context,
  //     pageBuilder: (context, anim1, anim2) {
  //       return GestureDetector(
  //         onTap: () => Navigator.pop(context),
  //         child: Scaffold(
  //           backgroundColor: Colors.transparent,
  //           body: Align(
  //             alignment: Alignment.bottomCenter,
  //             child: GestureDetector(
  //               onTap: () {},
  //               child: Container(
  //                 height: getHeight(Dimens.size240),
  //                 // width: getWidth(Dimens.size320),
  //                 // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.black1),
  //                 // height: 300,
  //                 margin: EdgeInsets.only(bottom: 20, left: 12, right: 12),
  //                 decoration: BoxDecoration(
  //                   color: MyColors.textAppbarcolor.withOpacity(0.9),
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(15.0),
  //                   child: Column(
  //                     //mainAxisAlignment: MainAxisAlignment.end,
  //                     children: [
  //                       Row(
  //                         children: [
  //                           Text(
  //                             "${easy.tr("fixed") + ":  "}",
  //                             style: TextStyles.white15PtLessWeightTextStyle,
  //                           ),
  //                           Text(easy.tr("amoiuntAgreeToClient"), style: TextStyles.white15PtLessWeightTextStyle)
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             "${easy.tr("per_km") + ":  "}",
  //                             style: TextStyles.white15PtLessWeightTextStyle,
  //                           ),
  //                           Text(easy.tr("ratePerKmAgreedToClient"), style: TextStyles.white15PtLessWeightTextStyle)
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             "${easy.tr("per_hour") + ":  "}",
  //                             style: TextStyles.white15PtLessWeightTextStyle,
  //                           ),
  //                           Text(easy.tr("ratePerHourAgreedToClient"), style: TextStyles.white15PtLessWeightTextStyle)
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             "${easy.tr("per_bag") + ":  "}",
  //                             style: TextStyles.white15PtLessWeightTextStyle,
  //                           ),
  //                           Text(easy.tr("ratePerBagAgreedToClient"), style: TextStyles.white15PtLessWeightTextStyle)
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             "${easy.tr("per_kg") + ":  "}",
  //                             style: TextStyles.white15PtLessWeightTextStyle,
  //                           ),
  //                           Text(easy.tr("ratePerKgAgreedToClient"), style: TextStyles.white15PtLessWeightTextStyle)
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             "${easy.tr("per_tonne") + ":  "}",
  //                             style: TextStyles.white15PtLessWeightTextStyle,
  //                           ),
  //                           Text(easy.tr("ratePerTonneAgreedToClient"), style: TextStyles.white15PtLessWeightTextStyle)
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             "${easy.tr("per_day") + ":  "}",
  //                             style: TextStyles.white15PtLessWeightTextStyle,
  //                           ),
  //                           Text(easy.tr("rateDayAgreedToClient"), style: TextStyles.white15PtLessWeightTextStyle)
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             "${easy.tr("per_litre") + ":  "}",
  //                             style: TextStyles.white15PtLessWeightTextStyle,
  //                           ),
  //                           Text(easy.tr("ratePerLitreAgreedToClient"), style: TextStyles.white15PtLessWeightTextStyle)
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             "${easy.tr("per_trip") + ":  "}",
  //                             style: TextStyles.white15PtLessWeightTextStyle,
  //                           ),
  //                           Text(easy.tr("ratePerTripAgreedToClient"), style: TextStyles.white15PtLessWeightTextStyle)
  //                         ],
  //                       ),
  //                       SizedBox(
  //                         height: getHeight(Dimens.size14),
  //                       ),
  //                       InkWell(
  //                         onTap: () {
  //                           Get.back();
  //                         },
  //                         child: Container(
  //                           padding: EdgeInsets.only(right: 5),
  //                           alignment: Alignment.bottomRight,
  //                           // height: getHeight(Dimens.size40),
  //                           //width: getWidth(Dimens.size50),
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(10),
  //                             // color: MyColors.black1
  //                             color: MyColors.black1.withOpacity(0.01),
  //                           ),
  //                           child: Text(
  //                             easy.tr("ok"),
  //                             style: TextStyles.blue16textStyle,
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //     transitionBuilder: (context, anim1, anim2, child) {
  //       return SlideTransition(
  //         position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
  //         child: child,
  //       );
  //     },
  //   );
  // }
}
