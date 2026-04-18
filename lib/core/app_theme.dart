import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: const Color(0xFF6941C6),
    scaffoldBackgroundColor: whiteColor,
    primaryColorLight: const Color(0xFFF5F1FF),
    dialogBackgroundColor: const Color(0xFFF5F1FF),
    disabledColor: const Color(0xffB4B9BD),
    dividerColor: const Color(0xFFF5F1FF),

    /// 3A3B3C to F5F5F5 // No use
    splashColor: const Color(0xffDFECf5),

    /// 23313B TO DFECf5 vice versa
    fontFamily: GoogleFonts.inter().fontFamily,
    focusColor: const Color(0xff2D7EC1),
    indicatorColor: const Color(0xffffffff),

    /// 242526 TO F5F5F5 vice versa
    cardColor: introductionCardLightThemeColor,
    hoverColor: textFieldLightModeBackGroundColor,

    /// Color(0xffFFFFFF) to  Color(0xff3A3B3C);
    hintColor: textFieldTextColorLightMode,

    /// E4E6EB to 000000 vice versa
    shadowColor: borderColorLightMode,

    ///  C9C9CD TO 3A3B3C
    secondaryHeaderColor: const Color(0xff000000),

    /// 000000 to E4E6EB and vice versa
    highlightColor: loginPagePasswordOrOtpTabBackgroundColorLightMode,
    textTheme: const TextTheme(
      displayLarge: textFieldTextStyleLightMode,
      displayMedium: loginToEcoSystemLightMode,
      displaySmall: drawerItemsLightMode,
      headlineMedium: helloTextHomeLightMode,
      headlineSmall: userTextHomeLightMode,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.all(12.0),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(elevation: 0),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: false,
    primaryColor: const Color(0xFF6941C6),
    dialogBackgroundColor: const Color(0xFFF5F1FF),
    primaryColorLight: const Color(0xFFF5F1FF),
    dividerColor: const Color(0xFFF5F1FF),
    disabledColor: const Color(0xffB4B9BD),
    scaffoldBackgroundColor: blackColorTheme,
    splashColor: const Color(0xff23313B),
    fontFamily: GoogleFonts.inter().fontFamily,
    cardColor: introductionCardDarkThemeColor,
    indicatorColor: backgroundColorDarkTheme,
    focusColor: introductionCardDarkThemeHeadingColor,
    hoverColor: textFieldDarkModeBackGroundColor,
    hintColor: const Color(0xffE6E6E7),
    shadowColor: borderColorDarkMode,

    /// Border Color
    highlightColor: loginPagePasswordOrOtpTabBackgroundColorDarkMode,
    secondaryHeaderColor: const Color(0xffB0B3B8),
    textTheme: const TextTheme(
      displayLarge: textFieldTextStyleDarkMode,
      displayMedium: loginToEcoSystemDarkMode,
      displaySmall: drawerItemsDarkMode,
      headlineMedium: helloTextHomeDarkMode,
      headlineSmall: userTextHomeDarkMode,
    ),
  );

  static const appBarColor = Color(0xFF6941C6);
  static const bottomNavBarColor = Color(0xFF6941C6);
  static const bottomNavBarUnSelectedColor = Color(0xff85BDF1);
  static const marketPlaceDayLeftCardColor = Color(0xff23313B);
  static const walletIconColorLightTheme = Color(0xff04D8D4);
  static const blackColorTheme = Color(0xff000313);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const redColor = Colors.red;
  static const greyishColor = Color(0xff818181);
  static const greenColor = Color(0xff04CE00);
  static const borderColorDarkMode = Color(0xff3A3B3C);
  static const borderColorLightMode = Color(0xffC9C9CD);
  static const backgroundColorDarkTheme = Color(0xff242526);
  static const introductionCardDarkThemeColor = Color(0xff18191A);
  static const blueColor = Color(0xFF6941C6);

  /// Color for introduction skip buttons colors
  static const introductionCardLightThemeColor = const Color(0xFFF5F1FF);
  static const introductionCardDarkThemeHeadingColor = Color(0xff48BAFF);
  static const textFieldDarkModeBackGroundColor = Color(0xff3A3B3C);
  static const textFieldLightModeBackGroundColor = const Color(0xFFF5F1FF);
  static const textFieldTextColorDarkMode = Color(0xffE4E6EB);
  static const textFieldTextColorLightMode = Color(0xff000000);
  static const drawerDividerColorDarkMode = Colors.grey;
  static const drawerDividerColorLightMode = Colors.grey;
  static const loginPagePasswordOrOtpTabBackgroundColorDarkMode = Color(
    0xff18191A,
  );
  static const loginPagePasswordOrOtpTabBackgroundColorLightMode = const Color(
    0xFFF5F1FF,
  );
  static const textFieldTextStyleDarkMode = TextStyle(
    color: Colors.white,
    decoration: TextDecoration.none,
    fontSize: 5,
  );
  static const textFieldTextStyleLightMode = TextStyle(
    color: Colors.black,
    decoration: TextDecoration.none,
    fontSize: 5,
  );
  static const loginToEcoSystemDarkMode = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontFamily: "Inter",
    fontWeight: FontWeight.w500,
  );
  static const loginToEcoSystemLightMode = TextStyle(
    color: Colors.white,
    fontSize: (17),
    fontFamily: "Inter",
    fontWeight: FontWeight.w500,
  );
  static const drawerItemsLightMode = TextStyle(
    color: Colors.black,
    fontSize: (16),
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
  );
  static const drawerItemsDarkMode = TextStyle(
    color: Colors.white,
    fontSize: (16),
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
  );
  static const helloTextHomeLightMode = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: (25),
  );
  static const helloTextHomeDarkMode = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: (25),
  );
  static const userTextHomeLightMode = TextStyle(
    color: Color(0xFF6941C6),
    fontWeight: FontWeight.bold,
    fontSize: (25),
  );
  static const userTextHomeDarkMode = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: (25),
  );

  static get borderColor => const Color(0xFF6941C6).withOpacity(0.3);
  static TextStyle? inputLabelStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;

  // static kBigTextStyleWithPurple() => TextStyle(
  //     fontSize: getFontSize(35),
  //     color: const Color(0xff483AA7),
  //     fontWeight: FontWeight.bold);
  // static knormalStyleWithWhiteColor() => TextStyle(
  //       fontSize: getFontSize(18),
  //       color: whiteColor,
  //     );
  // static knormalStyleWithBlackColor() => TextStyle(
  //       fontSize: getFontSize(18),
  //       color: blackColor,
  //     );
  // static kboldStyleWithBlackColor() => TextStyle(
  //     fontSize: getFontSize(25),
  //     color: blackColor,
  //     fontWeight: FontWeight.bold);
  // static kboldStyleWithBlackColorWithFontSize(double font) => TextStyle(
  //     fontSize: getFontSize(font),
  //     color: blackColor,
  //     fontWeight: FontWeight.w500);
  // static knormalGreyStyleForhintText() => TextStyle(
  //       fontSize: getFontSize(18),
  //       color: const Color(0xff334554).withOpacity(0.3),
  //     );
  // static knormalGreyStyleWithFontSize(double font) => TextStyle(
  //       fontSize: getFontSize(font),
  //       color: const Color(0xff334554).withOpacity(0.5),
  //     );
  // static knormalBlueStyleWithFontSize(double font) => TextStyle(
  //       fontSize: getFontSize(font),
  //       color: const Color(0xff1DA1F2),
  //     );
}
