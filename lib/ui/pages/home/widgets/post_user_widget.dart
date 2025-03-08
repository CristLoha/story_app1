import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/providers/home/post_interaction_provider.dart';
import 'package:story_app1/ui/pages/home/widgets/show_image_widget.dart';
import 'package:story_app1/ui/widgets/circle_image_widget.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';
import 'package:story_app1/ui/pages/home/widgets/icon_react_widget.dart';
import 'package:story_app1/ui/pages/createpost/widgets/title_name_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostUserWidget extends StatelessWidget {
  final String postId;

  final String urlImageUser;
  final String urlImagePost;
  final String caption;
  final String userName;
  final DateTime time;
  final bool isFirstPost;
  final bool isLastPost;

  const PostUserWidget({
    super.key,
    required this.postId,
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
    final provider = Provider.of<PostInteractionProvider>(context);
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleImageWidget(url: urlImageUser, radius: 24),
                    SizedBox(width: AppMargin.m10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleNameWidget(userName: userName),
                        Text(
                          timeago.format(time, locale: 'en'),
                          style: getGrey600TextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: AppMargin.m10),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final textSpan = TextSpan(
                      text: caption,
                      style: getGrey900TextStyle(
                        fontSize: FontSizeManager.f18,
                        fontWeight: FontWeightManager.regular,
                      ),
                    );
                    final textPainter = TextPainter(
                      text: textSpan,
                      maxLines: 1,
                      textDirection: TextDirection.ltr,
                    )..layout(maxWidth: constraints.maxWidth);

                    final isLongText =
                        caption.length > 30 || textPainter.didExceedMaxLines;

                    return GestureDetector(
                      onTap: () => provider.toggleExpanded(postId),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              caption,
                              style: getGrey900TextStyle(
                                fontSize: FontSizeManager.f18,
                                fontWeight: FontWeightManager.regular,
                              ),
                              maxLines: provider.isExpanded(postId) ? null : 1,
                              overflow:
                                  provider.isExpanded(postId)
                                      ? null
                                      : TextOverflow.ellipsis,
                            ),
                          ),
                          if (isLongText && !provider.isExpanded(postId))
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: GestureDetector(
                                onTap: () => provider.toggleExpanded(postId),
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
                    );
                  },
                ),
              ],
            ),
          ),
          ShowImageWidget(imageUrl: urlImagePost),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p10,
            ),
            child: ReactionButton<String>(
              key: ValueKey(provider.getSelectedReaction(postId)?.value),
              onReactionChanged: (Reaction<String>? reaction) {
                provider.updateSelectedReaction(postId, reaction);
              },
              reactions: reactions,
              placeholder: Reaction<String>(
                value: null,
                icon: Row(
                  children: [
                    Image.asset(
                      provider.getSelectedReaction(postId)?.value != null
                          ? 'assets/icon/${provider.getSelectedReaction(postId)!.value}.png'
                          : 'assets/icon/like_default.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        provider.getSelectedReaction(postId)?.value != null
                            ? provider
                                    .getSelectedReaction(postId)!
                                    .value![0]
                                    .toUpperCase() +
                                provider
                                    .getSelectedReaction(postId)!
                                    .value!
                                    .substring(1)
                                    .toLowerCase()
                            : "Like",
                        key: ValueKey(
                          provider.getSelectedReaction(postId)?.value,
                        ),
                        style: _getTextStyleByReaction(
                          provider.getSelectedReaction(postId),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              selectedReaction:
                  provider.getSelectedReaction(postId) ?? reactions.first,
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
