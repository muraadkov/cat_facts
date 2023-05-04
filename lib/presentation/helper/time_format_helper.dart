import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeFormatHelper {
  static String dateForFactItem({required DateTime dateTime, required BuildContext context}) {
    String locale = Localizations.localeOf(context).languageCode;
    DateTime now = DateTime.now();
    String dayMonth = DateFormat.MMMMd(locale).format(now);
    String year = DateFormat.y(locale).format(now);

    return '$dayMonth $year';
  }
}
