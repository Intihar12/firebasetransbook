import 'package:firebasetransbook/values/my_colors.dart';
import 'package:firebasetransbook/values/my_fonts.dart';
import 'package:firebasetransbook/values/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStyles {
  static TextStyle hintNormalTextStyle = TextStyle(
    fontFamily: MyFonts.rubik,
    color: Colors.grey,
    fontSize: getFont(14.0),
  );

  static TextStyle darkGreyNormalTextStyle = TextStyle(color: Colors.grey.shade600, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);

  static TextStyle darkGrey16PtMediumWeightTextStyle = TextStyle(color: Colors.grey.shade700, fontFamily: MyFonts.rubik, fontSize: getFont(16.0), fontWeight: FontWeight.w600);

  static TextStyle darkGrey15PtMediumWeightTextStyle = TextStyle(color: Colors.grey.shade700, fontFamily: MyFonts.rubik, fontSize: getFont(15.0), fontWeight: FontWeight.w500);

  static TextStyle darkGreyMediumShadeSmallTextStyle = TextStyle(color: Colors.grey.shade600, fontSize: getFont(12.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);
  static TextStyle red1MediumShadeSmallTextStyle = TextStyle(color: MyColors.red1, fontSize: getFont(12.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);

  static TextStyle veryDarkGreyNormalTextStyle = TextStyle(
      color: Colors.grey.shade800,
      //fontSize: 14.0,
      fontSize: getFont(14.0),
      fontFamily: MyFonts.rubik,
      fontWeight: FontWeight.w400);

  static TextStyle veryDarkGrey12PtTextStyle = TextStyle(color: Colors.grey.shade800, fontFamily: MyFonts.rubik, fontSize: getFont(12.0), fontWeight: FontWeight.w400);

  static TextStyle veryDarkGrey12400PtTextStyle = TextStyle(color: MyColors.black1, fontSize: getFont(12.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);
  static TextStyle black1LessWeight12500PtTextStyle = TextStyle(
      color: MyColors.black1,
      fontFamily: MyFonts.rubik,

      // fontSize: 12.0,
      fontSize: getFont(12.0),
      fontWeight: FontWeight.w500);
  static TextStyle veryDarkGrey16PtTextStyle = TextStyle(color: Colors.grey.shade800, fontFamily: MyFonts.rubik, fontSize: getFont(16.0), fontWeight: FontWeight.w400);

  static TextStyle black12PtTextStyle = TextStyle(color: Colors.black, fontSize: getFont(12.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w600);

  static TextStyle blackMediumWeight13PtTextStyle = TextStyle(color: Colors.black, fontSize: getFont(13.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w600);

  static TextStyle blackNormalTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: MyFonts.rubik,
    fontSize: getFont(14.0),
  );

  static TextStyle black14PtHeavyWeightTextStyle = TextStyle(color: Colors.black, fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w700);
  static TextStyle black14500PtHeavyWeightTextStyle = TextStyle(color: MyColors.black1, fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w500);
  static TextStyle black10500PtHeavyWeightTextStyle = TextStyle(color: MyColors.black1, fontSize: getFont(10.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);
  static TextStyle black10400PtHeavyWeightTextStyle = TextStyle(color: MyColors.black1, fontSize: getFont(10.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);
  static TextStyle black14500BLACKPtHeavyWeightTextStyle = TextStyle(color: MyColors.textAppbarcolor, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle black14500bluePtHeavyWeightTextStyle = TextStyle(color: MyColors.blue1, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle black2500bluePtHeavyWeightTextStyle = TextStyle(color: MyColors.black2, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle black214500bluePtHeavyWeightTextStyle = TextStyle(color: MyColors.black2, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);

  static TextStyle black14400BLACKPtHeavyWeightTextStyle = TextStyle(color: MyColors.textAppbarcolor, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);
  static TextStyle black12400BLACKPtHeavyWeightTextStyle = TextStyle(color: MyColors.textAppbarcolor, fontSize: getFont(12.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);

  static TextStyle black14greyBLACKPtHeavyWeightTextStyle = TextStyle(color: MyColors.grey3, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);
  static TextStyle grey14greyBLACKPtHeavyWeightTextStyle = TextStyle(color: MyColors.grey3, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);
  static TextStyle grey10greyBLACKPtHeavyWeightTextStyle = TextStyle(color: MyColors.grey3, fontSize: getFont(10.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle black14blackBLACKPtHeavyWeightTextStyle = TextStyle(color: MyColors.black1, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);

  static TextStyle black16PtLessWeightTextStyle = TextStyle(color: Colors.black, fontSize: getFont(16.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle blue16textStyle = TextStyle(color: MyColors.blue1, fontSize: getFont(16.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle black16PtHeavyWeightTextStyle = TextStyle(color: Colors.black, fontSize: getFont(16.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w700);

  static TextStyle black16PtTextStyle = TextStyle(color: Colors.black, fontSize: getFont(16.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);
  static TextStyle black16400PtTextStyle = TextStyle(color: MyColors.black1, fontSize: getFont(16.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);

  static TextStyle black17PtTextStyle = TextStyle(color: MyColors.textAppbarcolor, fontFamily: MyFonts.rubik, fontSize: getFont(16.0), fontWeight: FontWeight.w500);
  static TextStyle black1617PtTextStyle = TextStyle(color: MyColors.textAppbarcolor, fontFamily: MyFonts.rubik, fontSize: getFont(16.0), fontWeight: FontWeight.w400);

  static TextStyle black1PtTextStyle = TextStyle(color: MyColors.black1, fontFamily: MyFonts.rubik, fontSize: getFont(16.0), fontWeight: FontWeight.w400);

  static TextStyle black16500PtTextStyle = TextStyle(color: MyColors.black1, fontFamily: MyFonts.rubik, fontSize: getFont(16.0), fontWeight: FontWeight.w500);
  static TextStyle whiteLessWeight2050PtTextStyle = TextStyle(color: MyColors.textAppbarcolor, fontFamily: MyFonts.rubik, fontSize: getFont(20.0), fontWeight: FontWeight.w500);
  static TextStyle blackBigHeadingTextStyle = TextStyle(color: Colors.black, fontFamily: MyFonts.rubik, fontSize: getFont(25.0), fontWeight: FontWeight.bold);

  // static TextStyle black30PtLessWeightRubikTextStyle = GoogleFonts.rubik(
  //     color: Colors.black,
  //     fontSize: getFont(30.0),
  //     fontWeight: FontWeight.w500);
  //
  // static TextStyle PtLessWeightRubikTextStyle = GoogleFonts.rubik(
  //     color: MyColors.textAppbarcolor,
  //     fontSize: getFont(30.0),
  //     fontWeight: FontWeight.w500);
  //
  // static TextStyle PtLess30WeightRubikTextStyle = GoogleFonts.rubik(
  //     color: MyColors.green4,
  //     fontSize: getFont(30.0),
  //     fontWeight: FontWeight.w500);
  // static TextStyle PtLess16WeightRubikTextStyle = GoogleFonts.rubik(
  //     color: MyColors.green4,
  //     fontSize: getFont(16.0),
  //     fontWeight: FontWeight.w500);

  static TextStyle black30PtHeavyWeightTextStyle = TextStyle(color: Colors.black, fontFamily: MyFonts.rubik, fontSize: getFont(30.0), fontWeight: FontWeight.bold);
  static TextStyle blackMediumWeight18PtTextStyle = TextStyle(color: MyColors.textAppbarcolor, fontFamily: MyFonts.rubik, fontSize: getFont(18.0), fontWeight: FontWeight.w500);
  static TextStyle blackMediumHeadingTextStyle = TextStyle(color: Colors.black, fontSize: getFont(20.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.bold);

  static TextStyle redBigWeight16PtTextStyle = TextStyle(color: Color(0xffFD2225), fontSize: getFont(16.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w700);

  static TextStyle red16BigWeight16PtTextStyle = TextStyle(color: MyColors.red1, fontSize: getFont(16.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle redLessWeight14PtTextStyle = TextStyle(color: Color(0xffE0454B), fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w500);
  static TextStyle blackLessWeight14PtTextStyle = TextStyle(color: MyColors.textAppbarcolor, fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w500);

  static TextStyle orangeLessWeight14PtTextStyle = TextStyle(color: MyColors.orange2, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);
  static TextStyle orang2eLessWeight14PtTextStyle = TextStyle(color: MyColors.orange2, fontFamily: MyFonts.rubik, fontSize: getFont(10.0), fontWeight: FontWeight.w500);
  static TextStyle red1LessWeight14PtTextStyle = TextStyle(color: MyColors.red1, fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w500);
  static TextStyle red30LessWeight14PtTextStyle = TextStyle(color: MyColors.red1, fontSize: getFont(30.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle red14Pt500WeightTextStyle = TextStyle(color: Colors.red.shade600, fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w600);

  static TextStyle redHeavyWeight14PtTextStyle = TextStyle(color: Color(0xffFD2225), fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w700);

  static TextStyle redLessWeight13PtTextStyle = TextStyle(color: Color(0xffFD2225), fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w500);

  static TextStyle redMediumWeight18PtTextStyle = TextStyle(color: Color(0xffFD2225), fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w500);

  static TextStyle redBigWeight18PtTextStyle = TextStyle(color: Color(0xffFD2225), fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w700);

  static TextStyle red12PtTextStyle = TextStyle(color: Color(0xffFD2225), fontFamily: MyFonts.rubik, fontSize: getFont(12.0), fontWeight: FontWeight.w500);
  static TextStyle red2PtTextStyle = TextStyle(color: MyColors.red2, fontFamily: MyFonts.rubik, fontSize: getFont(12.0), fontWeight: FontWeight.w500);

  static TextStyle green12PtTextStyle = TextStyle(color: MyColors.green1, fontFamily: MyFonts.rubik, fontSize: getFont(12.0), fontWeight: FontWeight.w500);

  static TextStyle green1050PtTextStyle = TextStyle(color: MyColors.green1, fontFamily: MyFonts.rubik, fontSize: getFont(10.0), fontWeight: FontWeight.w500);

  static TextStyle red11PtTextStyle = TextStyle(
    color: Color(0xffFD2225),
    fontFamily: MyFonts.rubik,
    fontSize: getFont(11.0),
  );

  static TextStyle white15PtLessWeightTextStyle = TextStyle(color: Colors.white, fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w500);

  static TextStyle whiteBigWeightTextStyle = TextStyle(color: Colors.white, fontFamily: MyFonts.rubik, fontSize: getFont(20.0), fontWeight: FontWeight.w800);

  static TextStyle whiteLessWeight20PtTextStyle = TextStyle(color: Colors.white, fontSize: getFont(20.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);
  static TextStyle LessWeight20PtTextStyle = TextStyle(color: MyColors.textAppbarcolor, fontFamily: MyFonts.rubik, fontSize: getFont(20.0), fontWeight: FontWeight.w500);

  static TextStyle white12LessWeight20PtTextStyle = TextStyle(color: Colors.white, fontSize: getFont(12.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);
  static TextStyle white12500LessWeight20PtTextStyle = TextStyle(color: Colors.white, fontSize: getFont(12.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle whiteMediumWeight25PtTextStyle = TextStyle(color: Colors.white, fontSize: getFont(25.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w600);

  static TextStyle whiteBigHeadingTextStyle = TextStyle(color: Colors.white, fontFamily: MyFonts.rubik, fontSize: getFont(24.0), height: 1.1, fontWeight: FontWeight.bold);

  static TextStyle white18PtMediumWeightTextStyle = TextStyle(color: Colors.white, fontSize: getFont(18.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w700);

  static TextStyle white14PtHeavyWeightTextStyle = TextStyle(color: Colors.white, fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w700);

  static TextStyle white14PtLessWeightTextStyle = TextStyle(color: Colors.white, fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w400);
  static TextStyle white14500PtLessWeightTextStyle = TextStyle(color: Colors.white, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle black1PtLessWeightTextStyle = TextStyle(color: MyColors.textAppbarcolor, fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w500);

  static TextStyle white12PtMediumWeightTextStyle = TextStyle(color: Colors.white, fontFamily: MyFonts.rubik, fontSize: getFont(12.0), fontWeight: FontWeight.w600);

  static TextStyle white16PtMediumWeightTextStyle = TextStyle(color: Colors.white, fontFamily: MyFonts.rubik, fontSize: getFont(16.0), fontWeight: FontWeight.w600);
  static TextStyle white1PtMediumWeightTextStyle = TextStyle(color: Colors.white, fontFamily: MyFonts.rubik, fontSize: getFont(16.0), fontWeight: FontWeight.w500);

  static TextStyle blue14PtHeavyWeightTextStyle = TextStyle(color: Color(0xff0e7fe1), fontFamily: MyFonts.rubik, fontSize: getFont(16.0), fontWeight: FontWeight.w700);
  static TextStyle blue3PtHeavyWeightTextStyle = TextStyle(color: MyColors.blue3, fontFamily: MyFonts.rubik, fontSize: getFont(14.0), fontWeight: FontWeight.w500);

  static TextStyle blue14500PtHeavyWeightTextStyle = TextStyle(color: MyColors.blue1, fontSize: getFont(16.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle blue30PtHeavyWeightTextStyle = TextStyle(color: AppColors.mainColor, fontFamily: MyFonts.rubik, fontSize: getFont(35.0), fontWeight: FontWeight.bold);

  static TextStyle orangeLessWeight12PtTextStyle = TextStyle(color: Colors.orange, fontSize: getFont(12.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle black1LessWeight12PtTextStyle = TextStyle(color: MyColors.black1, fontFamily: MyFonts.rubik, fontSize: getFont(12.0), fontWeight: FontWeight.w400);
  static TextStyle black1LessWeightred12PtTextStyle = TextStyle(color: MyColors.red1, fontFamily: MyFonts.rubik, fontSize: getFont(12.0), fontWeight: FontWeight.w400);

  static TextStyle blue1LessWeight12PtTextStyle = TextStyle(color: MyColors.blue1, fontFamily: MyFonts.rubik, fontSize: getFont(12.0), fontWeight: FontWeight.w500);

  static TextStyle green1LessWeight12PtTextStyle = TextStyle(color: MyColors.green1, fontFamily: MyFonts.rubik, fontSize: getFont(10.0), fontWeight: FontWeight.w500);
  static TextStyle green14LessWeight12PtTextStyle = TextStyle(color: MyColors.green1, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);
  static TextStyle green4LessWeight12PtTextStyle = TextStyle(color: MyColors.green4, fontSize: getFont(14.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle green12LessWeight12PtTextStyle = TextStyle(color: MyColors.green4, fontSize: getFont(12.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w400);

  static TextStyle green412LessWeight12PtTextStyle = TextStyle(color: MyColors.green4, fontSize: getFont(12.0), fontFamily: MyFonts.rubik, fontWeight: FontWeight.w500);

  static TextStyle lightGreySlimText = TextStyle(color: Colors.grey, fontFamily: MyFonts.rubik, fontSize: getFont(15.0));
}

class AppColors {
  static Color mainColor = Color(0xff2879F3);

  static const MaterialColor primaryColor = const MaterialColor(
    0xff2879F3,
    const <int, Color>{
      50: const Color(0xff2879F3),
      100: const Color(0xff2879F3),
      200: const Color(0xff2879F3),
      300: const Color(0xff2879F3),
      400: const Color(0xff2879F3),
      500: const Color(0xff2879F3),
      600: const Color(0xff2879F3),
      700: const Color(0xff2879F3),
      800: const Color(0xff2879F3),
      900: const Color(0xff2879F3),
    },
  );
}

class GetTransition {
  static Transition pageTransition = Transition.rightToLeft;
}

class TimeoutDuration {
  static Duration time10Sec = Duration(seconds: 10);
  static Duration time15Sec = Duration(seconds: 15);
}
