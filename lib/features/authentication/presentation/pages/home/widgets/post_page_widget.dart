import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/common/widgets/circle_image_widget.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/font_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';
import 'package:story_app1/features/authentication/presentation/pages/home/widgets/icon_react_widget.dart';
import 'package:story_app1/features/authentication/presentation/pages/post/widgets/title_name_widget.dart';
import 'package:story_app1/providers/home_provider.dart';

class PostWidget extends StatelessWidget {
  final String urlImageUser;
  final String urlImagePost;
  final String caption;
  final String userName;
  final String time;
  final bool isFirstPost; // Menandai apakah ini postingan pertama
  final bool isLastPost; // Menandai apakah ini postingan terakhir

  const PostWidget({
    super.key,
    required this.urlImageUser,
    required this.urlImagePost,
    required this.userName,
    required this.caption,
    required this.time,
    this.isFirstPost = false,
    this.isLastPost = false,
  });

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    final List<Reaction<String>> reactions = [
      Reaction<String>(
        value: 'like',
        icon: IconReactWidget(name: "assets/icon/like.png"),
      ),
      Reaction<String>(
        value: 'love',
        icon: IconReactWidget(name: "assets/icon/love.png"),
      ),
      Reaction<String>(
        value: 'care',
        icon: IconReactWidget(name: "assets/icon/care.png"),
      ),
      Reaction<String>(
        value: 'haha',
        icon: IconReactWidget(name: "assets/icon/haha.png"),
      ),
      Reaction<String>(
        value: 'wow',
        icon: IconReactWidget(name: "assets/icon/wow.png"),
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top:
              isFirstPost
                  ? BorderSide.none
                  : BorderSide(color: ColorsManager.grey300, width: 2.0),
          bottom:
              isLastPost
                  ? BorderSide.none
                  : BorderSide(color: ColorsManager.grey300, width: 2.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Postingan dengan Caption
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: AppMargin.m10,
                  children: [
                    CircleImageWidget(url: urlImageUser, radius: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleNameWidget(userName: userName),
                        Text(time, style: getGrey600TextStyle()),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: AppMargin.m10),
                GestureDetector(
                  onTap: () {
                    homeProvider.toggleExpanded(); // Toggle ekspansi teks
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          caption,
                          style: getGrey900TextStyle(
                            fontSize: FontSizeManager.f16,
                            fontWeight: FontWeightManager.regular,
                          ),
                          maxLines: homeProvider.isExpanded ? null : 1,
                          overflow:
                              homeProvider.isExpanded
                                  ? null
                                  : TextOverflow.ellipsis,
                        ),
                      ),
                      if (!homeProvider.isExpanded)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              homeProvider.toggleExpanded(); // Expand teks
                            },
                            child: Text(
                              "See More",
                              style: TextStyle(
                                color: ColorsManager.grey500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Gambar Postingan
          Container(
            height: 340,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(urlImagePost),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),

          // Reaksi
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p10,
            ),
            child: ReactionButton<String>(
              key: ValueKey(homeProvider.selectedReaction?.value),
              onReactionChanged: (Reaction<String>? reaction) {
                homeProvider.updateSelectedReaction(reaction); // Update reaksi
              },
              reactions: reactions,
              placeholder: Reaction<String>(
                value: null,
                icon: Row(
                  children: [
                    Image.asset(
                      homeProvider.selectedReaction?.value != null
                          ? 'assets/icon/${homeProvider.selectedReaction!.value}.png'
                          : 'assets/icon/like_default.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        homeProvider.selectedReaction?.value != null
                            ? homeProvider.selectedReaction!.value![0]
                                    .toUpperCase() +
                                homeProvider.selectedReaction!.value!
                                    .substring(1)
                                    .toLowerCase()
                            : "Like",
                        key: ValueKey(homeProvider.selectedReaction?.value),
                        style: _getTextStyleByReaction(
                          homeProvider.selectedReaction,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              selectedReaction:
                  homeProvider.selectedReaction ?? reactions.first,
              itemSize: const Size(40, 40),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _getTextStyleByReaction(Reaction<String>? reaction) {
    if (reaction == null) return getGrey900TextStyle();

    Map<String, Color> reactionColors = {
      "like": ColorsManager.like,
      "love": ColorsManager.love,
      "care": ColorsManager.care,
      "haha": ColorsManager.haha,
      "wow": ColorsManager.wow,
    };

    return getGrey900TextStyle().copyWith(
      color: reactionColors[reaction.value] ?? ColorsManager.grey900,
      fontWeight: FontWeight.bold,
    );
  }
}
