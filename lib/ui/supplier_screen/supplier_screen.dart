import 'package:firebasetransbook/ui/supplier_screen/supplier_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/supplier_controller/supplier_controller.dart';
import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';
import '../../values/size_config.dart';
import '../../widgets/supplier_create_bottomSheet_widget.dart';
import '../../widgets/supplier_screen_widget.dart';

class SupplierScreen extends StatelessWidget {
  SupplierScreen({Key? key}) : super(key: key);
  SupplierController supplierController = Get.put(SupplierController());
  String? avatarText;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupplierController>(builder: (supplierController) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: MyColors.white,
          floatingActionButton: supplierController.isSupplierData.value
              ? Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      // controllers.buttonLoading.value = true;
                      supplierCreateBottomSheet(context);

                      //controllers.nameController.clear();
                      //controllers.phoneController.clear();
                    },
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                    backgroundColor: MyColors.blue1,
                  ),
                )
              : null,
          appBar: supplierController.isSupplierData.value
              ? AppBar(
                  elevation: 0,
                  backgroundColor: MyColors.white,
                  automaticallyImplyLeading: false,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Text("suppliers", style: TextStyles.blackMediumWeight18PtTextStyle),
                      SizedBox(
                        width: getWidth(Dimens.size120),
                      ),
                      // AppBarWidget()
                    ],
                  ),
                )
              : null,
          body: supplierController.isSupplierData.value
              ? supplierController.supplierList.isNotEmpty
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 37),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TotalSupplierBalance",
                              style: TextStyles.veryDarkGrey12400PtTextStyle,
                            ),
                            SizedBox(
                              height: Dimens.size10,
                            ),
                            // GetBuilder<StatisticsController>(builder: (statisticController) {
                            //   return Text(easy.tr("currencySymbol") + ("${statisticController.statisticsModal.data?.supplierBalance}"),
                            //       style: TextStyles.PtLessWeightRubikTextStyle);
                            // }),

                            SizedBox(
                              height: getHeight(Dimens.size30),
                            ),
                            TextFormField(
                              // controller: controller.searchControlle,
                              //  onChanged: (value) {
                              //    if (debounce?.isActive ?? false) debounce?.cancel();
                              //    debounce = Timer(const Duration(milliseconds: 500), () {
                              //      if (controller.searchControlle.text.isNotEmpty) {
                              //        controllers.searchSupplierFunction(value);
                              //      } else {
                              //        controller.supplierList();
                              //      }
                              //    });
                              //  },
                              inputFormatters: [LengthLimitingTextInputFormatter(20)],
                              keyboardType: TextInputType.text,
                              cursorColor: MyColors.grey3,
                              style: TextStyles.black1PtLessWeightTextStyle,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: MyColors.grey3),
                                  ),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColors.grey3)),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 25,
                                    minHeight: 25,
                                  ),
                                  // focusedBorder: UnderlineInputBorder(),
                                  border: UnderlineInputBorder(),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ), // icon is 48px widget.
                                  ),
                                  hintText: 'Searchbysuppliername',
                                  hintStyle: TextStyles.black14greyBLACKPtHeavyWeightTextStyle),
                            ),
                            SizedBox(
                              height: Dimens.size30,
                            ),
                            Text("supplierstruckowner", style: TextStyles.black14500PtHeavyWeightTextStyle),
                            SizedBox(
                              height: Dimens.size30,
                            ),
                            // controllers.fondsearchlist.isNotEmpty
                            //     ?
                            ListView.builder(
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
                                      Get.to(SupplierDetailsScreen());
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
                                })

                            // : Center(
                            //     child: Text(easy.tr("noSearchResultFound")),
                            //   )
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Text("No supplier is added"),
                    )
              : Center(
                  child: CircularProgressIndicator(),
                ));
    });
  }
}
