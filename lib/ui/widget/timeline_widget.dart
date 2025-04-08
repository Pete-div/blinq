// ignore_for_file: must_be_immutable, unnecessary_null_comparison, avoid_print, duplicate_ignore, use_full_hex_values_for_flutter_colors, deprecated_member_use

import 'package:bliqtest/_lib.dart';
import 'package:bliqtest/ui/widget/caached_video.dart';
import 'package:bliqtest/ui/widget/cached_image.dart';
import 'package:bliqtest/view_models/post_viewmodel.dart';
import 'package:bliqtest/widgets/app_container_widget.dart';
import 'package:bliqtest/widgets/text_widget.dart';

class TimeLineWidget extends ConsumerWidget {
  TimeLineWidget({super.key, this.savedFile = true, this.itemCount});
  bool savedFile;
  int? itemCount;
  @override
  Widget build(BuildContext context, ref) {
    final vm = ref.watch(postControllerProvider);
    final posts = vm.posts;
    //   final posts = postList..sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return posts.isEmpty
        ? const Center(
            child: Column(
              children: [
                GetSvgImage(image: 'asset/svgs/Empty State.svg'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'No Post on your Feed?',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Connect with other users to get more feeds",
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        : Column(
            children: List.generate(posts.length, (index) {
              final post = posts[index];

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

              if (post.noMedia == true &&
                  post.isImage == false &&
                  post.isVideo == false) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ContainerWidget(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              color: AppColors.black,
                            ),
                            child: const GetSvgImage(
                                image:
                                    'asset/svgs/users-avatar-svgrepo-com.svg'),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        NormalText(post.username),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        NormalText(
                                          formatTimeToHour(post.timestamp),
                                          size: 8,
                                          weight: FontWeight.w300,
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                    width: 300,
                                    child: NormalText(capitalizeFirstLetter(post.description))),
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
                );
              }
              if (post.noMedia == false &&
                  (post.isImage == true || post.isImage == null) &&
                  post.isVideo == false) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ContainerWidget(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              color: AppColors.black,
                            ),
                             child: const GetSvgImage(
                                image:
                                    'asset/svgs/users-avatar-svgrepo-co.svg'),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 300, child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        NormalText(post.username),
                                                const SizedBox(
                                          height: 2,
                                        ),
                                        NormalText(
                                          formatTimeToHour(post.timestamp),
                                          size: 8,
                                          weight: FontWeight.w300,
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                    width: 300, child: Text(capitalizeFirstLetter(post.description))),
                                const SizedBox(
                                  height: 8,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
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
                );
              }
             
              if (post.noMedia == false &&
                  post.isImage == false &&
                  post.isVideo == true) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ContainerWidget(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              color: AppColors.black,
                            ),
                             child: const GetSvgImage(
                                image:
                                    'asset/svgs/in-active-user.svg'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               SizedBox(
                                    width: 300, child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        NormalText(post.username),
                                                const SizedBox(
                                          height: 2,
                                        ),
                                        NormalText(
                                          formatTimeToHour(post.timestamp),
                                          size: 8,
                                          weight: FontWeight.w300,
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 6,
                                ),
                              SizedBox(width: 300, child: Text(capitalizeFirstLetter(post.description))),
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
                );
              }
              return const SizedBox.shrink();
            }),
          );
  }
}
