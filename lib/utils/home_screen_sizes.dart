import 'dart:math';

class HomeScreenSizes {
  double x = 0;
  double y = 0;
  double sizeWidth = 0;
  double sizeHeight = 0;
  HomeScreenSizes({
    this.sizeHeight = 0,
    this.sizeWidth = 0,
    this.x = 0,
    this.y = 0,
  });

  updateApplePosition() {
    x = Random().nextDouble() * sizeWidth;
    y = Random().nextDouble() * sizeHeight;
  }
}
