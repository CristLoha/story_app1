import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart' as loc;

class GoogleMapsProvider extends ChangeNotifier {
  late GoogleMapController _controller;
  final Set<Marker> _markers = {};
  geo.Placemark? _placemark;
  String _locationName = "Loading...";
  String _street = "";
  String _address = "";
  bool _isConfirmed = false;
  bool get isConfirmed => _isConfirmed;

  LatLng? get selectedPosition =>
      _isConfirmed && _markers.isNotEmpty ? _markers.first.position : null;

  geo.Placemark? get placemark => _placemark;
  String get street => _street;
  String get address => _address;
  GoogleMapController get controller => _controller;
  Set<Marker> get markers => _markers;
  String get locationName => _locationName;

  void updatePlacemark(Placemark place) {
    _placemark = place;
    _street = place.street ?? "Unknown Street";
    _address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    notifyListeners();
  }

  void setController(GoogleMapController controller) {
    _controller = controller;
    notifyListeners();
  }

  void setStoryLocation(lat, double lon, String name) async {
    _markers.clear();
    _markers.add(
      Marker(
        markerId: MarkerId(name),
        position: LatLng(lat, lon),
        infoWindow: InfoWindow(title: locationName),
        onTap: () {
          animateToLocation(lat, lon);
        },
      ),
    );

    await _convertCoordinatesToAddress(lat, lon);
    notifyListeners();
  }

  void addMarker(LatLng position, String id) {
    final marker = Marker(markerId: MarkerId(id), position: position);
    _markers.add(marker);
    notifyListeners();
  }

  void defineMarker(LatLng latLng, String street, String address) {
    _markers.clear();
    _markers.add(
      Marker(
        markerId: MarkerId("source"),
        position: latLng,
        infoWindow: InfoWindow(title: street, snippet: address),
      ),
    );
    _isConfirmed = false;
    notifyListeners();
  }

  void confirmLocation() {
    _isConfirmed = true;
    notifyListeners();
  }

  Future<void> _convertCoordinatesToAddress(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        _locationName =
            "${place.subLocality}, ${place.locality}, ${place.administrativeArea}";
      } else {
        _locationName = "Unknown location";
      }
    } catch (e) {
      _locationName = "Error fetching location";
    }
    notifyListeners();
  }

  void animateToLocation(double lat, double lon) {
    _controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lon), 18));
  }

  Future<void> updateMarkerOnLongPress(LatLng latLng) async {
    try {
      final info = await geo.placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (info.isNotEmpty) {
        final place = info[0];
        final street = place.street ?? 'Unknown Street';
        final address =
            '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

        defineMarker(latLng, street, address);
        updatePlacemark(place);
        _controller.animateCamera(CameraUpdate.newLatLng(latLng));
      }
    } catch (e) {
      debugPrint("Error on long press: $e");
    }
  }

  Future<void> moveToCurrentUserLocation() async {
    final loc.Location location = loc.Location();
    late bool serviceEnabled;
    late loc.PermissionStatus permissionGranted;
    late loc.LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        debugPrint("Location service is not enabled.");
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        debugPrint("Location permission not granted.");
        return;
      }
    }

    try {
      locationData = await location.getLocation();
      final latLng = LatLng(locationData.latitude!, locationData.longitude!);
      await updateMarkerOnLongPress(latLng);
    } catch (e) {
      debugPrint("Error getting current location: $e");
    }
  }

  void clearLocation() {
    _markers.clear();
    _placemark = null;
    _locationName = "Loading...";
    _street = "";
    _address = "";
    _isConfirmed = false;
    notifyListeners();
  }
}
