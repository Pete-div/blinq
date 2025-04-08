import 'dart:collection';

import 'package:bliqtest/_lib.dart';




final dashBoardModel = ChangeNotifierProvider<DashboardViewModel>(
  (ref) => DashboardViewModel(
    ref: ref,));

class DashboardViewModel extends ChangeNotifier{
   final Ref ref;
    DashboardViewModel({required this.ref});

    int currentindex = 0;
  ListQueue<int> navigationQueue = ListQueue();

  void changeTabIndex(int index) {
    currentindex = index;

    if (index == currentindex) {
      navigationQueue.clear();
      // navigationQueue.removeWhere((element) => element == index);
      navigationQueue.addLast(index);
      currentindex = index;
      notifyListeners();
    }
    notifyListeners();
    checkdata();
  }


  void checkdata() {
    // ignore: avoid_function_literals_in_foreach_calls
    navigationQueue.forEach((element) {});
  }


  //SEARCH USERS
  bool isLoading = false;

  updateIsLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }


}