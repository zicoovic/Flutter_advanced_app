import 'package:flutter_advanced_app/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      this!;
    }
    return this!;
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      this!;
    }
    return this!;
  }
}
