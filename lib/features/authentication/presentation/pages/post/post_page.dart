import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';
import 'package:story_app1/providers/post_provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsManager.white),
        centerTitle: false,
        title: Text(
          'Create Post',
          style: getWhiteTextStyle().copyWith(fontSize: AppSize.s24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p50,
          horizontal: AppPadding.p24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/200/200',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jhon',
                          style: getGrey900TextStyle().copyWith(
                            fontSize: AppSize.s18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 10,
                              bottom: 0,
                              child: Container(width: 3, color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintText: "What's on your mind?",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        context.watch<PostProvider>().imagePath == null
                            ? SizedBox()
                            : _showImage(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(Icons.camera_alt, color: Colors.grey),
                              onPressed: () {
                                // Aksi untuk membuka kamera
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.photo_library,
                                color: Colors.grey,
                              ),
                              onPressed: () => _onGalleryView(),
                            ),
                          ],
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
    );
  }

  Widget _showImage() {
    final provider = context.read<PostProvider>();
    final imagePath = provider.imagePath;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12), // Radius sudut gambar
            child: Image.file(File(imagePath.toString()), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 15,
          right: 20,
          child: GestureDetector(
            onTap: () => provider.setImagePath(null), // Menghapus gambar
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.grey900, // Background tombol
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }

  _onGalleryView() async {
    final provider = context.read<PostProvider>();

    /// todo-gallery-06: check if MacOS and Linux
    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    /// todo-gallery-01: initial ImagePicker class
    final picker = ImagePicker();

    /// todo-gallery-02: pick image from gallery
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    /// todo-gallery-03: check the result and update the image
    if (pickedFile != null) {
      /// todo-gallery-05: update the state, imagePath and imageFile
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }
}
