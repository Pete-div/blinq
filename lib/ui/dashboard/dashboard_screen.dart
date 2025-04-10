// ignore_for_file: file_names, deprecated_member_use

import 'package:bliqtest/_lib.dart';
import 'package:bliqtest/ui/feed/feed_screen.dart';
import 'package:bliqtest/view_models/app_themeprovider.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final dashBoardProvider = ref.watch(dashBoardModel);

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (!didPop) {}
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.white,
        body: getBody(dashBoardProvider),
        bottomNavigationBar: const BottomNavbar(),
      ),
    );
  }
}

class BottomNavbar extends ConsumerWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final dashBoardVm = ref.watch(dashBoardModel);
    final appTheme = ref.watch(appThemeProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60,vertical: 0),
    
      child: CrystalNavigationBar(
        items: <CrystalNavigationBarItem>[
          CrystalNavigationBarItem(
            icon: Icons.sensor_occupied_outlined,
            selectedColor: appTheme.isDark
                ? AppColors.white
                : AppColors.darkGrey,
            unselectedIcon: Icons.sensor_occupied_sharp,
          ),
          CrystalNavigationBarItem(
            icon: Icons.person_4_outlined,
            selectedColor: appTheme.isDark
                ? AppColors.white
                : AppColors.darkGrey,
            unselectedIcon: Icons.person_3_rounded,
          ),
        ],
        currentIndex: dashBoardVm.currentindex,
        selectedItemColor:
            appTheme.isDark ? AppColors.white : AppColors.black,
        indicatorColor:
            appTheme.isDark ? AppColors.white : AppColors.black,
        enablePaddingAnimation: true,
        enableFloatingNavBar: true,
        backgroundColor: Colors.transparent, // now handled by container
        unselectedItemColor:
            appTheme.isDark ? AppColors.lightGrey : AppColors.darkGrey,
        onTap: dashBoardVm.changeTabIndex,
      ),
    );
  }
}


Widget getBody(DashboardViewModel _) {
  List<Widget> pages = const [
    FeedScreen(),
    UserScreen(),
  ];
  return IndexedStack(
    index: _.currentindex,
    children: pages,
  );
}
