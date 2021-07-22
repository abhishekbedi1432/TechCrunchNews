import 'package:flutter/material.dart';
import 'package:my_flutter/pages/plp_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      theme: ThemeData(primaryColor: Colors.amber),
      home: PLPPage()));
}
