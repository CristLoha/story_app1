import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class GoogleMapsProvider extends ChangeNotifier {
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};
  String _locationName = "Loading..."; // Tambahin ini buat nama lokasi

  GoogleMapController? get controller => _controller;
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
        infoWindow: InfoWindow(title: name),
        onTap: () {
          animateToLocation(lat, lon);
        },
      ),
    );

    await _convertCoordinatesToAddress(lat, lon); // Panggil geocoding
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
    if (_controller != null) {
      _controller!.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(lat, lon), 18),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
