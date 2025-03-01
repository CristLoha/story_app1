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
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PostProvider>();
    final isButtonDisabled =
        _controller.text.isEmpty || provider.imagePath == null;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: ColorsManager.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'Create Post',
          style: getWhiteTextStyle().copyWith(fontSize: AppSize.s24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p16,
          horizontal: AppPadding.p24,
        ),
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
                              controller: _controller,
                              focusNode: _focusNode,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "What's on your mind?",
                                border: InputBorder.none,
                              ),
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      provider.imagePath == null ? SizedBox() : _showImage(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(Icons.photo_library, color: Colors.grey),
                            onPressed: () => _onGalleryView(),
                          ),
                          IconButton(
                            icon: Icon(Icons.camera_alt, color: Colors.grey),
                            onPressed: () {},
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
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          right: 10,
        ),
        child: FloatingActionButton(
          onPressed:
              isButtonDisabled
                  ? null
                  : () {
                    // Implementasi post di sini
                  },
          backgroundColor:
              isButtonDisabled ? Colors.grey : ColorsManager.primary,
          child: Icon(Icons.send, color: Colors.white),
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
            borderRadius: BorderRadius.circular(12),
            child: Image.file(File(imagePath.toString()), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 15,
          right: 20,
          child: GestureDetector(
            onTap: () {
              provider.setImagePath(null);
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.grey900,
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

    /// Cek apakah MacOS atau Linux
    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    /// Ambil gambar dari galeri
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    /// Update state jika gambar terpilih
    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
      setState(() {});
    }
  }
}
