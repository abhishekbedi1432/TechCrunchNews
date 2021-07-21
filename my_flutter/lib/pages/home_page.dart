// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
// import 'package:my_app/change_name_card.dart';
// import 'package:my_app/drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:my_flutter/utils/Constants.dart';
// import 'package:my_app/utils/Constants.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum ViewType { list, grid }

class _HomePageState extends State<HomePage> {
  static const platform = MethodChannel(Constants.iOSChannel);

  var url = "https://jsonplaceholder.typicode.com/photos";
  // ignore: prefer_typing_uninitialized_variables
  var data;

  var viewType = ViewType.list;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // print('Fetching Data From Network!');
    var res = await http.get(url);
    data = jsonDecode(res.body);
    // print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Gridview Layout
    var gridView = GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: const EdgeInsets.all(8),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          // ignore: avoid_unnecessary_containers
          return Container(
            child: ListTile(
                leading: Image.network(data[index]['url']),
                title: Text('${data[index]['id']}. ${data[index]['title']}')),
          );
        });

// Listview Layout
    var listView = ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          // ignore: avoid_unnecessary_containers
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                  leading: Image.network(data[index]['url']),
                  onTap: onListTilePressed,
                  title: Text('${data[index]['id']}. ${data[index]['title']}')),
            ),
          );
        });

// BODY
    var body = Padding(
        padding: const EdgeInsets.all(8.0),
        child: data == null
            ? Center(child: CircularProgressIndicator())
            : viewType == ViewType.list
                ? listView
                : gridView);

    return Scaffold(
        appBar: AppBar(
          title: Text("App Title"),
          leading: GestureDetector(
            onTap: () {/* Write listener code here */},
            child: Icon(
              Icons.menu, // add custom icons also
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: onRefreshPressed,
                    child: viewType == ViewType.grid
                        ? Icon(Icons.view_list)
                        : Icon(Icons.grid_view))),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: logout, child: Icon(Icons.exit_to_app))),
          ],
        ),
        body: body);
  }

  Future<void> onListTilePressed() async {
    String? value;

    try {
      value = await platform.invokeMethod(
          "FlutterWantsToCallNativeMethod", ["List Tile Parameter"]);
    } catch (e) {
      // print(e);
    }

    print(value);
  }

  void onRefreshPressed() {
    viewType = viewType == ViewType.list ? ViewType.grid : ViewType.list;
    // print(viewType);
    setState(() {});
  }

  void logout() {
    // Constants.prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacementNamed(context, '/login');
  }
}
