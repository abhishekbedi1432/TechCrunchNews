import 'package:flutter/material.dart';
import 'package:my_flutter/pages/home_page.dart';
// import 'package:my_flutter/utils/Constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Constants.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage()
      //  Constants.prefs.getBool('isLoggedIn') == true
      //     ? LoginPage()
      //     : PLPPageFB(),
      // routes: {
      //   '/login': (context) => LoginPage(),
      //   '/home': (context) => PLPPageFB(),
      // },
      ));
}
