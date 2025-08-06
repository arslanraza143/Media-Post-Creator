

import 'package:flutter/material.dart';
import 'package:frontend/Core/Utils/log_util.dart';

class Helper {
  static Future<void> unFocusScope() async {
    try {
      var focus = FocusManager.instance.primaryFocus;
      if (focus != null && focus.hasFocus) {
        focus.unfocus();
      }
    } catch (e) {
      Log.e('unFocusScope:', '$e');
    }
  }
}