DateTime nextMonday(DateTime currentDate) {
  currentDate = currentDate.add(Duration(days: 1));
  while (currentDate.weekday != DateTime.monday) {
    currentDate = currentDate.add(Duration(days: 1));
  }
  return currentDate;
}

DateTime nextTuesday(DateTime currentDate) {
  currentDate = currentDate.add(Duration(days: 1));
  while (currentDate.weekday != DateTime.tuesday) {
    currentDate = currentDate.add(Duration(days: 1));
  }
  return currentDate;
}

DateTime afterAWeek(DateTime currentDate) {
  currentDate = currentDate.add(Duration(days: 7));
  return currentDate;
}
