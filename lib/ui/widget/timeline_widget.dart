// ignore_for_file: must_be_immutable, unnecessary_null_comparison, avoid_print, duplicate_ignore, use_full_hex_values_for_flutter_colors, deprecated_member_use

import 'package:bliqtest/_lib.dart';
import 'package:bliqtest/ui/widget/timeLine_container.dart';
import 'package:bliqtest/view_models/app_themeprovider.dart';
import 'package:bliqtest/view_models/post_viewmodel.dart';
import 'package:bliqtest/widgets/text_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TimeLineWidget extends ConsumerWidget {
  TimeLineWidget({super.key, this.savedFile = true, this.itemCount});
  bool savedFile;
  int? itemCount;
  @override
  Widget build(BuildContext context, ref) {
    final vm = ref.watch(postControllerProvider);
    final appTheme = ref.watch(appThemeProvider);

    final posts = vm.posts;
    // final posts = postList..sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return posts.isEmpty
        ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const GetSvgImage(image: 'asset/svgs/Empty State.svg'),
                const SizedBox(
                  height: 6,
                ),
                NormalText(
                  'No Post on your Feed?',
                  color: appTheme.isDark ? AppColors.white : AppColors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                NormalText(
                  "Connect with other users to get more feeds",
                  color: appTheme.isDark ? AppColors.white : AppColors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        : AnimationLimiter(
            child: Column(
              children: List.generate(posts.length, (index) {
                final post = posts[index];

                if (post.noMedia == true &&
                    post.isImage == false &&
                    post.isVideo == false) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: TextFeedContainer(post: post, appTheme: appTheme),
                  );
                }
                if (post.noMedia == false &&
                    (post.isImage == true || post.isImage == null) &&
                    post.isVideo == false) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: ImageFeedContainer(post: post, appTheme: appTheme),
                  );
                }

                if (post.noMedia == false &&
                    post.isImage == false &&
                    post.isVideo == true) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: VideoFeedContainer(post: post, appTheme: appTheme),
                  );
                }
                return const SizedBox.shrink();
              }),
            ),
          );
  }
}
