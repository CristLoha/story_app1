import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/providers/maps/google_maps_provider.dart';
import 'package:story_app1/ui/pages/createpost/widgets/place_marker_widget.dart';
import 'package:story_app1/ui/pages/detail/widgets/icon_button_widget.dart';
import 'package:story_app1/ui/widgets/google_map_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';

class ShowFullScreenMapWidget extends StatelessWidget {
  final double lat;
  final double lon;
  final String? locationName;
  final VoidCallback? onButtonPressed;
  final void Function(GoogleMapController)? onMapCreated;
  final bool myLocationEnabled;
  final Function(LatLng)? onLongPress;
  final bool shouldShowPlacemark;
  final bool showMyLocationButton;
  final void Function()? addLocation;
  final void Function()?  onCloseButtonPressed;
  const ShowFullScreenMapWidget({
    super.key,
    required this.lat,
    required this.lon,
    this.locationName,
    this.onMapCreated,
    this.onButtonPressed,
    this.myLocationEnabled = false,
    this.onLongPress,
    this.shouldShowPlacemark = false,
    this.showMyLocationButton = false,
    this.addLocation,
    required this.onCloseButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Consumer<GoogleMapsProvider>(
        builder: (context, provider, _) {
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.9,
                child: GoogleMapWidget(
                  myLocationEnabled: myLocationEnabled,
                  target: LatLng(lat, lon),
                  markers: provider.markers,
                  onLongPress: onLongPress,
                  onMapCreated:
                      onMapCreated ??
                      (controller) {
                        provider.setController(controller);
                        provider.setStoryLocation(lat, lon, locationName!);
                      },
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: IconButtonWidget(
                  onPressed: onCloseButtonPressed,

                  icon: Icons.close,
                ),
              ),

              if (myLocationEnabled)
                Positioned(
                  top: 16,
                  right: 16,
                  child: FloatingActionButton(
                    backgroundColor: ColorsManager.primary,
                    onPressed: onButtonPressed ?? () {},
                    child: Icon(Icons.my_location, color: ColorsManager.white),
                  ),
                ),
              if (shouldShowPlacemark && provider.placemark == null)
                const SizedBox()
              else
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Column(
                    children: [
                      if (provider.placemark == null)
                        SizedBox()
                      else ...[
                        PlacemarkWidget(placemark: provider.placemark!),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: addLocation,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Add Location",
                            style: TextStyle(color: ColorsManager.white),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

              Positioned(
                bottom: 185,
                right: 16,
                child: Column(
                  children: [
                    FloatingActionButton.small(
                      backgroundColor: ColorsManager.primary,
                      onPressed: () {
                        provider.controller.animateCamera(
                          CameraUpdate.zoomIn(),
                        );
                      },
                      heroTag: "zoom-in",
                      child: Icon(
                        Icons.zoom_in,
                        color: ColorsManager.white,
                        size: 35,
                      ),
                    ),
                    FloatingActionButton.small(
                      backgroundColor: ColorsManager.primary,
                      onPressed: () {
                        provider.controller.animateCamera(
                          CameraUpdate.zoomOut(),
                        );
                      },
                      heroTag: "zoom-out",
                      child: Icon(
                        Icons.zoom_out,
                        color: ColorsManager.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
