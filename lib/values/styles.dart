
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dimens.dart';
import 'my_colors.dart';
import 'my_fonts.dart';




class Styles {
  static final appTheme = _baseTheme.copyWith(
    iconTheme: const IconThemeData(
      color: MyColors.black,
      size: Dimens.size20,
    ),
    textTheme: _baseTextTheme,
    cardTheme: _baseTheme.cardTheme.copyWith(
      margin: EdgeInsets.zero,
    ),
    textSelectionTheme: _baseTheme.textSelectionTheme.copyWith(
      cursorColor: _colorScheme.secondary,
      selectionHandleColor: _colorScheme.secondary,
    ),



    appBarTheme: AppBarTheme(
        // systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: MyColors.primaryColor,
        //     statusBarIconBrightness: Brightness.dark,
        //     statusBarBrightness: Brightness.light
        // ),
        backgroundColor: _colorScheme.primary,
    titleTextStyle: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold)),
    scrollbarTheme: ScrollbarThemeData(
        isAlwaysShown: true,
        showTrackOnHover: true,
        interactive: true,

        trackColor: MaterialStateProperty.all(MyColors.green100 ),
        trackBorderColor: MaterialStateProperty.all(MyColors.yellow),
        thickness: MaterialStateProperty.all(5),
        thumbColor: MaterialStateProperty.all(MyColors.darkBlue),
        radius: const Radius.circular(10),
        minThumbLength: 10),
  );



  static final secondaryTextTheme = _baseTextTheme.apply(
    displayColor: MyColors.white,
    bodyColor: MyColors.white200,
  );

  static final onSecondaryTextTheme = _baseTextTheme.apply(
    displayColor: MyColors.black,
    bodyColor: MyColors.black,
  );

  static const _colorScheme = ColorScheme.light(
    primary: MyColors.primaryColor,
    secondary: MyColors.black,
    onPrimary: MyColors.white,
    onSecondary: MyColors.parpal,
    onBackground: MyColors.appBackground,

  );

  static final _baseTheme = ThemeData.from(
    colorScheme: _colorScheme,
    textTheme: Typography
        .material2018()
        .black
        .apply(
      fontFamily: MyFonts.roboto,
      displayColor: _colorScheme.secondary,
      bodyColor: _colorScheme.secondary,
    ),
  );

  static final _baseTextTheme = _baseTheme.textTheme.copyWith(
    headline1: _baseTheme.textTheme.headline1!.copyWith(
      color: MyColors.textAppbarcolor,
      fontSize: 18.0,
      height: 1.5,
      fontWeight: FontWeight.w500,
    ),
    headline2: _baseTheme.textTheme.headline2!.copyWith(
      color: MyColors.textAppbarcolor,
      fontSize: 14.0,
      height: 1.5,
      fontWeight: FontWeight.w500,
    ),
    headline3: _baseTheme.textTheme.headline3!.copyWith(
      fontSize: 18.0,
      color: MyColors.black,
      height: 1.5,
      fontWeight: FontWeight.w700,
    ),
    headline4: _baseTheme.textTheme.headline4!.copyWith(
      color: MyColors.black,
      fontSize: 16.0,
      height: 1.5,
      fontWeight: FontWeight.w700,
    ),
    headline5: _baseTheme.textTheme.headline5!.copyWith(
      fontSize: 14.0,
      color: MyColors.black,
      height: 1.5,
      fontWeight: FontWeight.w700,
    ),
    headline6: _baseTheme.textTheme.headline6!.copyWith(
      fontSize: 12.0,
      color: MyColors.black,
      height: 1.5,
      fontWeight: FontWeight.w400,
    ),
    bodyText1: _baseTheme.textTheme.bodyText1!.copyWith(
        fontSize: 16.0,
        color: MyColors.black,
        height: 1.5,
        fontWeight: FontWeight.normal
    ),
    bodyText2: _baseTheme.textTheme.bodyText2!.copyWith(
        fontSize: 14.0,
        color: MyColors.black,
        height: 1.5,
        fontWeight: FontWeight.w700
    ),

    subtitle1: _baseTheme.textTheme.subtitle1!.copyWith(
        fontSize: 12.0,
        color: MyColors.black,
        height: 1.5,
        fontWeight: FontWeight.w700
    ),
    subtitle2: _baseTheme.textTheme.subtitle2!.copyWith(
        fontSize: 12.0,
        color: MyColors.black,
        //  decoration: TextDecoration.underline,
        height: 1.5,
        fontWeight: FontWeight.normal
    ),
    caption: _baseTheme.textTheme.caption!.copyWith(
      fontSize: 12.0,
      color: MyColors.grey,
      height: 1.5,
    ),
    overline: _baseTheme.textTheme.overline!.copyWith(
      fontSize: 8,

      color: MyColors.grey,
      height: 1.5,
    ),
  );

  static final _accentTextTheme = _baseTextTheme.apply(
    displayColor: _colorScheme.secondary,
    bodyColor: _colorScheme.secondary,
  );

  Styles._();
}