import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';

class PlacemarkWidget extends StatelessWidget {
  final geo.Placemark placemark;
  const PlacemarkWidget({super.key, required this.placemark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 700),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            offset: Offset.zero,
            color: ColorsManager.grey600,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(placemark.street!, style: getGrey900TextStyle()),
                Text(
                  '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}',
                  style: getGrey600TextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
