import 'package:bliqtest/_lib.dart';
import 'package:bliqtest/ui/widget/timeline_widget.dart';
import 'package:bliqtest/view_models/post_viewmodel.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 20))
        .then((val) => ref.read(postControllerProvider).fetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    final post = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blinq'),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        actions: [],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            RefreshIndicator(
                onRefresh: () =>
                    ref.read(postControllerProvider).fetchPostsNoLoader(),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    TimeLineWidget(),
                  ],
                ))),
            if (post.isLoading)
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
