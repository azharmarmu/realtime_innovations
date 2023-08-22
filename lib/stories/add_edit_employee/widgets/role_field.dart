import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../__shared/assets.dart';
import '../../../__shared/dialog/role_bottom_dialog.dart';
import '../../../__shared/strings.dart';
import '../../../__shared/widgets/text_input.dart';
import '../bloc/role_cubit.dart';

class RoleField extends StatelessWidget {
  final TextEditingController roleController;
  const RoleField({super.key, required this.roleController});

  @override
  Widget build(BuildContext context) {
    final roleCubit = context.read<RoleCubit>();
    return BlocBuilder<RoleCubit, String>(
      bloc: roleCubit..selectRole(roleCubit.role),
      builder: (_, state) {
        return TextInputWidget(
          label: AppStrings.selectRole,
          controller: roleController..text = state,
          prefixIcon: AppAssets.work,
          suffixIcon: AppAssets.arrowDown,
          readOnly: true,
          onTap: () async {
            final String res = await showRoleBottomDialog(context) ?? '';
            if (res.isNotEmpty) {
              roleCubit.selectRole(res);
            }
          },
        );
      },
    );
  }
}
