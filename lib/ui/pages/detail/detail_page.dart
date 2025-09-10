import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/data/model/story/story.dart';
import 'package:story_app1/providers/maps/google_maps_provider.dart';
import 'package:story_app1/ui/pages/home/widgets/show_image_widget.dart';
import 'package:story_app1/ui/widgets/google_map_widget.dart';
import 'package:story_app1/ui/widgets/title_app_bar_widget.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:story_app1/utils/theme_manager/color_manager.dart';

class StoryDetailPage extends StatefulWidget {
  final Story story;

  const StoryDetailPage({super.key, required this.story});

  @override
  State<StoryDetailPage> createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  @override
  void initState() {
    super.initState();
    // Clear previous location data when entering the detail page
    // to ensure a fresh state for the map.
    context.read<GoogleMapsProvider>().clearLocation();
  }

  @override
  Widget build(BuildContext context) {
    final story = widget.story;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        context.read<GoogleMapsProvider>().clearLocation();
        context.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TitleAppBarWidget(title: "Detail"),
          centerTitle: false,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              color: ColorsManager.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                    Text(
                      story.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              ShowImageWidget(imageUrl: story.photoUrl),
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
                                  height: 300,
                                  width: double.infinity,
                                  child: GoogleMapWidget(
                                    target: LatLng(story.lat!, story.lon!),
                                    markers: provider.markers,
                                    onMapCreated:
                                        (controller) => _setupMap(
                                          provider,
                                          story,
                                          controller,
                                        ),
                                  ),
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
        ),
      ),
    );
  }

  void _setupMap(
    GoogleMapsProvider provider,
    Story story,
    GoogleMapController controller,
  ) async {
    provider.setController(controller);
    try {
      final placemarks = await geo.placemarkFromCoordinates(
        story.lat!,
        story.lon!,
      );

      if (placemarks.isNotEmpty && mounted) {
        final place = placemarks[0];
        final street = place.street ?? 'Unknown Street';
        final address =
            '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

        provider.defineMarker(LatLng(story.lat!, story.lon!), street, address);
        controller.animateCamera(
          CameraUpdate.newLatLngZoom(LatLng(story.lat!, story.lon!), 18),
        );
      }
    } catch (e) {
      debugPrint('Error setting up map: $e');
    }
  }
}
