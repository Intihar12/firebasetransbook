import 'dart:async';

import 'package:firebasetransbook/controllers/truck_controller/truck_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../controllers/client_controller/client_controller.dart';
import '../../../controllers/trip_controller/trip_controller.dart';
import '../../../values/dimens.dart';
import '../../../values/my_colors.dart';
import '../../../values/my_imgs.dart';
import '../../../values/size_config.dart';

import '../../../widgets/create_client_bottomSheet_widget.dart';
import '../../../widgets/supplier_screen_widget.dart';
import '../../../widgets/truck_create_bottomsheet_widget.dart';

class ChooseTruck extends StatelessWidget {
  ChooseTruck({Key? key, this.id}) : super(key: key);
  final int? id;

  TruckController truckController = Get.find();
  TripController controller = Get.find();

  var avatarText;

  String? selectedId;

  Timer? debounce;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<TruckController>(builder: (truckController) {
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
                        "choose Truck",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: MyColors.textAppbarcolor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            // controller: clientController.controller,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    //controller: controller.searchControlle,
                    onChanged: (value) {
                      if (debounce?.isActive ?? false) debounce?.cancel();
                      debounce = Timer(Duration(milliseconds: 500), () {
                        // if (controller.searchControlle.text.isNotEmpty) {
                        //   clientController.searchClientFunction(value);
                        // } else {
                        //   clientController.clientList();
                        // }
                      });
                    },
                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    keyboardType: TextInputType.text,
                    cursorColor: MyColors.black1,
                    decoration: InputDecoration(
                        // focusedBorder: UnderlineInputBorder(),

                        border: UnderlineInputBorder(),
                        prefixIcon: Container(
                          // height: 0,
                          // width: 0,
                          padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(maxHeight: 25, maxWidth: 30),
                        hintText: 'Searchbypartyname',
                        hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                  ),
                  SizedBox(
                    height: getHeight(Dimens.size20),
                  ),
                  GestureDetector(
                    onTap: () {
                      //  clientController.buttonLoading.value = true;
                      truckCreateBottomSheet(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: getHeight(Dimens.size50),
                      width: getWidth(Dimens.size320),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100), border: Border.all(color: MyColors.blue1, width: 2), color: MyColors.white),
                      child: Text(
                        "add truck",
                        style: TextStyles.blue16textStyle,
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(Dimens.size30)),
                  Text(
                    "existingClients",
                    style: TextStyles.black14500PtHeavyWeightTextStyle,
                  ),
                  SizedBox(height: getHeight(Dimens.size20)),
                  SizedBox(
                    child: ListView.builder(
                        itemCount: truckController.truckList.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            highlightColor: MyColors.white,
                            onTap: () {
                              truckController.getSingleData(truckController.truckList[index].truckId);
                              truckController.truckNUmber = truckController.truckList[index].registrationNumber.toString();
                              truckController.getSingleData(truckController.truckList[index].truckId);
                              print("sup id");
                              print(truckController.truckModalSingleData.supplierId);
                              Get.back(result: truckController.truckNUmber);
                              controller.update();
                              truckController.update();
                              // Get.to(TruckDetailsScreen());
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
                                              truckController.truckList[index].registrationNumber.toString(),
                                              style: TextStyles.black17PtTextStyle,
                                            ),
                                          ),
                                          SizedBox(
                                            height: getHeight(Dimens.size4),
                                          ),

                                          // print(""),
                                          truckController.truckList[index].supplierId == null
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
                                            truckController.status == true
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
                        }),
                  ),
                  SizedBox(height: getHeight(Dimens.size30)),
                  Text(
                    "allContacts",
                    style: TextStyles.black14500PtHeavyWeightTextStyle,
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
