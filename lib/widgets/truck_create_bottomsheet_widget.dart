import 'dart:async';

import 'package:firebasetransbook/widgets/supplier_create_bottomSheet_widget.dart';
import 'package:firebasetransbook/widgets/supplier_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/supplier_controller/supplier_controller.dart';
import '../controllers/truck_controller/truck_controller.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import '../values/my_imgs.dart';
import '../values/size_config.dart';

void truckCreateBottomSheet(context) {
  TruckController truckController = Get.find();
  int? id;
  SizeConfig().init(context);
  final formKey = GlobalKey<FormState>();
  truckController.registrationController.clear();
  String? selectSupplier;
  //supplier.Datum selectedDriver;
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      isScrollControlled: true,
      //backgroundColor: Colors.black12,
      context: context,
      builder: (BuildContext bc) {
        return GetBuilder<TruckController>(builder: (controller) {
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
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom > 50
                        ? MediaQuery.of(context).viewInsets.bottom - 50
                        : MediaQuery.of(context).viewInsets.bottom),
                //    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: getHeight(Dimens.size6),
                          width: getWidth(Dimens.size30),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: MyColors.blue1),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(Dimens.size26),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("addTruck", style: TextStyles.whiteLessWeight2050PtTextStyle),
                          InkWell(
                            onTap: () {
                              // Get.back();
                              Navigator.pop(context);
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
                      Text(
                        "truckRegisterNumber",
                        style: TextStyles.black1LessWeight12PtTextStyle,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "pleaseEnterNumber";
                          } else if (value.length < 3) {
                            return "mustBe3Latters";
                          }
                        },
                        controller: controller.registrationController,
                        cursorColor: MyColors.black1,
                        //  style: TextStyles.black1LessWeight12PtTextStyle,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(),
                          hintText: "hintText",
                          hintStyle: TextStyles.black14500PtHeavyWeightTextStyle,
                        ),
                      ),

                      SizedBox(
                        height: getHeight(Dimens.size23),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // color: Colors.yellow,
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 15,
                              minLeadingWidth: 0,
                              title: Text(
                                "myTruck",
                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              ),
                              leading: SizedBox(
                                height: 20,
                                width: 20,
                                child: Radio<SingingCharacters>(
                                  value: SingingCharacters.myTruck,
                                  groupValue: controller.character,
                                  onChanged: (SingingCharacters? value) {
                                    controller.isTruck.value = !controller.isTruck.value;
                                    controller.character = value;

                                    if (controller.character == value) {
                                      controller.supplierId = null;
                                    }

                                    print("kkkkkkkk:: ${controller.supId}");

                                    controller.update();
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
                              horizontalTitleGap: 15,
                              minLeadingWidth: 10,
                              title: Text(
                                "marketTruck",
                                style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                              ),
                              leading: SizedBox(
                                width: 10,
                                child: Radio<SingingCharacters>(
                                  value: SingingCharacters.marketTruck,
                                  groupValue: controller.character,
                                  onChanged: (SingingCharacters? value) {
                                    controller.isTruck.value = !controller.isTruck.value;
                                    controller.character = value;
                                    controller.update();
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

// controller.isMyTruck==1?
//                         DropdownButton<driver.Datum>(
//                            isExpanded: true,
//                           value: controller.selectedClient,
//                           hint: Text(easy.tr("driver"),style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
//                           //value: controller.list,
//                           icon: const Icon(Icons.arrow_drop_down_outlined,color: Colors.blue,),
//                           elevation: 16,
//                           style: const TextStyle(color: MyColors.textAppbarcolor),
//                           underline: Container(
//                             // height: 0.5,
//                             color: MyColors.grey3,
//                           ),
//                           onChanged: (driver.Datum? value) {
//                             // This is called when the user selects an item.
//
//                             controller.selectedClient = value!;
//                             //clientModal.reminderIn=controller.dropdownValue;
//                             //  print("intuu reminder value  ${clientModal.reminderIn}");
//                             controller.update();
//
//                           },
//                           items: controllers.fondsearchlist.map<DropdownMenuItem<driver.Datum>>((driver.Datum value) {
//                             return DropdownMenuItem<driver.Datum>(
//                                 value: value,
//                                 child: Text("${value.name}",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,)
//                             );
//                           }).toList(),
//                         ):
//
// DropdownButton<supplier.Datum>(
//                            isExpanded: true,
//                           value: controller.selectSupplier,
//                           hint: Text(easy.tr("supplier"),style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
//                           //value: controller.list,
//                           icon: const Icon(Icons.arrow_drop_down_outlined,color: Colors.blue,),
//                           elevation: 16,
//                           style: const TextStyle(color: MyColors.textAppbarcolor),
//                           underline: Container(
//                             // height: 0.5,
//                             color: MyColors.grey3,
//                           ),
//                           onChanged: (supplier.Datum? value) {
//                             // This is called when the user selects an item.
//
//                             controller.selectSupplier = value!;
//                             //clientModal.reminderIn=controller.dropdownValue;
//                             //  print("intuu reminder value  ${clientModal.reminderIn}");
//                             controller.update();
//
//                           },
//                           items: supplierController.fondsearchlist.map<DropdownMenuItem<supplier.Datum>>((supplier.Datum value) {
//                             return DropdownMenuItem<supplier.Datum>(
//                                 value: value,
//                                 child: Text("${value.name}",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,)
//                             );
//                           }).toList(),
//                         ),

                      controller.isTruck.value
                          ? Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("supplierTruckOwner"),
                                  SizedBox(
                                    height: Dimens.size10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      //Text("30Aug2022",style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,),
                                      Text(
                                        controller.supplierName != null ? "${controller.supplierName}" : "Select Supplier",
                                        style: TextStyles.black14500BLACKPtHeavyWeightTextStyle,
                                      ),

                                      GestureDetector(
                                          onTap: () async {
                                            // controller.selectDates(context, 0);

                                            var data = await drivertruckBottomSheet(context, id);

                                            if (data != null) {
                                              // print(data.id);
                                              //print(data.name);
                                              controller.supplierName = data;
                                            }

                                            // drivertruckBottomSheet(context);
                                            controller.update();
                                          },
                                          child: Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: Colors.blueAccent,
                                          ))
                                    ],
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
                                          selectSupplier != null ? selectSupplier.toString() : "",
                                          style: TextStyles.red1LessWeight14PtTextStyle,
                                        )
                                      : SizedBox()
                                ],
                              ),
                            )
                          : SizedBox(),

                      SizedBox(
                        height: getHeight(Dimens.size57),
                      ),
                      GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              if (controller.isTruck.value == true && controller.supplierName == null) {
                                selectSupplier = "selectSupplier";
                                controller.update();
                              } else {
                                controller.character;

                                controller.isLoading.value = !controller.isLoading.value;
                                controller.truckCreateFunction();
                                // controller.isLoading.value == true ? null : controller.CreatTruckButton(context);
                                // controller.isLoading.value = false;

                                controller.update();
                              }
                            }
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: getHeight(Dimens.size50),
                              width: getWidth(Dimens.size320),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: MyColors.blue1),
                              child: controller.isLoading.value
                                  ? Center(
                                      child: Text(
                                      "confrim",
                                      style: TextStyles.white1PtMediumWeightTextStyle,
                                    )
                                      //   child: Text(easy.tr("CONFIRM"),style: TextStyles.white1PtMediumWeightTextStyle,),

                                      )
                                  : Center(
                                      child: CircularProgressIndicator(color: MyColors.white, strokeWidth: 3),
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

Future drivertruckBottomSheet(context, id) async {
  var avatarText;
  TruckController truckController = Get.find();
  SupplierController controllers = Get.find();

  //controllers.searchControlle.clear();
  //  driver.Datum selected=driver.Datum();
  SizeConfig().init(context);
  Timer? debounce;
  await showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      isScrollControlled: true,
      //enableDrag: true,
      //isDismissible: false,
      //backgroundColor: Colors.black12,
      context: context,
      builder: (BuildContext bc) {
        return GetBuilder<SupplierController>(builder: (supplierController) {
          return Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 10),
            height: getHeight(Dimens.size600),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                          "addSupplier",
                          style: TextStyles.whiteLessWeight2050PtTextStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
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
                    TextField(
                      // controller: supplierController.searchControlle,
                      onChanged: (value) {
                        if (debounce?.isActive ?? false) debounce?.cancel();
                        debounce = Timer(const Duration(milliseconds: 500), () {
                          // if (supplierController.searchControlle.text.isNotEmpty) {
                          //   controllers.searchSupplierFunction(value);
                          // } else {
                          //   supplierController.supplierList();
                          // }
                        });
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(20)],
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
                          hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                    ),
                    SizedBox(
                      height: getHeight(Dimens.size14),
                    ),
                    GestureDetector(
                      onTap: () {
                        //supplierController.buttonLoading.value = true;
                        supplierCreateBottomSheet(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: getHeight(Dimens.size50),
                        width: getWidth(Dimens.size320),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100), border: Border.all(color: MyColors.blue1, width: 2), color: MyColors.white),
                        child: Text(
                          "addSupplier",
                          style: TextStyles.blue16textStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(Dimens.size20),
                    ),
                    SizedBox(
                        // height: double.infinity,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            // itemCount: 2,
                            //  itemCount: apiData.length,
                            //     controller: controller.controller,
                            itemCount: supplierController.supplierList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              String name = supplierController.supplierList[index].supplierName ?? '';

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
                                  supplierController.getSingleData(supplierController.supplierList[index].supplierId);
                                  // Get.to(SupplierDetailsScreen());
                                  truckController.supplierName = supplierController.supplierList[index].supplierName.toString();
                                  truckController.supplierId = supplierController.supplierList[index].supplierId;
                                  Get.back(result: truckController.supplierName);
                                  truckController.update();
                                  supplierController.update();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: SupplierScreenWidget(
                                    firstLatter: avatarText.toString(),
                                    supplierName: supplierController.supplierList[index].supplierName.toString(),
                                    balance: supplierController.supplierList[index].balance.toString(),
                                    // balance: easy.tr("${controller.supplierListModal.data![index].balance}"),
                                  ),
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ),
          );
        });
      });

  return truckController.supplierName;
}
