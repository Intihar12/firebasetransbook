import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetransbook/controllers/country_code_controller/country_code_controller.dart';
import 'package:firebasetransbook/ui/auth/otp_verification_screen.dart';
import 'package:firebasetransbook/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/auth_controllers/auth_controller.dart';
import '../../utils/utils.dart';
import '../../values/my_colors.dart';
import '../../values/size_config.dart';
import '../../widgets/county_code_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  CountryController countryController = Get.find();
  AuthControllers authControllers = Get.put(AuthControllers());
  final auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomButton(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(Dimens.size20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12),
                  height: 85,
                  //  color: MyColors.yellow1,
                  width: getWidth(Dimens.size70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<CountryController>(builder: (s) {
                        authControllers.code = countryController.selectedValueCountry?.name;
                        print(authControllers.code);
                        return InkWell(
                          onTap: () async {
                            var data = await countryCodeBottomSheet(context);
                            if (data != null) {
                              countryController.selectedValueCountry = data;
                              // print(data);
                              // print(countryController.selectedValueCountry?.name);
                            }
                            countryController.update();
                            // driverController.update();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                countryController.selectedValueCountry!.flag.toString(),
                                width: getWidth(Dimens.size16),
                                height: getHeight(Dimens.size16),
                              ),
                              SizedBox(
                                width: getWidth(Dimens.size8),
                              ),
                              Text(countryController.selectedValueCountry!.name.toString(), style: TextStyles.black14500BLACKPtHeavyWeightTextStyle),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: MyColors.blue1,
                              )
                            ],
                          ),
                        );
                      }),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        // height: getHeight(Dimens.size12),
                        width: getWidth(Dimens.size70),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: MyColors.grey3,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 85,
                  // color: MyColors.red1,
                  width: getWidth(Dimens.size230),
                  child: TextFormField(
                    controller: authControllers.phoneController,
                    decoration: InputDecoration(hintText: "phone num"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(Dimens.size20), vertical: getHeight(Dimens.size20)),
      child: GetBuilder<AuthControllers>(builder: (authController) {
        return GestureDetector(
          onTap: () {
            authControllers.isLoginLoading.value = !authControllers.isLoginLoading.value;
            authControllers.loginFunction();
            // authControllers.loginFunction();
            authControllers.update();
          },
          child: Container(
            alignment: Alignment.center,
            width: getWidth(Dimens.size320),
            height: getHeight(Dimens.size50),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: MyColors.blue1),
            child: authControllers.isLoginLoading.value
                ? Text(
                    "Login",
                    style: TextStyles.white16PtMediumWeightTextStyle,
                  )
                : Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
