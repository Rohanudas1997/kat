import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mp;

enum TextSizeType { Width, Height }

class TextUtils {
  static Map<String, String> splitName(String fullname) {
    final _temp = fullname.split(" ");
    String fname = "";
    String lname = "";

    if (_temp.length > 1) {
      fname = _temp.first;
      lname = _temp.sublist(1).join(" ");
    } else {
      fname = _temp.first;
    }

    return {
      'firstname': fname,
      'lastname': lname,
    };
  }

  static bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@shsu\.edu")
        .hasMatch(email);
  }

  static String formatTemplateMessage(
      {required String templateMessage,
      String recipientName = "",
      String senderName = ""}) {
    String temp = templateMessage;
    temp = temp.replaceAll("<%= recipient_name %>",
        recipientName.isNotEmpty ? recipientName : "_recipient_name_");
    temp = temp.replaceAll("<%= sender_name %>",
        senderName.isNotEmpty ? senderName : "_sender_name_");
    return temp;
  }

  static double getRequiredTextSize({
    required String mytext,
    required TextStyle style,
    required double maxWidth,
    TextAlign textAlign = TextAlign.left,
    required BuildContext context,
    TextSizeType sizeType = TextSizeType.Height,
  }) {
    final textScaleFactor = MediaQuery.textScaleFactorOf(context);
    final textHeightBehaviour = DefaultTextStyle.of(context).textHeightBehavior;
    const textWidthBasis = TextWidthBasis.parent;
    final span = TextSpan(
      text: mytext,
      style: style,
    );
    final tp = TextPainter(
      textAlign: textAlign,
      text: span,
      textDirection: mp.TextDirection.ltr,
      textScaleFactor: textScaleFactor,
      textHeightBehavior: textHeightBehaviour,
      textWidthBasis: textWidthBasis,
    );
    tp.layout(maxWidth: maxWidth);
    if (sizeType == TextSizeType.Height) {
      return tp.size.height;
    } else {
      return tp.size.width;
    }
  }

  static String getGreeting() {
    String message = "";
    TimeOfDay now = TimeOfDay.now();
    TimeOfDay morning = TimeOfDay(hour: 12, minute: 0);
    TimeOfDay afternoon = TimeOfDay(hour: 18, minute: 0);
    TimeOfDay evening = TimeOfDay(hour: 21, minute: 0);
    TimeOfDay night = TimeOfDay(hour: 24, minute: 0);

    if (now.hour < morning.hour) {
      message = "Good Morning";
    } else if (now.hour < afternoon.hour) {
      message = "Good Afternoon";
    } else if (now.hour < evening.hour) {
      message = "Good Evening";
    } else if (now.hour < night.hour) {
      message = "Good Night";
    } else {
      message = "Welcome";
    }
    return message;
  }
}

extension Capitalize on String {
  String capitalize({bool allWords = true}) {
    if (isEmpty) {
      return this;
    }
    if (allWords) {
      final List<String> words = split(' ');
      final List<String> capitalized = <String>[];
      for (var w in words) {
        capitalized.add(w.capitalize(allWords: false));
      }
      return capitalized.join(' ');
    } else {
      return substring(0, 1).toUpperCase() + substring(1).toLowerCase();
    }
  }
}
