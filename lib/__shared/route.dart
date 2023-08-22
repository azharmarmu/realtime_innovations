import 'package:flutter/material.dart';
import 'package:realtime_innovations/models/employee_action_model.dart';
import 'package:realtime_innovations/stories/dashboard/dashboard_page.dart';

import '../stories/add_edit_employee/add_employee_page.dart';
import '../stories/add_edit_employee/edit_employee_page.dart';

mixin AppRoutes {
  //Authentication
  static const dashboard = '/';
  static const addEmployee = '/addEmployee';
  static const editEmployee = '/editEmployee';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  final dynamic args = settings.arguments;
  switch (settings.name) {
    case AppRoutes.dashboard:
      return MaterialPageRoute(
        builder: (_) => const DashboarBlocProviderPage(),
      );
    case AppRoutes.addEmployee:
      return MaterialPageRoute(
        builder: (_) => AddEmployeePage(),
      );
    case AppRoutes.editEmployee:
      return MaterialPageRoute(
        builder: (_) => EditEmployeePage(eam: args as EmployeeActionModel),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Placeholder(),
        ),
      );
  }
}
