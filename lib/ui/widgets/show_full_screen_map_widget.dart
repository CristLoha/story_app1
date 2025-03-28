
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/providers/maps/google_maps_provider.dart';
import 'package:story_app1/ui/pages/detail/widgets/icon_button_widget.dart';
import 'package:story_app1/ui/widgets/google_map_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';

class ShowFullScreenMapWidget extends StatelessWidget {
  final double lat;
  final double lon;
  final String locationName;
  const ShowFullScreenMapWidget({
    super.key,
    required this.lat,
    required this.lon,
    required this.locationName,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Consumer<GoogleMapsProvider>(
              builder: (context, provider, _) {
                return GoogleMapWidget(
                  target: LatLng(lat, lon),
                  markers: provider.markers,
                  onMapCreated: (controller) {
                    provider.setController(controller);
                    provider.setStoryLocation(lat, lon, locationName);
                  },
                );
              },
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButtonWidget(
              onPressed: () => context.pop(),
              icon: Icons.close,
            ),
          ),
          // Positioned(
          //   top: 100,
          //   left: 20,
          //   right: 20,
          //   child: Consumer<GoogleMapsProvider>(
          //     builder: (context, provider, _) {
          //       return provider.locationName.isNotEmpty
          //           ? Container(
          //             padding: const EdgeInsets.all(12),
          //             decoration: BoxDecoration(
          //               color: ColorsManager.white,
          //               borderRadius: BorderRadius.circular(12),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: ColorsManager.grey900,
          //                   blurRadius: 5,
          //                 ),
          //               ],
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Icon(Icons.location_on, color: ColorsManager.red),
          //                 const SizedBox(width: 8),
          //                 Expanded(
          //                   child: Text(
          //                     provider.locationName,
          //                     style: const TextStyle(fontSize: 16),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           )
          //           : const SizedBox();
          //     },
          //   ),
          // ),
          Consumer<GoogleMapsProvider>(
            builder: (context, provider, _) {
              return Positioned(
                bottom: 16,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
