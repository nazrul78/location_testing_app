import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_test_app/src/pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // builder: (context, widget) => ScrollConfiguration(
      //     behavior: ScrollBehaviorModified(), child: widget!),
      //  transitionDuration: Duration(milliseconds: 600),
      defaultTransition: Transition.cupertino,
      smartManagement: SmartManagement.onlyBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
