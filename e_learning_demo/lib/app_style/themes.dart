// import 'package:flutter/material.dart';
// import 'package:up4quote/models/enums/theme_types.dart';
// import 'colors.dart';
// class AThemes {
//   AThemes._();
//   static final darkTheme = ThemeData(
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       primaryColor: Color(0xFF414042),
//       brightness: Brightness.dark,
//       backgroundColor: Color(0xFF58595B),
//       buttonColor: Color(0xFF414042),
//       dialogBackgroundColor: Colors.grey[850],
//       accentColor: AColors.cyan,
//       iconTheme: IconThemeData(
//         color: AColors.cyan,
//       ),
//       dividerColor: Colors.grey[300],
//       sliderTheme: SliderThemeData(
//         activeTrackColor: AColors.cyan,
//         activeTickMarkColor: AColors.cyan,
//         thumbColor: AColors.cyan,
//         overlayColor: AColors.cyan.withOpacity(.3),
//         valueIndicatorColor: AColors.cyan,
//       )
//   );

//   static final lightTheme = ThemeData(
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       primaryColor: Colors.white,
//       brightness: Brightness.light,
//       accentColor: AColors.cyan,

//       iconTheme: IconThemeData(
//         color: Colors.grey,
//       ),
//       dividerColor: Colors.grey[700],
//       sliderTheme: SliderThemeData(
//         activeTrackColor: AColors.cyan,
//         activeTickMarkColor: AColors.cyan,
//         thumbColor: AColors.cyan,
//         overlayColor: AColors.cyan.withOpacity(.3),
//         valueIndicatorColor: AColors.cyan,
//       )
//   );

//   static final localProLightTheme = ThemeData(
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       primaryColor: Colors.white,
//       brightness: Brightness.light,
//       accentColor: AColors.deepCyan,
//       iconTheme: IconThemeData(
//         color: Colors.grey,
//       ),
//       dividerColor: Colors.grey[700],
//       sliderTheme: SliderThemeData(
//         activeTrackColor: AColors.deepCyan,
//         activeTickMarkColor: AColors.deepCyan,
//         thumbColor: AColors.deepCyan,
//         overlayColor: AColors.deepCyan.withOpacity(.3),
//         valueIndicatorColor: AColors.deepCyan,
//       )
//   );

//   static ThemeData getAppTheme(ThemeTypes theme){
//     switch(theme){
//       case ThemeTypes.light: return lightTheme;
//       case ThemeTypes.dark: return darkTheme;
//       case ThemeTypes.local_pro_light: return localProLightTheme;
//       default: return lightTheme;
//     }
//   }
// }