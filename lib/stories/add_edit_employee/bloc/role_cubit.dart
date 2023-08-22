import 'package:bloc/bloc.dart';

class RoleCubit extends Cubit<String> {
  String role;
  RoleCubit({this.role = ''}) : super(role);

  void selectRole(String value) {
    role = value;
    emit(role);
  }
}
