import 'package:flutter/material.dart';

import '../constants.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import '../values/my_imgs.dart';
import '../values/size_config.dart';

class TripDetailsWidget extends StatelessWidget {
  TripDetailsWidget(
      {Key? key,
      required this.name,
      required this.idnum,
      required this.balance,
      required this.origin,
      required this.destination,
      required this.date,
      required this.lrn,
      required this.status})
      : super(key: key);
  final String name;
  final String idnum;
  final String balance;
  final String origin;
  final String destination;
  final String date;
  final String lrn;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getHeight(Dimens.size154),
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
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyles.veryDarkGrey12400PtTextStyle,
            ),
            SizedBox(
              height: getHeight(Dimens.size6),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  idnum,
                  style: TextStyles.black17PtTextStyle,
                ),
                Text(balance, style: TextStyles.black17PtTextStyle),
              ],
            ),
            SizedBox(
              height: getHeight(Dimens.size12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //color: Colors.red,
                    width: getWidth(Dimens.size90),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Text(
                        origin,
                        style: TextStyles.white14PtLessWeightTextStyle.copyWith(color: MyColors.textAppbarcolor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                SizedBox(
                  width: getWidth(Dimens.size4),
                ),
                Container(
                    child: Image.asset(
                  MyImgs.arrowIcons,
                  width: getWidth(Dimens.size70),
                )),
                SizedBox(
                  width: getWidth(Dimens.size4),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    //  color: Colors.red,
                    width: getWidth(Dimens.size90),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Text(
                          destination,
                          style: TextStyles.white14PtLessWeightTextStyle.copyWith(color: MyColors.textAppbarcolor),
                          overflow: TextOverflow.ellipsis,
                        ))),
              ],
            ),
            SizedBox(
              height: getHeight(Dimens.size6),
            ),
            Text(
              date,
              style: TextStyles.veryDarkGrey12PtTextStyle.copyWith(color: MyColors.black1),
            ),
            SizedBox(
              height: getHeight(Dimens.size25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        MyImgs.flagIcon,
                        width: getWidth(Dimens.size12),
                        height: getHeight(Dimens.size14),
                      ),
                      SizedBox(
                        width: getWidth(Dimens.size5),
                      ),
                      Text(
                        status,
                        style: TextStyles.green12PtTextStyle,
                      )
                    ],
                  ),
                ),
                Text(
                  lrn,
                  style: TextStyles.veryDarkGrey12400PtTextStyle,
                )
              ],
            ),
            SizedBox(
              height: getHeight(Dimens.size10),
            ),
          ],
        ),
      ),
    );
  }
}
