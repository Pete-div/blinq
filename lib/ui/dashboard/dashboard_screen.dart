// ignore_for_file: file_names, deprecated_member_use

import 'package:bliqtest/_lib.dart';
import 'package:bliqtest/ui/feed/feed_screen.dart';



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
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            getBody(dashBoardProvider),
          ],
        ),
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
    // final groupVm =ref.watch(groupViewModel);
    // final unReadMsg=groupVm.getTotalUnreadMessages();
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "Feed",
          icon:  GetSvgImage(
           image: 'asset/svgs/in-active-home.svg',
                      color:Colors.grey[600] ,
                     

          ),
          activeIcon:  GetSvgImage(
           image: 'asset/svgs/home.svg',
                      color:Colors.grey[100] ,

          ),
          backgroundColor: AppColors.blue,
        ),
        BottomNavigationBarItem(
          label: "Users",
          activeIcon:  GetSvgImage(
           image: 'asset/svgs/in-active-user.svg',
                      color:Colors.grey[100] ,

          ),
          icon:  GetSvgImage(
           image: 'asset/svgs/im_active-user.svg',
                      color:Colors.grey[600] ,

          ),
          backgroundColor: AppColors.white,
        ),
    
      ],
      currentIndex: dashBoardVm.currentindex,
      selectedItemColor: AppColors.white,
      selectedFontSize: 12.0,
      backgroundColor: AppColors.primaryColor,
      unselectedItemColor: const Color(0xff818181),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: dashBoardVm.changeTabIndex,
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


