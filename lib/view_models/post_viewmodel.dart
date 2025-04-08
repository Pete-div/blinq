
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
      print(posts);
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
            print("the post 1 ${_posts[0]}");
             print("the post 2 ${_posts[1]}");
              print("the post 3 ${_posts[2]}");
               print("the post 4 ${_posts[3]}");
                print("the post 5 ${_posts[4]}");
                 print("the post 6 ${_posts[5]}");
                  print("the post 7 ${_posts[6]}");
                    print("the post 8 ${_posts[7]}");
    } catch (e) {
      debugPrint('Error fetching posts: $e');
    } finally {
      notifyListeners();
    }
  }
}