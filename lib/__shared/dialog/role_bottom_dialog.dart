import 'package:flutter/material.dart';
import 'package:realtime_innovations/__shared/strings.dart';

Future showRoleBottomDialog(BuildContext context) async {
  return await showModalBottomSheet(
    context: context,
    builder: (_) => RoleBottomDialog(
      onTap: (val) {
        Navigator.pop(context, val);
      },
    ),
  );
}

class RoleBottomDialog extends StatelessWidget {
  final Function(String) onTap;
  final rolesList = [
    AppStrings.prodDesigner,
    AppStrings.flutterDev,
    AppStrings.qaTester,
    AppStrings.prodOwner,
  ];

  RoleBottomDialog({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: rolesList.length,
            itemBuilder: (_, index) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onTap(rolesList[index]),
              child: Container(
                alignment: Alignment.center,
                height: 36,
                child: Text(
                  rolesList[index],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            separatorBuilder: (_, index) => Divider(),
          ),
        ),
      ],
    );
  }
}
