import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class Constants {
//   static String appName = "Furniture App";

//   //Colors for theme
//   static Color lightPrimary = Color(0xfffcfcff);
//   static Color darkPrimary = Colors.black;
//   static Color lightAccent = Colors.orange;
//   static Color darkAccent = Colors.orangeAccent;
//   static Color lightBG = Color(0xfffcfcff);
//   static Color darkBG = Colors.black;

//   static ThemeData lightTheme = ThemeData(
//     backgroundColor: lightBG,
//     primaryColor: lightPrimary,
//     accentColor: lightAccent,
//     cursorColor: lightAccent,
//     scaffoldBackgroundColor: lightBG,
//     appBarTheme: AppBarTheme(
//       color: Colors.white,
//       iconTheme: IconThemeData(color: Colors.black),
//       elevation: 0,
//       textTheme: TextTheme(
//         headline6: TextStyle(
//           color: darkBG,
//           fontSize: 18.0,
//           fontWeight: FontWeight.w800,
//         ),
//       ),
//     ),
//   );

//   static ThemeData darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     backgroundColor: darkBG,
//     primaryColor: darkPrimary,
//     accentColor: Colors.orange,
//     scaffoldBackgroundColor: darkBG,
//     textSelectionTheme: TextSelectionThemeData(cursorColor: darkAccent),
//     appBarTheme: AppBarTheme(
//       color: Colors.black,
//       iconTheme: IconThemeData(color: Colors.white),
//       elevation: 0,
//       titleTextStyle: TextStyle(
//         color: lightBG,
//         fontSize: 18.0,
//         fontWeight: FontWeight.w800,
//       ),
//     ),
//   );
// }

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme;
  Typography defaultTypography;
  SharedPreferences prefs;

  ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    primaryColor: Colors.black,
    accentColor: Colors.orange,
    scaffoldBackgroundColor: Colors.black,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.orangeAccent),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xfffcfcff),
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  ThemeData light = ThemeData.light().copyWith(
      
    backgroundColor: Color(0xfffcfcff),
    primaryColor: Color(0xfffcfcff),
    accentColor: Colors.orange,
    cursorColor: Colors.orange,
    scaffoldBackgroundColor: Color(0xfffcfcff),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
      
      );

  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme;
}
