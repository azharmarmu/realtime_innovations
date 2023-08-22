import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_innovations/__shared/assets.dart';
import 'package:realtime_innovations/__shared/route.dart';
import 'package:realtime_innovations/__shared/strings.dart';
import 'package:realtime_innovations/models/employee_action_model.dart';

import '../../__shared/colors.dart';
import 'bloc/employee_cubit.dart';
import 'widgets/employee.dart';
import 'widgets/no_employee.dart';

class DashboarBlocProviderPage extends StatelessWidget {
  const DashboarBlocProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: EmployeeCubit()
        ..employeeAction(
          EmployeeActionModel(
            action: EmpAction.read,
          ),
        ),
      child: const _DashboardPage(),
    );
  }
}

class _DashboardPage extends StatelessWidget {
  const _DashboardPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.employeeList),
      ),
      body: SizedBox(
        width: double.infinity,
        child: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoaded && state.employees.isNotEmpty) {
              return EmployeeWidget(
                employees: state.employees,
              );
            } else if (state is EmployeeLoading) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return NoEmployeeWidget();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var empAction = await Navigator.pushNamed(
            context,
            AppRoutes.addEmployee,
          );

          if (empAction != null && empAction is EmployeeActionModel) {
            print('empAction: $empAction');
            context.read<EmployeeCubit>().employeeAction(empAction);
          }
        },
        child: SvgPicture.asset(
          AppAssets.add,
          theme: SvgTheme(
            currentColor: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
