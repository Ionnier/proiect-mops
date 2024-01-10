import 'package:front/models/interval.dart';

class IntervalCompanion {
  int startHour = -1;
  int endHour = -1;
  bool isOccupied = false;
  bool isSelected = false;
  DateTime date = DateTime.now();

  Interval toInterval() {
    return Interval(
        startTimestamp: date
            .copyWith(
                hour: startHour,
                minute: 0,
                microsecond: 0,
                millisecond: 0,
                second: 0)
            .millisecondsSinceEpoch,
        endTimestamp: date
            .copyWith(
                hour: endHour,
                minute: 0,
                microsecond: 0,
                millisecond: 0,
                second: 0)
            .millisecondsSinceEpoch);
  }
}
