import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8014765571140682/4960214184';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String? get interstitalAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-8014765571140682/1343121547";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
