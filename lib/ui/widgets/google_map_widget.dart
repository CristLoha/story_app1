import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  final LatLng target;
  final Set<Marker> markers;
  final Function(GoogleMapController)? onMapCreated;
  const GoogleMapWidget({
    super.key,
    required this.target,
    required this.markers,
    this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      initialCameraPosition: CameraPosition(target: target, zoom: 18),
      markers: markers,
      onMapCreated: onMapCreated,
    );
  }
}
