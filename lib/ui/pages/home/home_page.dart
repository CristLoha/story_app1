import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/providers/home/stories_list_provider.dart';
import 'package:story_app1/ui/pages/home/widgets/side_menu_widget.dart';
import 'package:story_app1/ui/widgets/button_widget.dart';
import 'package:story_app1/ui/widgets/loading_animation_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';
import 'package:story_app1/ui/pages/home/widgets/post_user_widget.dart';
import 'package:story_app1/ui/widgets/circle_image_widget.dart';
import 'package:story_app1/services/sesion_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SessionManager _sessionManager = SessionManager();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final apiListProvider = context.read<StoriesListProvider>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (!apiListProvider.isFetching) {
          apiListProvider.fetchMoreStories();
        }
      }
    });

    Future.microtask(() async {
      final token = await _sessionManager.getToken();
      if (token != null && apiListProvider.stories.isEmpty) {
        apiListProvider.setToken(token);
        await apiListProvider.fetchStories();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshStories() async {
    final storyProvider = context.read<StoriesListProvider>();
    await storyProvider.refreshStories();
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
      drawer: SideMenuWidget(sesionManager: _sessionManager),
      body: Consumer<StoriesListProvider>(
        builder: (context, provider, child) {
          final state = provider.resultState;

          return state.map(
            loading: (value) {
              return LoadingAnimationWidget();
            },
            error: (value) {
              final message = value.message;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/no_internet_animation.json',
                    width: 180,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    message,
                    style: getGrey900TextStyle().copyWith(
                      color: ColorsManager.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: ButtonWidget(
                      onPressed: () async {
                        await provider.fetchStories();
                      },
                      title: 'Retry',
                    ),
                  ),
                ],
              );
            },
            loaded: (value) {
              final stories = value.data;
              return RefreshIndicator(
                onRefresh: _refreshStories,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p24,
                        right: AppPadding.p24,
                        top: AppPadding.p20,
                      ),
                      child: Row(
                        children: [
                          CircleImageWidget(
                            url: "https://picsum.photos/200/200",
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final result = await context.push<bool>(
                                  '/home/post',
                                );
                                if (result == true) {
                                  _refreshStories();
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
                      itemCount:
                          stories.length + (provider.hasMoreData ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == stories.length && provider.hasMoreData) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
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
                ),
              );
            },
            initial: (value) {
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
