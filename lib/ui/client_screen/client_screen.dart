import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants.dart';

import '../../controllers/client_controller/client_controller.dart';
import '../../controllers/country_code_controller/country_code_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';

import '../../values/size_config.dart';
import '../../widgets/create_client_bottomSheet_widget.dart';
import '../../widgets/supplier_screen_widget.dart';

class ClilentsScreenState extends StatelessWidget {
  ClientController clientController = Get.find();
  // ReportController reportsController = Get.find();
  final countryController = Get.put(CountryController());
  // TripController tripController = Get.find();

  // StatisticsController statisticController = Get.find();
  bool isMobileNumberValid = false;

  // GetStorage storage = GetStorage();
  bool isLoading = false;

  var userName;
  var avatarText;
  Timer? debounce;
  // bool showButton = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<ClientController>(builder: (controllers) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: MyColors.white,
          floatingActionButton: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
            child: FloatingActionButton(
              onPressed: () {
                clientController.isCreateClientLoading.value = true;
                createClientBottomSheet(context);
                // controllers.buttonLoading.value = true;
                // createClientBottomSheet(context);
                // controllers.nameController.clear();
                // controllers.phoneController.clear();
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
              //crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // Get.back();
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
                        "Clients",
                        style: TextStyles.blackMediumWeight18PtTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: clientController.isClientScreenLoading
              ? SingleChildScrollView(
                  // controller: clientController.controller,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 37),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("totalclientsbalance", style: TextStyles.veryDarkGrey12400PtTextStyle),
                        SizedBox(
                          height: Dimens.size10,
                        ),

                        Text(
                          "\$0",
                          style: TextStyles.veryDarkGrey12400PtTextStyle,
                        ),

                        SizedBox(
                          height: Dimens.size20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: getWidth(Dimens.size150),
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
                                  child: GestureDetector(
                                    onTap: () {
                                      // reportsController.isClientRevenueLoading.value = false;
                                      // reportsController.dropdownValueReminderDates = null;
                                      // reportsController.thisMonthFunction();
                                      // reportsController.clientRevenueReport(DateFormat('yyyy-MM-dd').format(reportsController.startDatePro!), DateFormat('yyyy-MM-dd').format(reportsController.endDatePro!));
                                      // Get.to(ClientRevenueReport());
                                      // reportsController.update();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          MyImgs.viewReporysImg,
                                          width: getHeight(Dimens.size20),
                                          height: getWidth(Dimens.size17),
                                          color: MyColors.blue1,
                                        ),
                                        Text(
                                          "View reports",
                                          style: TextStyles.black1PtLessWeightTextStyle,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: MyColors.blue1,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            GestureDetector(
                              onTap: () {
                                // clientController.isReminderListLoading.value = false;
                                // Get.to(AllClientsReminders(
                                //     //  id: controllers.fondsearchlist[0].id,
                                //     ));
                                //
                                // clientController.reminderList();
                                // clientController.update();
                              },
                              child: Container(
                                  width: getWidth(Dimens.size150),
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
                                    padding: EdgeInsets.only(left: 15.0, right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          MyImgs.remindersicon,
                                          width: getHeight(Dimens.size20),
                                          height: getWidth(Dimens.size17),
                                          color: MyColors.blue1,
                                        ),
                                        Text(
                                          "All Reminders",
                                          style: TextStyles.black1PtLessWeightTextStyle,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: MyColors.blue1,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimens.size20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            // controller: clientController.searchControlle,
                            onChanged: (value) {
                              if (debounce?.isActive ?? false) debounce?.cancel();
                              debounce = Timer(Duration(milliseconds: 500), () {
                                if (clientController.searchControlle.text.isNotEmpty) {
                                  // controllers.searchClientFunction(value);
                                } else {
                                  //  clientController.clientList();
                                }
                              });
                            },
                            inputFormatters: [LengthLimitingTextInputFormatter(20)],
                            keyboardType: TextInputType.text,
                            cursorColor: MyColors.grey3,
                            style: TextStyles.black1PtLessWeightTextStyle,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.grey3),
                                ),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                // focusedBorder: UnderlineInputBorder(),
                                prefixIconConstraints: BoxConstraints(maxHeight: 25, maxWidth: 25),
                                border: UnderlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                hintText: 'Search by party name',
                                hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                          ),
                        ),
                        SizedBox(
                          height: Dimens.size30,
                        ),
                        Text(
                          "Client",
                          style: TextStyles.black14500PtHeavyWeightTextStyle,
                        ),
                        SizedBox(
                          height: Dimens.size30,
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            // itemCount: 2,
//controller: controllers.controller,

                            itemCount: clientController.clientList.length,
                            shrinkWrap: true,
                            //   scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              String name = controllers.clientList[index].clientName ?? '';

                              List<String> nameSubstrings = name.split(' ') ?? [];
                              String avatarText1 = nameSubstrings[0].substring(0, 1) ?? '';
                              String avatarText2 = '';
                              if (nameSubstrings.length > 1) {
                                avatarText2 = nameSubstrings[1].substring(0, 1) ?? '';
                              }
                              avatarText = (avatarText1 + avatarText2).toUpperCase();
                              return InkWell(
                                highlightColor: MyColors.white,
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20.0),
                                  child: SupplierScreenWidget(
                                    firstLatter: "${avatarText}",
                                    supplierName: clientController.clientList[index].clientName.toString(),
                                    balance: "\$${clientController.clientList[index].balance}",
                                    // balance: easy.tr("${controller.supplierListModal.data![index].balance}"),
                                  ),
                                ),
                              );
                            }),
                        //  controller.isLoadingNextpage.value? CircularProgressIndicator(): SizedBox()
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
