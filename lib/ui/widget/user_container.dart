import 'package:bliqtest/_lib.dart';
import 'package:bliqtest/ui/widget/cached_image.dart';
import 'package:bliqtest/utils/app_theme/app_theme.dart';
import 'package:bliqtest/widgets/app_container_widget.dart';
import 'package:bliqtest/widgets/text_widget.dart';

class UserContainer extends StatelessWidget {
  const UserContainer({
    super.key,
    required this.appTheme,
    required this.user,
  });

  final BaseTheme appTheme;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: ContainerWidget(
          height: 215,
          width: 215,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: appTheme.isDark ? AppColors.darkGrey02 : AppColors.white,
          ),
          child: Stack(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:
                      appTheme.isDark ? AppColors.darkGrey : const Color(0xffCFCFCF),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                              child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: appTheme.isDark
                                    ? AppColors.white
                                    : AppColors.primaryColor),
                            child: Center(
                                child: user.photo == ''
                                    ? Text(
                                        user.name.length < 2
                                            ? user.name.substring(0, 1).toUpperCase()
                                            : user.name.substring(0, 2).toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    : CachedImage(
                                        url: user.photo,
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      )),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NormalText(
                              user.name,
                              color: appTheme.isDark
                                  ? AppColors.white
                                  : AppColors.black,
                              weight: FontWeight.w500,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: SizedBox(
                            height: 40,
                            child: user.bio != ''
                                ? NormalText(
                                    user.bio,
                                    color: appTheme.isDark
                                        ? AppColors.white
                                        : AppColors.lightGrey,
                                    textAlign: TextAlign.center,
                                    weight: FontWeight.w400,
                                    size: 10,
                                  )
                                : const SizedBox.shrink()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 5.0,
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        backgroundColor: appTheme.isDark
                                            ? AppColors.lightBle
                                            : AppColors.lightGrey,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: AppColors.primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(100))),
                                    child: NormalText(
                                      "Connect",
                                      color: AppColors.primaryColor,
                                      weight: FontWeight.w400,
                                      size: 13,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          side: BorderSide(
                                              color: AppColors.primaryColor),
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100))),
                                      child: NormalText(
                                        "View Profile",
                                        color: appTheme.isDark
                                            ? AppColors.white
                                            : AppColors.primaryColorText,
                                        weight: FontWeight.w400,
                                        size: 9,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
