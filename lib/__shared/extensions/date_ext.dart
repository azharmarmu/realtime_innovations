import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime? {
  //yyyy-MM-dd – kk:mm
  String get toSDate =>
      this != null ? DateFormat('dd MMM yyyy').format(this!) : '';

  bool compareDate(DateTime date) {
    if (this == null) return false;
    return this!.year == date.year &&
        this!.month == date.month &&
        this!.day == date.day;
  }
}
