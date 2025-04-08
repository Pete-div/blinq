import 'package:bliqtest/_lib.dart';
import 'package:bliqtest/ui/widget/cached_image.dart';
import 'package:bliqtest/view_models/user_viewmodel.dart';
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
    final users = vm.listOfUsers;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blinq Users'),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: RefreshIndicator(
                  onRefresh: () =>
                      ref.read(userControllerProvider).fetchUserNoLoading(),
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
                              mainAxisExtent: 215),
                      itemCount: vm.listOfUsers.length,
                      itemBuilder: (ctx, i) {
                        final user = users[i];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GridTile(
                            child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 7),
                                  height: 215,
                                  width: 215,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffCFCFCF),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/svg/Frame 1618868935.png'),
                                            fit: BoxFit.cover,
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ClipOval(
                                                      child: Container(
                                                    height: 60,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .primaryColor),
                                                    child: Center(
                                                        child: user.photo == ''
                                                            ? Text(
                                                                user.name.length <
                                                                        2
                                                                    ? "${user.name.substring(0, 1).toUpperCase()}"
                                                                    : "${user.name.substring(0, 2).toUpperCase()}",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              )
                                                            : CachedImage(
                                                                url: user.photo,
                                                                height: 60,
                                                                width: 60,
                                                                fit: BoxFit
                                                                    .cover,
                                                              )),
                                                  )),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 14,
                                              ),
                                              Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    NormalText(
                                                      '${user.name}',
                                                      color: AppColors.black,
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
                                                            color: AppColors
                                                                .lightGrey,
                                                            textAlign: TextAlign
                                                                .center,
                                                            weight:
                                                                FontWeight.w400,
                                                          
                                                            size: 12,
                                                          )
                                                        : const SizedBox
                                                            .shrink()),
                                              ),
                                              SizedBox(
                                                height: 25,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          right: 5.0,
                                                        ),
                                                        child: TextButton(
                                                          onPressed: () {},
                                                          style: TextButton.styleFrom(
                                                              backgroundColor:
                                                                  AppColors
                                                                      .lightBle,
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shape: RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      width: 1,
                                                                      color: AppColors
                                                                          .primaryColor),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100))),
                                                          child: NormalText(
                                                            'Find',
                                                            color: AppColors
                                                                .primaryColor,
                                                            weight:
                                                                FontWeight.w400,
                                                            size: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5.0),
                                                        child: TextButton(
                                                            onPressed: () {},
                                                            style: TextButton.styleFrom(
                                                                side: BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor),
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100))),
                                                            child: NormalText(
                                                              "Follow",
                                                              color: AppColors
                                                                  .primaryColorText,
                                                              weight: FontWeight
                                                                  .w400,
                                                              size: 12,
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      }),
                ),
              ),
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
