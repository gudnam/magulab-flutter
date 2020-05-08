import 'package:flutter/foundation.dart';

class RegisterViewModel with ChangeNotifier {
  static final int FIRST_PAGE_NUM = 1;
  static final int MAX_PAGE_NUM = 5;

  final double increaseStep = 0.2;

  int currentPageNum = 1;

  double get percent => _calcuratePercent();

  RegisterViewModel(this.currentPageNum);

  void moveNextPage() {
    if (currentPageNum + 1 > MAX_PAGE_NUM) return;
    currentPageNum++;
    notifyListeners();
  }

  void movePreviousPage() {
    if (currentPageNum - 1 < FIRST_PAGE_NUM) return;
    currentPageNum--;
    notifyListeners();
  }

  double _calcuratePercent() {
    double percent = currentPageNum * increaseStep;
    if (percent > 1.0) percent = 1.0;
    return percent;
  }
}
