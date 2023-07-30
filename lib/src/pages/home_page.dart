import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_test_app/src/base/base.dart';

class HomePage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Location testing'),
        centerTitle: true,
      ),
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (locationC.cLocation.value == null)
                CircularProgressIndicator(),
              SizedBox(height: 20),
              locationC.cLocation.value != null
                  ? Text(
                      'Current Location Data:( Lat: ${locationC.cLocation.value!.latitude}, Lng: ${locationC.cLocation.value!.longitude})')
                  : Text('GPS data is not available. Please wait a moment...')
            ],
          ),
        ),
      ),
    );
  }
}
