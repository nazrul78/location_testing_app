import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class LocationController extends GetxController {
  LatLng? currentLatLng;

  final cLocation = Rx<LatLng?>(null);

  /// To get current Location data.
  Future<void> getLocationPermission() async {
    // LocationPermission permission = await Geolocator.requestPermission();

    // log('${permission}');

    try {
      // bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      // serviceEnabled = await Geolocator.isLocationServiceEnabled();
      // if (!serviceEnabled) {
      //   // Location services are not enabled don't continue
      //   // accessing the position and request users of the
      //   // App to enable the location services.
      //   return Future.error('Location services are disabled.');
      // }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          // return Future.error('Location permissions are denied');
        }
      }

      log('${permission}' + '??????????????????');

      // if (permission == LocationPermission.deniedForever) {
      //   // Permissions are denied forever, handle appropriately.
      //   return Future.error(
      //       'Location permissions are permanently denied, we cannot request permissions.');
      // }

      if (permission != LocationPermission.whileInUse ||
          permission != LocationPermission.always) {
        locationListener();
      }
    } catch (e) {
      log('Cannot get the GPS location', error: e.toString());
    }
  }

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    // distanceFilter: 100,
  );

  /// To listen current location after per second.
  void locationListener() async {
    // StreamSubscription<Position> positionStream =
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      log(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
      if (position != null) {
        cLocation.value = LatLng(position.latitude, position.longitude);

        log('Location: ${position.latitude.toString()}, ${position.longitude.toString()}');
      }
    });
  }

  /// To listen current location after per second.
  // Future<void> locationListener() async {
  //   final permissionGranted = await location.hasPermission();
  //   if (permissionGranted != PermissionStatus.denied) {
  //     location.onLocationChanged.listen(
  //       (LocationData currentLocation) {
  //         try {
  //           if (currentLocation != null) {
  //             log('Current Location: Lat${currentLocation.latitude}, Lng${currentLocation.latitude}');
  //             final latLng = LatLng(
  //               currentLocation.latitude!,
  //               currentLocation.longitude!,
  //             );
  //             currentLatLng = latLng;
  //             cLocation.value = latLng;

  //             //=============== To move current location when it changing ===========
  //             // if (Get.put(HomeMapViewController())
  //             //     .isCurrentLocationEnable
  //             //     .value) {
  //             //   Get.put(HomeMapViewController()).showCurrentLocationOnMap();
  //             // }

  //             // if (Get.put(PatrolController()).isCurrentLocationEnable.value) {
  //             //   Get.put(PatrolController()).showCurrentLocationOnMap();
  //             // }
  //           }
  //         } catch (e) {
  //           log(e.toString());
  //         }
  //       },
  //     );
  //   }
  // }

  //Background Location unable
  // Future<bool> toggleBackgroundMode(bool enable) async {
  //   try {
  //     final bool result = await location.enableBackgroundMode(enable: enable);
  //     return result;
  //   } on PlatformException catch (err) {
  //     log(err.toString());
  //     return false;
  //   }
  // }

  /// To get current Location data.
  // Future<LocationData?> getCurrentLocation() async {
  //   try {
  //     final LocationData currentLocation = await location.getLocation();
  //     if (currentLocation != null) {
  //       return currentLocation;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return null;
  //   }
  // }

  /// To get current LatLng.
  // LatLng? getCurrenLatLng() {
  //   try {
  //     if (currentLatLng != null) {
  //       return currentLatLng;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return null;
  //   }
  // }

  /// To get current Location Permission.
  // Future<void> getLocationPermission() async {
  //   Location locations = Location();
  //   bool isServiceEnabled;
  //   PermissionStatus isPermissionGranted;

  //   isServiceEnabled = await locations.serviceEnabled();
  //   if (!isServiceEnabled) {
  //     isServiceEnabled = await locations.requestService();
  //     if (!isServiceEnabled) {
  //       return;
  //     }
  //   }
  //   isPermissionGranted = await locations.hasPermission();
  //   if (isPermissionGranted == PermissionStatus.denied) {
  //     isPermissionGranted = await locations.requestPermission();
  //     if (isPermissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  // }
}
