import 'package:flutter/cupertino.dart';

import '../../../__shared/assets.dart';
import '../../../__shared/strings.dart';
import '../../../__shared/widgets/text_input.dart';

class NameField extends StatelessWidget {
  final TextEditingController nameController;
  const NameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      label: AppStrings.empName,
      controller: nameController,
      prefixIcon: AppAssets.person,
    );
  }
}
