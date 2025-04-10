
import 'package:bliqtest/_lib.dart';

final userControllerProvider = ChangeNotifierProvider<UserController>((ref) {
  return UserController(ref);
});

class UserController extends ChangeNotifier {
  final Ref ref;

  List<UserModel> _user =[];
  bool _isLoading = false;

 List<UserModel> get listOfUsers => _user;
  bool get isLoading => _isLoading;

  UserController(this.ref);

  Future<void> fetchUser() async {
    _isLoading = true;
    notifyListeners();
    try {
      final result = await ref.read(firestoreServiceProvider).getUsers();
      _user = result;
    } catch (e) {
      debugPrint('Error fetching posts: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> fetchUserNoLoading() async {
    notifyListeners();
    try {
      final result = await ref.read(firestoreServiceProvider).getUsers();
      _user = result;
    } catch (e) {
      debugPrint('Error fetching posts: $e');
    } finally {
      notifyListeners();
    }
  }
}