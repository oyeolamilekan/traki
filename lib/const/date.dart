import 'package:intl/intl.dart';

parseDateToString(date) {
  String dateval =
      DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.parse(date));
  return dateval;
}
