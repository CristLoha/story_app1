import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/providers/home/stories_list_provider.dart';
import 'package:story_app1/static/stories_result_state.dart';
import 'package:story_app1/ui/pages/home/widgets/side_menu_widget.dart';
import 'package:story_app1/ui/widgets/button_widget.dart';
import 'package:story_app1/ui/widgets/circle_image_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';
import 'package:story_app1/ui/pages/home/widgets/post_user_widget.dart';
import 'package:story_app1/services/sesion_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SessionManager _sesionManager = SessionManager();
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (mounted) {
        final token = await _sesionManager.getToken();
        if (mounted) {
          await context.read<StoriesListProvider>().fetchStories(token!);
        }
      }
    });
  }

  void _resfreshStories() async {
    final token = await _sesionManager.getToken();
    if (token != null) {
      if (mounted) {
        final storyProvider = context.read<StoriesListProvider>();
        await storyProvider.fetchStories(token);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Snap Story',
          style: getWhiteTextStyle().copyWith(fontSize: AppSize.s30),
        ),
      ),
      drawer: SideMenuWidget(sesionManager: _sesionManager),
      body: Consumer<StoriesListProvider>(
        builder: (context, provider, child) {
          if (provider.resultState is StoriesLoadingState) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/loading_animation.json',
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            );
          } else if (provider.resultState is StoriesErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Lottie.asset(
                      'assets/lottie/no_internet_animation.json',
                      width: 180,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      (provider.resultState as StoriesErrorState).message,
                      style: getGrey900TextStyle().copyWith(
                        color: ColorsManager.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: ButtonWidget(
                    onPressed: () async {
                      final token = await _sesionManager.getToken();
                      if (token != null) {
                        await provider.fetchStories(token);
                      }
                    },
                    title: 'Retry',
                  ),
                ),
              ],
            );
          } else if (provider.resultState is StoriesLoadedState) {
            final stories = (provider.resultState as StoriesLoadedState).data;
            return ListView(
              padding: EdgeInsets.only(top: AppPadding.p16),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p24,
                    right: AppPadding.p24,
                    top: AppPadding.p20,
                  ),
                  child: Row(
                    children: [
                      CircleImageWidget(url: "https://picsum.photos/200/200"),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final result = await context.push<bool>(
                              '/home/post',
                            );

                            if (result == true) {
                              _resfreshStories();
                            }
                          },
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
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    final post = stories[index];

                    return PostUserWidget(
                      urlImageUser:
                          "https://picsum.photos/200/200?random=$index",
                      urlImagePost: post.photoUrl,
                      userName: post.name,
                      caption: post.description,
                      time: post.createdAt,
                      postId: index.toString(),
                      onTap: () {
                        context.push('/home/detail', extra: post);
                      },
                    );
                  },
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
