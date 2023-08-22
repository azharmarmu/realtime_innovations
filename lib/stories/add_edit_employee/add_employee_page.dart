import 'package:flutter/material.dart';
import 'package:realtime_innovations/__shared/strings.dart';
import 'package:realtime_innovations/models/employee_action_model.dart';

import '../../__shared/colors.dart';
import '../../models/employee_model.dart';
import 'bloc/date_cubit.dart';
import 'bloc/role_cubit.dart';
import 'widgets/employee_body.dart';

class AddEmployeePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();

  AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppStrings.addEmployeeDetails),
      ),
      body: EmployeeBody(
        roleCubit: RoleCubit(),
        fromDateCubit: DateCubit(),
        toDateCubit: DateCubit(),
        nameController: nameController,
        roleController: roleController,
        fromDateController: fromDateController,
        toDateController: toDateController,
        onCancel: () => Navigator.pop(context),
        onSave: (EmployeeModel emp) => Navigator.pop(
          context,
          EmployeeActionModel(
            emp: emp,
            action: EmpAction.create,
          ),
        ),
      ),
    );
  }
}
