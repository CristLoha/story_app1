import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  final LatLng target;
  final Set<Marker> markers;
  final Function(GoogleMapController)? onMapCreated;
  final bool myLocationEnabled;
  final Function(LatLng)? onLongPress;

  const GoogleMapWidget({
    super.key,
    required this.target,
    required this.markers,
    this.onMapCreated,
    this.myLocationEnabled = false,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      myLocationEnabled: myLocationEnabled,
      onLongPress: onLongPress,
      initialCameraPosition: CameraPosition(target: target, zoom: 18),
      markers: markers,
      onMapCreated: onMapCreated,
    );
  }
}
