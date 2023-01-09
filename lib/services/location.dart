import 'package:location/location.dart';

class LocationServices {
  Future<LocationData>? GetLocation() async {
    Location location = Location();
    bool? serviceenable;
    PermissionStatus? Status;
    LocationData? locationdata;

    serviceenable = await location.serviceEnabled();
    if (serviceenable) serviceenable = await location.requestService();

    Status = await location.hasPermission();

    if (Status == PermissionStatus.denied)
      Status = await location.requestPermission();


    locationdata = await location.getLocation();
    return  locationdata;
  }
}
