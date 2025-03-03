import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app1/common/widgets/circle_image_widget.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/font_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';
import 'package:story_app1/features/authentication/data/model/post_model.dart';
import 'package:story_app1/features/authentication/presentation/pages/home/widgets/post_user_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final List<String> quotes = [
      "Believe in yourself and all that you are. ✨",
      "The only way to do great work is to love what you do. 💡",
      "Success is not final, failure is not fatal. 🔥",
      "Dream big and dare to fail. 🚀",
      "Every moment is a fresh beginning. 🌅",
      "Happiness depends upon ourselves. 😊",
      "Be yourself; everyone else is already taken. 🎭",
      "Turn your wounds into wisdom. 🌿",
      "Do what you can, with what you have, where you are. 🏆",
      "What we think, we become. 🌟",
    ];

    final List<String> usernames = [
      "Michael",
      "Sophia",
      "Daniel",
      "Emma",
      "James",
      "Olivia",
      "Alexander",
      "Ava",
      "Benjamin",
      "Charlotte",
    ];

    final List<PostModel> dummyData = List.generate(
      10,
      (index) => PostModel(
        image: "https://picsum.photos/200/300?random=${index + 1}",
        text: quotes[index], // Ambil quote sesuai index
        username: usernames[index], // Pakai nama manusia
        time: "${(index + 1) * 5} minutes ago",
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Snap Story',
          style: getWhiteTextStyle().copyWith(fontSize: AppSize.s30),
        ),
      ),
      body: ListView(
        children: [
          // Tombol Posting
          Padding(
            padding: EdgeInsets.only(
              left: AppPadding.p24,
              right: AppPadding.p24,
              top: AppPadding.p50,
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
          SizedBox(height: 30),

          // Postingan Utama
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
