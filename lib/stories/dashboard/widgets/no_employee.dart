import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../__shared/assets.dart';
import '../../../__shared/strings.dart';

class NoEmployeeWidget extends StatelessWidget {
  const NoEmployeeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.noEmployee,
        ),
        SizedBox(height: 4),
        Text(
          AppStrings.noEmployeeRecords,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}