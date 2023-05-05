import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/auth_controllers/auth_controller.dart';
import '../../values/size_config.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    final authController = Get.put(AuthControllers());

    super.initState();
    //Timer(Duration(seconds: 5), () => authController.splashFunction());
    authController.splashFunction();
    authController.update();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/splashImg.png",
                  width: MediaQuery.of(context).size.width,
                  //width: getWidth(Dimens.size450),

                  height: MediaQuery.of(context).size.height / 1.65,
                  //fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 60,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Trans',
                    style: TextStyles.black30PtHeavyWeightTextStyle,
                    children: <TextSpan>[
                      TextSpan(text: 'Book', style: TextStyles.blue30PtHeavyWeightTextStyle),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Manage your transport business",
                  style: TextStyles.blackNormalTextStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
