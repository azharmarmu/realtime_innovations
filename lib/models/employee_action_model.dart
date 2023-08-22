import 'package:realtime_innovations/models/employee_model.dart';

enum EmpAction {
  create,
  read,
  update,
  delete,
}

class EmployeeActionModel {
  int? index;
  EmployeeModel? emp;
  EmpAction? action;

  EmployeeActionModel({
    this.index,
    this.emp,
    this.action,
  });

  set setEmp(EmployeeModel emp) => this.emp = emp;
  set setAction(EmpAction action) => this.action = action;

  @override
  String toString() {
    return 'index: $index, EmployeeModel: $emp, action: $action';
  }
}
