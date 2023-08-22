import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realtime_innovations/models/employee_action_model.dart';
import 'package:realtime_innovations/models/employee_model.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  List<EmployeeModel> empolyees = [];
  EmployeeCubit() : super(EmployeeNoEmployee());

  void employeeAction(EmployeeActionModel employeeActionModel) {
    if (employeeActionModel.action == EmpAction.create) {
      _createEmployee(employeeActionModel.emp!);
    } else if (employeeActionModel.action == EmpAction.read) {
      _readEmployee();
    } else if (employeeActionModel.action == EmpAction.update) {
      _updateEmployee(employeeActionModel.index!, employeeActionModel.emp!);
    } else if (employeeActionModel.action == EmpAction.delete) {
      _deleteEmployee(employeeActionModel.index!);
    }
  }

  void _createEmployee(EmployeeModel emp) {
    emit(EmployeeLoading());
    empolyees.add(emp);
    emit(EmployeeLoaded(empolyees));
  }

  void _readEmployee() {
    emit(empolyees.isNotEmpty
        ? EmployeeLoaded(empolyees)
        : EmployeeNoEmployee());
  }

  void _updateEmployee(int index, EmployeeModel emp) {
    emit(EmployeeLoading());
    empolyees[index] = emp;
    emit(EmployeeLoaded(empolyees));
  }

  void _deleteEmployee(int index) {
    emit(EmployeeLoading());
    empolyees.removeAt(index);
    emit(EmployeeLoaded(empolyees));
  }
}
