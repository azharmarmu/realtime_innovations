import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_innovations/__shared/assets.dart';
import 'package:realtime_innovations/__shared/strings.dart';
import 'package:realtime_innovations/models/employee_action_model.dart';
import 'package:realtime_innovations/models/employee_model.dart';

import '../../__shared/colors.dart';
import 'bloc/date_cubit.dart';
import 'bloc/role_cubit.dart';
import 'widgets/employee_body.dart';

class EditEmployeePage extends StatelessWidget {
  final EmployeeActionModel eam;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();

  EditEmployeePage({super.key, required this.eam});

  @override
  Widget build(BuildContext context) {
    print('EditEmployeePage: $eam');
    nameController.text = eam.emp!.getName ?? '';
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppStrings.editEmployeeDetails),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(
              context,
              eam..setAction = EmpAction.delete,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SvgPicture.asset(AppAssets.delete),
            ),
          ),
        ],
      ),
      body: EmployeeBody(
        roleCubit: RoleCubit(role: eam.emp!.getRole!),
        fromDateCubit: DateCubit(date: eam.emp!.getFromDate!),
        toDateCubit: DateCubit(date: eam.emp!.getToDate!),
        nameController: nameController,
        roleController: roleController,
        fromDateController: fromDateController,
        toDateController: toDateController,
        onCancel: () => Navigator.pop(context),
        onSave: (EmployeeModel emp) => Navigator.pop(
          context,
          eam
            ..action = EmpAction.update
            ..emp = emp,
        ),
      ),
    );
  }
}
