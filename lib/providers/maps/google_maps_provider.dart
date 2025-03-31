import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsProvider extends ChangeNotifier {
  late GoogleMapController _controller;
  final Set<Marker> _markers = {};
  String _locationName = "Loading...";

  GoogleMapController get controller => _controller;
  Set<Marker> get markers => _markers;
  String get locationName => _locationName;

  void setController(GoogleMapController controller) {
    _controller = controller;
    notifyListeners();
  }

  void setStoryLocation(double lat, double lon, String name) async {
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

  void setMarker(LatLng latLng, {String id = "source"}) {
    _markers.clear();
    _markers.add(Marker(markerId: MarkerId(id), position: latLng));
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
