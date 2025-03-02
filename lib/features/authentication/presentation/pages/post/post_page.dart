import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';
import 'package:story_app1/features/authentication/presentation/pages/post/widgets/post_field_widget.dart';
import 'package:story_app1/features/authentication/presentation/pages/post/widgets/show_image_widget.dart';
import 'package:story_app1/providers/post_provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _descpritionC = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(microseconds: 300), () {
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
    final postProvider = context.watch<PostProvider>();
    final isButtondisabled =
        postProvider.description.isEmpty || postProvider.imagePath == null;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: ColorsManager.white),
        ),
        centerTitle: false,
        title: Text(
          'Create Post',
          style: getWhiteTextStyle().copyWith(fontSize: AppSize.s24),
        ),
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
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/200/200',
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jhon',
                          style: getGrey900TextStyle().copyWith(
                            fontSize: AppSize.s18,
                          ),
                        ),

                        SizedBox(height: AppMargin.m5),
                        PostFieldWidget(
                          descpritionC: _descpritionC,
                          focusNode: _focusNode,
                        ),
                        postProvider.imagePath == null
                            ? SizedBox()
                            : ShowImageWidget(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () => _onGalleryView(),
                              icon: Icon(
                                Icons.photo_library,
                                color: ColorsManager.grey500,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt,
                                color: ColorsManager.grey500,
                              ),
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
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          right: 10,
        ),
        child: FloatingActionButton(
          onPressed: isButtondisabled ? null : () {},
          backgroundColor:
              isButtondisabled ? ColorsManager.grey500 : ColorsManager.primary,
          child: Icon(Icons.send, color: ColorsManager.white),
        ),
      ),
    );
  }

  _onGalleryView() async {
    final postProvider = context.read<PostProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postProvider.setImageFile(pickedFile);
      postProvider.setImagePath(pickedFile.path);
    }
  }
}
