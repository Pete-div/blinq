
import 'package:bliqtest/_lib.dart';

final postControllerProvider = ChangeNotifierProvider<PostController>((ref) {
  return PostController(ref);
});

class PostController extends ChangeNotifier {
  final Ref ref;

  List<PostModel> _posts = [];
  bool _isLoading = false;

  List<PostModel> get posts => _posts;
  bool get isLoading => _isLoading;

  PostController(this.ref);

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();
    try {
      final result = await ref.read(firestoreServiceProvider).getPosts();
      _posts = result;
    } catch (e) {
      debugPrint('Error fetching posts: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  Future<void> fetchPostsNoLoader() async {
    try {
      final result = await ref.read(firestoreServiceProvider).getPosts();
      _posts = result;
    } catch (e) {
      debugPrint('Error fetching posts: $e');
    } finally {
      notifyListeners();
    }
  }
}