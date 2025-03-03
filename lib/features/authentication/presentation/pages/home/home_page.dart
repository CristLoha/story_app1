import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app1/common/widgets/circle_image_widget.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/font_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';
import 'package:story_app1/features/authentication/presentation/pages/home/widgets/post_page_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Dummy data untuk gambar, teks, waktu, dan username
  final List<Map<String, String>> _dummyData = const [
    {
      "image": "https://picsum.photos/200/300?random=1",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "username": "user_1",
      "time": "2 minutes ago",
    },
    {
      "image": "https://picsum.photos/200/300?random=2",
      "text":
          "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "username": "user_2",
      "time": "5 minutes ago",
    },
    {
      "image": "https://picsum.photos/200/300?random=3",
      "text":
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.",
      "username": "user_3",
      "time": "10 minutes ago",
    },
    {
      "image": "https://picsum.photos/200/300?random=4",
      "text": "Duis aute irure dolor in reprehenderit in voluptate velit esse.",
      "username": "user_4",
      "time": "15 minutes ago",
    },
    {
      "image": "https://picsum.photos/200/300?random=5",
      "text": "Excepteur sint occaecat cupidatat non proident, sunt in culpa.",
      "username": "user_5",
      "time": "20 minutes ago",
    },
    {
      "image": "https://picsum.photos/200/300?random=6",
      "text": "Quis autem vel eum iure reprehenderit qui in ea voluptate.",
      "username": "user_6",
      "time": "30 minutes ago",
    },
    {
      "image": "https://picsum.photos/200/300?random=7",
      "text": "At vero eos et accusamus et iusto odio dignissimos ducimus.",
      "username": "user_7",
      "time": "40 minutes ago",
    },
    {
      "image": "https://picsum.photos/200/300?random=8",
      "text": "Nam libero tempore, cum soluta nobis est eligendi optio.",
      "username": "user_8",
      "time": "50 minutes ago",
    },
    {
      "image": "https://picsum.photos/200/300?random=9",
      "text": "Et harum quidem rerum facilis est et expedita distinctio.",
      "username": "user_9",
      "time": "1 hour ago",
    },
    {
      "image": "https://picsum.photos/200/300?random=10",
      "text": "Temporibus autem quibusdam et aut officiis debitis aut rerum.",
      "username": "user_10",
      "time": "2 hours ago",
    },
  ];

  @override
  Widget build(BuildContext context) {
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
              spacing: 10,
              children: [
                CircleImageWidget(url: "https://picsum.photos/200/200"),
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

          // Postingan Utama (Menggunakan ListView.builder)
          ListView.builder(
            shrinkWrap:
                true, // Agar ListView.builder tidak mengambil seluruh layar
            physics:
                NeverScrollableScrollPhysics(), // Nonaktifkan scroll di dalam ListView.builder
            itemCount: _dummyData.length,
            itemBuilder: (context, index) {
              final item = _dummyData[index];
              return PostWidget(
                imageUrl: item["image"]!,
                caption: item["text"]!,
                username: item["username"]!,
                time: item["time"]!,
              );
            },
          ),
        ],
      ),
    );
  }
}
