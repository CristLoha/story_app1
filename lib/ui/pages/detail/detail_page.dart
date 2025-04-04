import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/data/model/story/story.dart';
import 'package:story_app1/providers/maps/google_maps_provider.dart';
import 'package:story_app1/ui/pages/createpost/widgets/place_marker_widget.dart';
import 'package:story_app1/ui/pages/home/widgets/show_image_widget.dart';
import 'package:story_app1/ui/widgets/google_map_widget.dart';
import 'package:story_app1/ui/widgets/title_app_bar_widget.dart';
import 'package:geocoding/geocoding.dart' as geo;
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
      appBar: AppBar(
        title: TitleAppBarWidget(title: "Detail"),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            context.read<GoogleMapsProvider>().clearLocation();
            context.pop();
          },
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: ColorsManager.white,
          ),
        ),
      ),
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
                  Consumer<GoogleMapsProvider>(
                    builder: (context, provider, _) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: GoogleMapWidget(
                                target: LatLng(story.lat!, story.lon!),
                                markers: provider.markers,
                                onLongPress: (LatLng latLng) async {
                                  {
                                    onLongPressGoogleMap(latLng, context);
                                  }
                                },
                              ),
                            ),
                          ),
                          if (provider.placemark == null)
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
                                    PlacemarkWidget(
                                      placemark: provider.placemark!,
                                      sizeStreetTitle: 16,
                                      sizeAddressTitle: 12,
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> onLongPressGoogleMap(LatLng latLng, BuildContext context) async {
    final provider = context.read<GoogleMapsProvider>();

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

        provider.defineMarker(latLng, street, address);
        provider.updatePlacemark(place);
        provider.controller.animateCamera(CameraUpdate.newLatLng(latLng));
      }
    } catch (e) {
      debugPrint('Error fetching location details: $e');
    }
  }
}
