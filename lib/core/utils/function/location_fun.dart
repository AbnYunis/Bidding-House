import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> requestLocationPermissionAndRetrieveLocation() async {
  final status = await Permission.location.status;

  if (status.isDenied || status.isPermanentlyDenied|| status.isRestricted) {
    // Request location permission
    final permissionStatus = await Permission.location.request();

    if (permissionStatus.isGranted) {
      // Permission is granted, retrieve the location
      final locationLink = await getLocationLink();

      return locationLink;
    } else {
      openAppSettings();
      return 'Permission denied by user';
    }
  } else {
    final locationLink = await getLocationLink();

    return locationLink;
  }
}

Future<String> getLocationLink() async {
  try {
    // Get the current position
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Extract latitude and longitude from the position
    // final latitude = position.latitude;
    // final longitude = position.longitude;

    // Construct the HTTPS link using the latitude and longitude
    //final link = 'https://maps.google.com/maps?q=$latitude,$longitude';
    List<Placemark> placeMarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude
    );
    String location='${placeMarks[0].locality!} ${placeMarks[0].postalCode!} ${placeMarks[0].country!}';
    return location;
  } catch (e) {
    // Handle any errors that may occur during location retrieval
    return 'Error retrieving location: $e';
  }
}
