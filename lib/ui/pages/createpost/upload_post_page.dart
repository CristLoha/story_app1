import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart' as loc;
import 'package:provider/provider.dart';
import 'package:story_app1/providers/maps/google_maps_provider.dart';
import 'package:story_app1/static/state/upload/upload_result_state.dart';
import 'package:story_app1/ui/widgets/circle_image_widget.dart';
import 'package:story_app1/ui/widgets/show_full_screen_map_widget.dart';
import 'package:story_app1/ui/widgets/snackbar_widget.dart';
import 'package:story_app1/ui/widgets/title_app_bar_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';
import 'package:story_app1/ui/pages/createpost/widgets/media_picker_button.dart';
import 'package:story_app1/ui/pages/createpost/widgets/post_button_widget.dart';
import 'package:story_app1/ui/pages/createpost/widgets/post_field_widget.dart';
import 'package:story_app1/ui/pages/createpost/widgets/show_image_widget.dart';
import 'package:story_app1/providers/uploadpost/upload_post_provider.dart';
import 'package:geocoding/geocoding.dart' as geo;

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({super.key});

  @override
  State<UploadPostPage> createState() => _PostPageState();
}

class _PostPageState extends State<UploadPostPage> {
  final TextEditingController _descpritionC = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  geo.Placemark? placemark;

  @override
  void initState() {
    super.initState();
    final provider = context.read<UploadPostProvider>();
    _descpritionC.text = provider.description;
    _descpritionC.addListener(() {
      provider.setDescription(_descpritionC.text);
    });
    Future.delayed(Duration(milliseconds: 300), () {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _descpritionC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UploadPostProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<GoogleMapsProvider>().resetForNewContext();
            context.pop();
          },
          icon: Icon(Icons.close, color: ColorsManager.white),
        ),
        centerTitle: false,
        title: TitleAppBarWidget(title: 'Create Post'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.p30,
          horizontal: AppPadding.p24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppMargin.m10,
                children: [
                  CircleImageWidget(url: 'https://picsum.photos/200/200'),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppMargin.m5),
                        PostFieldWidget(
                          descpritionC: _descpritionC,
                          focusNode: _focusNode,
                        ),

                        Consumer<GoogleMapsProvider>(
                          builder: (_, mapsProvider, __) {
                            return AnimatedSwitcher(
                              duration: Duration(milliseconds: 200),
                              child:
                                  mapsProvider.selectedPosition != null
                                      ? Padding(
                                        key: ValueKey(
                                          'location-${mapsProvider.selectedPosition}',
                                        ),
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 8,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: Colors.grey[300]!,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                    color:
                                                        ColorsManager.primary,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Flexible(
                                                    child: Text(
                                                      mapsProvider.address,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            ColorsManager
                                                                .grey900,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              right: -10,
                                              top: -10,
                                              child: GestureDetector(
                                                onTap:
                                                    () =>
                                                        mapsProvider
                                                            .clearLocation(),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: ColorsManager.red,
                                                    shape: BoxShape.circle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            ColorsManager
                                                                .grey900,
                                                        blurRadius: 4,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                    4,
                                                  ),
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 20,
                                                    color: ColorsManager.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      : SizedBox(key: ValueKey('no-location')),
                            );
                          },
                        ),
                        provider.imagePath == null
                            ? SizedBox()
                            : ShowImageWidget(),
                        MediaPickerButtons(
                          onGalleryTap: _onGalleryView,
                          onCameraTap: _onCameraView,
                          onLocationPick: _onLocationPick,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer<UploadPostProvider>(
        builder: (context, provider, child) {
          final isLoading = provider.state is UploadLoadingState;
          final isButtondisabled =
              provider.description.isEmpty ||
              provider.imagePath == null ||
              isLoading;

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
              vertical: AppPadding.p24,
            ),
            child: PostButtonWidget(
              isButtondisabled: isButtondisabled,
              onPressed: isButtondisabled ? null : _onPostSubmit,
              isLoading: isLoading,
            ),
          );
        },
      ),
    );
  }

  Future<void> _onLocationPick() async {
    final provider = context.read<GoogleMapsProvider>();

    final dicodingOffice = const LatLng(-6.8957473, 107.6337669);
    await showDialog(
      context: context,
      builder:
          (context) => ShowFullScreenMapWidget(
            lat: dicodingOffice.latitude,
            lon: dicodingOffice.longitude,
            myLocationEnabled: true,
            showMyLocationButton: true,
            onButtonPressed: onMyLocationButtonPressed,
            addLocation: () {
              if (provider.selectedPosition != null) {
                context.pop(provider.selectedPosition);
              }
            },
            onMapCreated: (controller) async {
              final info = await geo.placemarkFromCoordinates(
                dicodingOffice.latitude,
                dicodingOffice.longitude,
              );

              final place = info[0];
              final street = place.street!;
              final adress =
                  '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
              provider.setController(controller);
              provider.defineMarker(dicodingOffice, street, adress);
            },
            onLongPress: (LatLng latLng) {
              onLongPressGoogleMap(latLng);
            },
          ),
    );
  }

  void onLongPressGoogleMap(LatLng latLng) async {
    final provider = context.read<GoogleMapsProvider>();
    final info = await geo.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    final place = info[0];
    final street = place.street!;
    final adress =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    provider.defineMarker(latLng, street, adress);

    provider.updatePlacemark(place);
    provider.controller.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void onMyLocationButtonPressed() async {
    final provider = context.read<GoogleMapsProvider>();
    final loc.Location location = loc.Location();
    late bool serviceEnabled;
    late loc.PermissionStatus permissionGranted;
    late loc.LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    final info = await geo.placemarkFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );
    final place = info[0];
    final street = place.street!;
    final adress =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    provider.updatePlacemark(place);

    provider.defineMarker(latLng, street, adress);

    provider.controller.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  Future<void> _onPostSubmit() async {
    final provider = context.read<UploadPostProvider>();
    final mapsProvider = context.read<GoogleMapsProvider>();

    await provider.uploadStory(
      lat: mapsProvider.selectedPosition?.latitude,
      lon: mapsProvider.selectedPosition?.longitude,
    );

    if (provider.state is UploadLoadedState) {
      provider.clearImage();
      provider.setDescription('');
      mapsProvider.clearLocation();
      if (mounted) {
        context.pop(true);
      }
    } else if (provider.state is UploadErrorState) {
      if (mounted) {
        SnackbarWidget.showError(
          context,
          (provider.state as UploadErrorState).message,
        );
      }
    }
  }

  _onGalleryView() async {
    final provider = context.read<UploadPostProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  _onCameraView() async {
    final provider = context.read<UploadPostProvider>();

    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    final isiOS = defaultTargetPlatform == TargetPlatform.iOS;
    final isNotMobile = !(isAndroid || isiOS);
    if (isNotMobile) return;
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }
}
