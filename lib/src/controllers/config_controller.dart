import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:location_test_app/src/base/base.dart';

class ConfigController extends GetxController with Base {
  Future<void> initAppConfig() async {
    WidgetsFlutterBinding.ensureInitialized();
    //-------------------------To get Location Permission-----------------
    // To get location permition.
    try {
      await locationC.getLocationPermission();
    } catch (e) {
      log('', error: e.toString());
    }
  }

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   if (permission != LocationPermission.denied) {
  //     lisenar();
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // }

  // final LocationSettings locationSettings = LocationSettings(
  //   accuracy: LocationAccuracy.high,
  //   // distanceFilter: 100,
  // );

  // lisenar() {
  //   StreamSubscription<Position> positionStream =
  //       Geolocator.getPositionStream(locationSettings: locationSettings)
  //           .listen((Position? position) {
  //     log(position == null
  //         ? 'Unknown'
  //         : '${position.latitude.toString()}, ${position.longitude.toString()}');
  //     if (position != null) {
  //       locationC.cLocation.value =
  //           LatLng(position.latitude, position.longitude);

  //       log('Location: ${position.latitude.toString()}, ${position.longitude.toString()}');
  //     }
  //   });
  // }
}
