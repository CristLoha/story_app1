import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/data/model/story/story.dart';
import 'package:story_app1/providers/maps/google_maps_provider.dart';
import 'package:story_app1/ui/pages/detail/widgets/icon_button_widget.dart';
import 'package:story_app1/ui/pages/home/widgets/show_image_widget.dart';
import 'package:story_app1/ui/widgets/google_map_widget.dart';
import 'package:story_app1/ui/widgets/show_full_screen_map_widget.dart';
import 'package:story_app1/ui/widgets/title_app_bar_widget.dart';

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
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Consumer<GoogleMapsProvider>(
                            builder: (context, provider, _) {
                              return GoogleMapWidget(
                                target: LatLng(story.lat!, story.lon!),
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
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return ShowFullScreenMapWidget(
                                  lat: story.lat!,
                                  lon: story.lon!,
                                  locationName: story.name,
                                );
                              },
                            );
                          },
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
