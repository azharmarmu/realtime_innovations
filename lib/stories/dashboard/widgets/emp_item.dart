import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_innovations/__shared/assets.dart';
import 'package:realtime_innovations/__shared/colors.dart';
import 'package:realtime_innovations/__shared/extensions/date_ext.dart';
import 'package:realtime_innovations/__shared/route.dart';
import 'package:realtime_innovations/models/employee_model.dart';

import '../../../models/employee_action_model.dart';
import '../bloc/employee_cubit.dart';

class EmployeeItem extends StatelessWidget {
  final EmployeeModel emp;
  final int index;
  const EmployeeItem({
    super.key,
    required this.emp,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('$index'),
      background: Container(
        alignment: Alignment.center,
        color: AppColors.errorColor,
        child: SvgPicture.asset(AppAssets.delete),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => context.read<EmployeeCubit>().employeeAction(
            EmployeeActionModel(
              index: index,
              emp: emp,
              action: EmpAction.delete,
            ),
          ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          var empAction = await Navigator.pushNamed(
            context,
            AppRoutes.editEmployee,
            arguments: EmployeeActionModel(
              index: index,
              emp: emp,
              action: EmpAction.update,
            ),
          );

          if (empAction != null && empAction is EmployeeActionModel) {
            print('empAction: $empAction');
            context.read<EmployeeCubit>().employeeAction(empAction);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                emp.getName ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 6),
              Text(
                emp.role ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 4),
              Text(
                getDuration(emp),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getDuration(EmployeeModel employee) {
    if (employee.toDate != null) {
      return '${employee.fromDate!.toSDate} -  ${employee.toDate!.toSDate}';
    }
    return 'From ${employee.fromDate!.toSDate}';
  }
}
