import 'package:flutter/material.dart';
import 'package:realtime_innovations/models/employee_model.dart';

import 'emp_item.dart';

class EmployeeWidget extends StatelessWidget {
  final List<EmployeeModel> employees;
  const EmployeeWidget({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: employees.length,
      itemBuilder: (_, index) => EmployeeItem(
        index: index,
        emp: employees[index],
      ),
      separatorBuilder: (_, index) => Divider(),
    );
  }
}
