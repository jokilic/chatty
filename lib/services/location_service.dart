import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:get/get.dart';
import 'package:location/location.dart' as location;

import 'logger_service.dart';

class LocationService extends GetxService {
  final logger = Get.find<LoggerService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  ///
  final _latitude = 0.0.obs;
  double get latitude => _latitude.value;
  set latitude(double value) => _latitude.value = value;

  ///
  final _longitude = 0.0.obs;
  double get longitude => _longitude.value;
  set longitude(double value) => _longitude.value = value;

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// Gets latitude and longitude of the device
  Future<bool> getLocationWithGeolocatorPackage() async {
    late bool serviceEnabled;
    late geolocator.LocationPermission permission;

    try {
      serviceEnabled = await geolocator.Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        logger
          ..e('LOCATION - GEOLOCATOR')
          ..e('--------------------')
          ..e('Location services are disabled')
          ..e('--------------------\n');

        return false;
      }

      permission = await geolocator.Geolocator.checkPermission();
      if (permission == geolocator.LocationPermission.denied) {
        permission = await geolocator.Geolocator.requestPermission();
        if (permission == geolocator.LocationPermission.denied) {
          logger
            ..e('LOCATION - GEOLOCATOR')
            ..e('--------------------')
            ..e('Location permissions are denied')
            ..e('--------------------\n');

          return false;
        }
      }

      if (permission == geolocator.LocationPermission.deniedForever) {
        logger
          ..e('LOCATION - GEOLOCATOR')
          ..e('--------------------')
          ..e('Location permissions are permanently denied')
          ..e('--------------------\n');

        return false;
      }

      final position = await geolocator.Geolocator.getCurrentPosition();

      latitude = position.latitude;
      longitude = position.longitude;

      logger
        ..d('LOCATION - GEOLOCATOR')
        ..d('--------------------')
        ..d('Location fetched')
        ..d('Latitude: $latitude')
        ..d('Longitude: $longitude')
        ..d('--------------------\n');

      return true;
    } catch (e) {
      logger
        ..e('LOCATION - GEOLOCATOR')
        ..e('--------------------')
        ..e('Location error')
        ..e('--------------------\n');
      return false;
    }
  }

  /// Get location with [Location] package
  Future<bool> getLocationWithLocationPackage() async {
    final locationInstance = location.Location();

    bool? serviceEnabled;
    location.PermissionStatus? permissionGranted;

    try {
      serviceEnabled = await locationInstance.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await locationInstance.requestService();
        if (!serviceEnabled) {
          logger
            ..e('LOCATION - LOCATION')
            ..e('--------------------')
            ..e('Location services are disabled')
            ..e('--------------------\n');
          return false;
        }
      }

      permissionGranted = await locationInstance.hasPermission();
      if (permissionGranted == location.PermissionStatus.denied) {
        permissionGranted = await locationInstance.requestPermission();
        if (permissionGranted != location.PermissionStatus.granted) {
          logger
            ..e('LOCATION - LOCATION')
            ..e('--------------------')
            ..e('Location permissions are denied')
            ..e('--------------------\n');
          return false;
        }
      }

      final locationData = await locationInstance.getLocation();

      if (locationData.latitude != null && locationData.longitude != null) {
        latitude = locationData.latitude!;
        longitude = locationData.longitude!;

        logger
          ..d('LOCATION - LOCATION')
          ..d('--------------------')
          ..d('Location fetched')
          ..d('Latitude: $latitude')
          ..d('Longitude: $longitude')
          ..d('--------------------\n');

        return true;
      }

      return false;
    } catch (e) {
      logger
        ..e('LOCATION - LOCATION')
        ..e('--------------------')
        ..e('Location error')
        ..e('--------------------\n');
      return false;
    }
  }
}
