import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app1/ui/widgets/circle_image_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';
import 'package:story_app1/data/model/post_model.dart';
import 'package:story_app1/ui/pages/home/widgets/post_user_widget.dart';
import 'package:story_app1/services/sesion_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sesionManager = SesionManager();
    final List<String> quotes = [
      "Believe in yourself and all that you are. ✨",
      "The only way to do great work is to love what you do. 💡",
    ];
    final List<String> usernames = ["Michael", "Sophia"];
    final List<PostModel> dummyData = List.generate(
      2,
      (index) => PostModel(
        image: "https://picsum.photos/200/300?random=${index + 1}",
        text: quotes[index],
        username: usernames[index],
        time: "${(index + 1) * 5} minutes ago",
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Snap Story',
          style: getWhiteTextStyle().copyWith(fontSize: AppSize.s30),
        ),
        actions: [
          MoreActionButtonWidget(sesionManager: sesionManager),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: AppPadding.p16),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p24,
              right: AppPadding.p24,
            ),
            child: Row(
              children: [
                CircleImageWidget(url: "https://picsum.photos/200/200"),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => context.go('/home/post'),
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                        color: ColorsManager.softWhite,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: ColorsManager.grey300,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "What's on your mind?",
                          style: getGrey900TextStyle().copyWith(
                            fontWeight: FontWeightManager.regular,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              final post = dummyData[index];
              return PostUserWidget(
                urlImageUser: "https://picsum.photos/200/200?random=$index",
                urlImagePost: post.image,
                userName: post.username,
                caption: post.text,
                time: post.time,
                postId: index.toString(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MoreActionButtonWidget extends StatelessWidget {
  const MoreActionButtonWidget({
    super.key,
    required this.sesionManager,
  });

  final SesionManager sesionManager;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_vert,color: ColorsManager.white,),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.language, color: Colors.black54),
                    title: Text("Ganti Bahasa"),
                    onTap: () {
                      Navigator.pop(context);
                      // Tambahkan aksi untuk mengubah bahasa
                    },
                  ),
                  Divider(height: 1, color: ColorsManager.white),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text("Log out"),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: Text("Log out of your account?"),
                              contentPadding: EdgeInsets.only(
                                top: 20,
                                left: 24,
                                right: 24,
                              ),
                              actions: [
                                Column(
                                  children: [
                                    Divider(
                                      height: 1,
                                      color: Colors.grey[300],
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        final router = GoRouter.of(
                                          context,
                                        ); // Simpan router sebelum async gap
    
                                        await sesionManager
                                            .clearSession(); // Hapus sesi
    
                                        if (context.mounted) {
                                          router.go(
                                            '/login',
                                          ); // Navigasi ke login
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            Colors.red, // Warna merah
                                        textStyle: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      child: Text("Log out"),
                                    ),
                                    Divider(
                                      height: 1,
                                      color: Colors.grey[300],
                                    ), // Garis pemisah
                                    TextButton(
                                      onPressed:
                                          () => Navigator.pop(
                                            context,
                                          ), // Tutup dialog
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            Colors.black, // Warna default
                                        textStyle: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      child: Text("Cancel"),
                                    ),
                                  ],
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
      },
    );
  }
}
