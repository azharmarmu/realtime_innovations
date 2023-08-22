import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../__shared/strings.dart';
import '../../../__shared/widgets/button.dart';
import '../../../models/employee_model.dart';
import '../bloc/date_cubit.dart';
import '../bloc/role_cubit.dart';
import 'date_field.dart';
import 'name_field.dart';
import 'role_field.dart';

class EmployeeBody extends StatelessWidget {
  final Function(EmployeeModel) onSave;
  final Function() onCancel;
  const EmployeeBody({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.roleCubit,
    required this.fromDateCubit,
    required this.toDateCubit,
    required this.nameController,
    required this.roleController,
    required this.fromDateController,
    required this.toDateController,
  });

  final RoleCubit roleCubit;
  final DateCubit fromDateCubit;
  final DateCubit toDateCubit;
  final TextEditingController nameController;
  final TextEditingController roleController;
  final TextEditingController fromDateController;
  final TextEditingController toDateController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RoleCubit>(
            create: (_) => roleCubit,
          ),
          BlocProvider<DateCubit>(
            create: (_) => fromDateCubit,
          ),
          BlocProvider<DateCubit>(
            create: (_) => toDateCubit,
          ),
        ],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  NameField(nameController: nameController),
                  SizedBox(height: 16),
                  RoleField(roleController: roleController),
                  SizedBox(height: 16),
                  DateField(
                    fromCubit: fromDateCubit,
                    toCubit: toDateCubit,
                    fromDateController: fromDateController,
                    toDateController: toDateController,
                  ),
                ],
              ),
            ),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton.secondary(
                    width: MediaQuery.of(context).size.width / 4,
                    label: AppStrings.cancel,
                    onTap: onCancel,
                  ),
                  SizedBox(width: 12),
                  AppButton.primary(
                    width: MediaQuery.of(context).size.width / 4,
                    label: AppStrings.save,
                    onTap: () {
                      String name = nameController.text.trim();
                      String role = roleController.text.trim();
                      String fromDate = fromDateController.text.trim();
                      String toDate = toDateController.text.trim();
      
                      if (name.isEmpty || role.isEmpty || fromDate.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Enter required fields'),
                          ),
                        );
                        return;
                      }

                      EmployeeModel emp = EmployeeModel();
                      if (name.isNotEmpty) {
                        emp.setName = name;
                      }

                      if (role.isNotEmpty) {
                        emp.setrole = roleCubit.role;
                      }

                      if (fromDate.isNotEmpty && fromDateCubit.date != null) {
                        emp.setFromDate = fromDateCubit.date;
                      }

                      if (toDate.isNotEmpty && toDateCubit.date != null) {
                        emp.setToDate = toDateCubit.date;
                      }

                      onSave(emp);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
