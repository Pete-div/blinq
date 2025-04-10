// ignore_for_file: file_names, deprecated_member_use

import 'package:bliqtest/_lib.dart';
import 'package:bliqtest/ui/widget/caached_video.dart';
import 'package:bliqtest/ui/widget/cached_image.dart';
import 'package:bliqtest/utils/app_theme/app_theme.dart';
import 'package:bliqtest/widgets/app_container_widget.dart';
import 'package:bliqtest/widgets/text_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TextFeedContainer extends StatelessWidget {
  const TextFeedContainer({
    super.key,
    required this.post,
    required this.appTheme,
  });

  final PostModel post;
  final BaseTheme appTheme;
    String capitalizeFirstLetter(String text) {
                  if (text.isEmpty) {
                    return text;
                  }
                  return text[0].toUpperCase() + text.substring(1);
                }
                     String formatTimeToHour(int timestamp) {
                  DateTime postDate =
                      DateTime.fromMillisecondsSinceEpoch(timestamp);
                  DateTime currentDate = DateTime.now();
                  Duration difference = currentDate.difference(postDate);

                  if (difference.inMinutes < 60) {
                    return '${difference.inMinutes} minutes ago';
                  } else if (difference.inHours < 24) {
                    return '${difference.inHours} hours ago';
                  } else {
                    int days = difference.inDays;
                    return '$days days ago';
                  }
                }
  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      verticalOffset: 50.0,
      child: FadeInAnimation(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContainerWidget(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16),
              borderRadius: BorderRadius.circular(8),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    margin: const EdgeInsets.only(right: 6),
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: const GetSvgImage(
                        image:
                            'asset/svgs/users-avatar-svgrepo-com.svg'),
                  ),
                  Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      mainAxisAlignment:
                          MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 300,
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              children: [
                                NormalText(
                                  post.username,
                                  color: appTheme.isDark
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                NormalText(
                                  formatTimeToHour(
                                      post.timestamp),
                                  size: 8,
                                  weight: FontWeight.w300,
                                  color: appTheme.isDark
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          width: 300,
                          child: NormalText(
                            capitalizeFirstLetter(
                              post.description,
                            ),
                            color: appTheme.isDark
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 1,
              width: double.infinity,
              color: AppColors.lightGrey.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageFeedContainer extends StatelessWidget {
  const ImageFeedContainer({
    super.key,
    required this.post,
    required this.appTheme,
  });

  final PostModel post;
  final BaseTheme appTheme;
    String capitalizeFirstLetter(String text) {
                  if (text.isEmpty) {
                    return text;
                  }
                  return text[0].toUpperCase() + text.substring(1);
                }
                     String formatTimeToHour(int timestamp) {
                  DateTime postDate =
                      DateTime.fromMillisecondsSinceEpoch(timestamp);
                  DateTime currentDate = DateTime.now();
                  Duration difference = currentDate.difference(postDate);

                  if (difference.inMinutes < 60) {
                    return '${difference.inMinutes} minutes ago';
                  } else if (difference.inHours < 24) {
                    return '${difference.inHours} hours ago';
                  } else {
                    int days = difference.inDays;
                    return '$days days ago';
                  }
                }
  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      duration: const Duration(milliseconds: 375),
      verticalOffset: 50.0,
      child: FadeInAnimation(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContainerWidget(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    margin: const EdgeInsets.only(right: 6),
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: const GetSvgImage(
                        image:
                            'asset/svgs/users-avatar-svgrepo-co.svg'),
                  ),
                  Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      mainAxisAlignment:
                          MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 300,
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              children: [
                                NormalText(
                                  post.username,
                                  color: appTheme.isDark
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                NormalText(
                                  formatTimeToHour(
                                      post.timestamp),
                                  size: 8,
                                  color: appTheme.isDark
                                      ? AppColors.white
                                      : AppColors.black,
                                  weight: FontWeight.w300,
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                            width: 300,
                            child: NormalText(
                              capitalizeFirstLetter(
                                  post.description),
                              color: appTheme.isDark
                                  ? AppColors.white
                                  : AppColors.black,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(12),
                          child: CachedImage(
                              url: post.thumbnail ?? '',
                              height: 300,
                              width: 300,
                              fit: BoxFit.cover),
                        ),
                      ]),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 1,
              width: double.infinity,
              color: AppColors.lightGrey.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoFeedContainer extends StatelessWidget {
  const VideoFeedContainer({
    super.key,
    required this.post,
    required this.appTheme,
  });

  final PostModel post;
  final BaseTheme appTheme;
     String capitalizeFirstLetter(String text) {
                  if (text.isEmpty) {
                    return text;
                  }
                  return text[0].toUpperCase() + text.substring(1);
                }
                     String formatTimeToHour(int timestamp) {
                  DateTime postDate =
                      DateTime.fromMillisecondsSinceEpoch(timestamp);
                  DateTime currentDate = DateTime.now();
                  Duration difference = currentDate.difference(postDate);

                  if (difference.inMinutes < 60) {
                    return '${difference.inMinutes} minutes ago';
                  } else if (difference.inHours < 24) {
                    return '${difference.inHours} hours ago';
                  } else {
                    int days = difference.inDays;
                    return '$days days ago';
                  }
                }
  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      duration: const Duration(milliseconds: 375),
      verticalOffset: 50.0,
      child: FadeInAnimation(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContainerWidget(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    margin: const EdgeInsets.only(right: 6),
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: const GetSvgImage(
                        image: 'asset/svgs/in-active-user.svg'),
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            mainAxisAlignment:
                                MainAxisAlignment.start,
                            children: [
                              NormalText(
                                post.username,
                                color: appTheme.isDark
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              NormalText(
                                formatTimeToHour(
                                    post.timestamp),
                                size: 8,
                                color: appTheme.isDark
                                    ? AppColors.white
                                    : AppColors.black,
                                weight: FontWeight.w300,
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                          width: 300,
                          child: NormalText(
                            capitalizeFirstLetter(
                                post.description),
                            color: appTheme.isDark
                                ? AppColors.white
                                : AppColors.black,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: AutoPlayVideoWidget(
                            firebaseVideoUrl: post.link ?? ''),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 1,
              width: double.infinity,
              color: AppColors.lightGrey.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
