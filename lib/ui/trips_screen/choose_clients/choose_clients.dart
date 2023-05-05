import 'dart:async';

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

class ChooseClients extends StatefulWidget {
  ChooseClients({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  State<ChooseClients> createState() => _ChooseClientsState();
}

class _ChooseClientsState extends State<ChooseClients> {
  ClientController clientController = Get.find();
  TripController controller = Get.find();

  var avatarText;

  String? selectedId;

  Timer? debounce;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<ClientController>(builder: (clientController) {
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
                        "chooseClients",
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
                      createClientBottomSheet(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: getHeight(Dimens.size50),
                      width: getWidth(Dimens.size320),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100), border: Border.all(color: MyColors.blue1, width: 2), color: MyColors.white),
                      child: Text(
                        "addClients",
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
                        physics: NeverScrollableScrollPhysics(),
                        // itemCount: 2,
//controller: controllers.controller,

                        itemCount: clientController.clientList.length,
                        shrinkWrap: true,
                        //   scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          String name = clientController.clientList[index].clientName ?? '';

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
                              controller.clientName = clientController.clientList[index].clientName.toString();
                              Get.back(result: controller.clientName);
                              controller.update();
                              clientController.update();
                            },
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
