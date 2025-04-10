// ignore_for_file: must_be_immutable

import 'package:bliqtest/_lib.dart';
import 'package:bliqtest/view_models/app_themeprovider.dart';
import 'package:bliqtest/widgets/text_widget.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.text,
    this.noAction = false,
  });

  final String text;
  bool? noAction;

  @override
  Widget build(BuildContext context, ref) {
    final appTheme = ref.watch(appThemeProvider);

    return AppBar(
      title: Text(text),
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      actions: [
        PopupMenuButton<int>(
          color: appTheme.isDark ? AppColors.darkGrey02 : AppColors.white,
          surfaceTintColor: Colors.white,
          icon: GetSvgImage(
            image: 'asset/svgs/idea-svgrepo-com.svg',
            boxFit: BoxFit.scaleDown,
            color: appTheme.isDark ? AppColors.white : AppColors.black,
            height: 20,
            width: 20,
          ),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              onTap: () {
                ref
                    .read(appThemeModeProvider.notifier)
                    .update(ThemeMode.system);
              },
              child: NormalText(
                'System Theme',
                size: 12,
                weight: FontWeight.w600,
                color: appTheme.isDark ? AppColors.white : AppColors.black,
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              onTap: () {
                ref.read(appThemeModeProvider.notifier).update(ThemeMode.light);
              },
              child: NormalText(
                'Light mode',
                size: 12,
                weight: FontWeight.w600,
                color: appTheme.isDark ? AppColors.white : AppColors.black,
              ),
            ),
            PopupMenuItem<int>(
              onTap: () {
                ref.read(appThemeModeProvider.notifier).update(ThemeMode.dark);
              },
              value: 2,
              child: NormalText(
                'Dark mode',
                color: appTheme.isDark ? AppColors.white : AppColors.black,
                size: 12,
                weight: FontWeight.w600,
              ),
            ),
          ],
          onSelected: (val) {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}
