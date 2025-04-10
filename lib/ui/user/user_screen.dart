import 'package:bliqtest/_lib.dart';
import 'package:bliqtest/ui/widget/user_container.dart';
import 'package:bliqtest/view_models/app_themeprovider.dart';
import 'package:bliqtest/view_models/user_viewmodel.dart';
import 'package:bliqtest/widgets/app_bar.dart';
import 'package:bliqtest/widgets/text_widget.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 20))
        .then((val) => ref.read(userControllerProvider).fetchUser());
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(userControllerProvider);
    final appTheme = ref.watch(appThemeProvider);

    final users = vm.listOfUsers;
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Blinq Users',
      ),
      backgroundColor: appTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: vm.listOfUsers.isEmpty
            ? Center(
                child: Column(
                  children: [
                    const GetSvgImage(image: 'assets/svg/Empty State.svg'),
                    const SizedBox(
                      height: 6,
                    ),
                    NormalText(
                      'No User Yet',
                      size: 18,
                      color:
                          appTheme.isDark ? AppColors.white : AppColors.black,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NormalText(
                      "Connect with more users...",
                      size: 12,
                      color:
                          appTheme.isDark ? AppColors.white : AppColors.black,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            : Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: RefreshIndicator(
                            onRefresh: () => ref
                                .read(userControllerProvider)
                                .fetchUserNoLoading(),
                            child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                padding: const EdgeInsets.all(10),
                                physics: const AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 210),
                                itemCount: vm.listOfUsers.length,
                                itemBuilder: (ctx, i) {
                                  final user = users[i];
                                  return UserContainer(
                                      appTheme: appTheme, user: user);
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (vm.isLoading)
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
