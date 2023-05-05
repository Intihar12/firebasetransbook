import 'package:flutter/material.dart';

import '../constants.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import '../values/size_config.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key, required this.text, required this.select, required this.index, required this.ontap, this.colors}) : super(key: key);
  final String text;
  final int select;
  final int index;
  final Function() ontap;

  final Color? colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        padding: EdgeInsets.only(left: getWidth(Dimens.size10), right: getWidth(Dimens.size10)),
        alignment: Alignment.center,
        height: getHeight(Dimens.size36),

        //  width: getWidth(Dimens.size64),
        decoration: BoxDecoration(
            color: select == index ? MyColors.black1 : MyColors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: select == index ? MyColors.black1 : MyColors.black.withOpacity(0.4))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyles.black1LessWeight12500PtTextStyle.copyWith(color: select == index ? MyColors.white : MyColors.black1),
            ),
            colors != null
                ? Padding(
                    padding: EdgeInsets.only(left: getWidth(Dimens.size8)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(Dimens.size8)),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: colors == "" ? colors : colors
                          // color:colors :  MyColors.green1,
                          ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
