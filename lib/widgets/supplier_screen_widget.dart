import 'package:flutter/material.dart';

import '../constants.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import '../values/my_imgs.dart';
import '../values/size_config.dart';

class SupplierScreenWidget extends StatelessWidget {
  const SupplierScreenWidget(
      {Key? key,
      required this.firstLatter,
      required this.supplierName,
      required this.balance})
      : super(key: key);
  final String firstLatter;
  final String supplierName;
  final String balance;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var them = Theme.of(context);
    var textTheme = them.textTheme;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Dimens.size28,
                  height: Dimens.size28,
                  decoration: BoxDecoration(
                      color: MyColors.black2, shape: BoxShape.circle),
                  child: Text(
                    firstLatter,
                    style: TextStyles.white14500PtLessWeightTextStyle,
                  ),
                ),
                SizedBox(
                  width: Dimens.size10,
                ),
                Text(
                  supplierName,
                  style: TextStyles.blackLessWeight14PtTextStyle,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(balance, style: TextStyles.black17PtTextStyle),
                SizedBox(
                  width: Dimens.size10,
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
            ),
          )
        ],
      ),
    );
  }
}
