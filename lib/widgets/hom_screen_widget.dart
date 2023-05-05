import 'package:flutter/material.dart';

import '../constants.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import '../values/size_config.dart';

class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget({Key? key, this.text, this.onTap, this.backGroundColor, this.icon}) : super(key: key);
  String? text;
  final VoidCallback? onTap;
  final Color? backGroundColor;
  String? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: MediaQuery.of(context).size.width /
        //     3.35,
        // height: 110,
        width: getWidth(Dimens.size100),
        height: getHeight(Dimens.size110),
        decoration: BoxDecoration(
            // color: Color(0xffFA8626),
            color: backGroundColor,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon!,
                width: getWidth(Dimens.size27),
                height: getHeight(Dimens.size27),
                color: MyColors.white,
              ),
              SizedBox(
                height: getHeight(Dimens.size10),
              ),
              Text(
                text!,
                style: TextStyles.white15PtLessWeightTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
