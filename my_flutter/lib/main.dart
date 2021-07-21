import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_flutter/pages/home_page.dart';
import 'package:my_flutter/utils/Constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Constants.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      theme: ThemeData(primaryColor: HexColor(Constants.appPrimaryColor)),
      home: PLPPage()));
}
