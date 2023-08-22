import 'package:flutter/material.dart';
import 'package:realtime_innovations/__shared/strings.dart';
import 'package:realtime_innovations/models/employee_model.dart';

import '../../../__shared/colors.dart';
import 'emp_item.dart';

class EmployeeWidget extends StatelessWidget {
  final List<EmployeeModel> employees;
  const EmployeeWidget({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    Map<String, List<EmployeeModel>> em = {
      AppStrings.currentEmp: [],
      AppStrings.prevEmp: [],
    };

    for (var emp in employees) {
      if (emp.getToDate != null) {
        em[AppStrings.prevEmp]?.add(emp);
      } else {
        em[AppStrings.currentEmp]?.add(emp);
      }
    }

    int currentEmpLength = em[AppStrings.currentEmp]!.length;
    int previousEmpLength = em[AppStrings.prevEmp]!.length;
    return SingleChildScrollView(
      child: Column(
        children: [
          if (currentEmpLength > 0) header(context, 'Current Employees'),
          Container(
            color: Colors.white,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: currentEmpLength,
              itemBuilder: (_, index) => EmployeeItem(
                index: index,
                emp: em[AppStrings.currentEmp]![index],
              ),
              separatorBuilder: (_, index) => Divider(),
            ),
          ),
          if (previousEmpLength > 0) header(context, 'Previous Employees'),
          Container(
            color: Colors.white,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: previousEmpLength,
              itemBuilder: (_, index) => EmployeeItem(
                index: index,
                emp: em[AppStrings.prevEmp]![index],
              ),
              separatorBuilder: (_, index) => Divider(),
            ),
          ),
        ],
      ),
    );
  }

  Container header(BuildContext context, String label) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: AppColors.bgColor),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.accentColor,
            ),
      ),
    );
  }
}
