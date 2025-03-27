import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/data/model/story/story.dart';
import 'package:story_app1/providers/maps/google_maps_provider.dart';
import 'package:story_app1/ui/pages/detail/widgets/icon_button_widget.dart';
import 'package:story_app1/ui/pages/home/widgets/show_image_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';

class StoryDetailPage extends StatelessWidget {
  final Story story;

  const StoryDetailPage({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    if (story.lat != null && story.lon != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<GoogleMapsProvider>(
          context,
          listen: false,
        ).setStoryLocation(story.lat!, story.lon!, story.name);
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  story.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(story.description, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Expanded(child: ShowImageWidget(imageUrl: story.photoUrl)),
          if (story.lat != null && story.lon != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Consumer<GoogleMapsProvider>(
                            builder: (context, provider, _) {
                              return GoogleMap(
                                myLocationButtonEnabled: false,
                                zoomControlsEnabled: false,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(story.lat!, story.lon!),
                                  zoom: 18,
                                ),
                                markers: provider.markers,
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButtonWidget(
                          icon: Icons.fullscreen,
                          onPressed:
                              () => showFullScreenMapDialog(
                                context,
                                story.lat!,
                                story.lon!,
                                story.name,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

void showFullScreenMapDialog(
  BuildContext context,
  double lat,
  double lon,
  String locationName,
) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Consumer<GoogleMapsProvider>(
                builder: (context, provider, _) {
                  return GoogleMap(
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(lat, lon),
                      zoom: 18,
                    ),
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
    },
  );
}
