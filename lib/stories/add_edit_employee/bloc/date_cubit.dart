import 'package:bloc/bloc.dart';

class DateCubit extends Cubit<DateTime?> {
  DateTime? date;
  DateCubit({this.date}) : super(date);

  void selectDate(DateTime? value) {
    date = value;
    emit(date);
  }
}
