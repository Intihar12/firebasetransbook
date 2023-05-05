import 'package:flutter/material.dart';

import '../constants.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import '../values/my_imgs.dart';
import '../values/size_config.dart';

class HomeScreenAllContainersWidgets extends StatelessWidget {
  HomeScreenAllContainersWidgets({Key? key, this.onTap, this.icon, this.text}) : super(key: key);
  String? text;
  final VoidCallback? onTap;
  String? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //  width: MediaQuery.of(context).size.width / 2.23,
        // height: 100,
        width: getWidth(Dimens.size154),
        height: getHeight(Dimens.size100),

        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 4,
            offset: Offset(0.0, 0.5), //(x,y)
            blurRadius: 6,
          ),
        ]),
        child: Padding(
          padding: EdgeInsets.only(left: getWidth(Dimens.size12), right: getWidth(Dimens.size12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                icon.toString(),
                width: getWidth(
                  Dimens.size28,
                ),
                height: getHeight(Dimens.size28),
              ),
              SizedBox(
                height: getHeight(Dimens.size12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text!,
                    style: TextStyles.black16PtLessWeightTextStyle,
                  ),
                  Image.asset(
                    MyImgs.arrowForward,
                    width: getWidth(
                      Dimens.size14,
                    ),
                    height: getHeight(Dimens.size10),
                    color: MyColors.blue1,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
