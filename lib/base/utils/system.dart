import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class System {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;

  //we divide the screen by blocks 100*100 here is the size of 1 block
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;

  //we divide the screen by blocks 100*100 here is the size of 1 block when
  //system bar, notches etc are removed
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static double safeAreaBottom;

  ///return false if is initialized already
  bool init(BuildContext context) {
    if (screenWidth != null) {
      return false;
    }

    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    safeAreaBottom = _mediaQueryData.padding.bottom;

    return true;
  }

  @override
  String toString() {
    return 'SizeConfig{\n_mediaQueryData: $_mediaQueryData,\nscreenWidth: $screenWidth,\n'
        'screenHeight: $screenHeight,\nblockSizeHorizontal: $blockSizeHorizontal,\nblockSizeVertical: $blockSizeVertical,\n_safeAreaHorizontal: $_safeAreaHorizontal,\n_safeAreaVertical: $_safeAreaVertical,\nsafeBlockHorizontal: $safeBlockHorizontal,\nsafeBlockVertical: $safeBlockVertical}';
  }
}
