import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realtime_innovations/__shared/extensions/date_ext.dart';
import 'package:realtime_innovations/stories/add_edit_employee/bloc/date_cubit.dart';

import '../../../__shared/assets.dart';
import '../../../__shared/dialog/calendar_dialog.dart';
import '../../../__shared/strings.dart';
import '../../../__shared/widgets/text_input.dart';

class DateField extends StatelessWidget {
  final TextEditingController fromDateController;
  final TextEditingController toDateController;
  final DateCubit fromCubit;
  final DateCubit toCubit;

  const DateField({
    super.key,
    required this.fromDateController,
    required this.toDateController,
    required this.fromCubit,
    required this.toCubit,
  });

  @override
  Widget build(BuildContext context) {
    DateTime fromInitialDate = DateTime.now();
    DateTime fromFirstDate = DateTime(2015);
    DateTime fromLastDate = DateTime(2024);
    DateTime? selectedFromDate;

    DateTime toInitialDate = DateTime.now();
    DateTime toFirstDate = DateTime(2015);
    DateTime toLastDate = DateTime(2024);
    DateTime? selectedToDate;

    return Row(
      children: [
        Flexible(
          child: BlocBuilder<DateCubit, DateTime?>(
            bloc: fromCubit..selectDate(fromCubit.date),
            builder: (_, state) {
              return TextInputWidget(
                label: AppStrings.noDate,
                controller: fromDateController
                  ..text = (state != null) ? '${state.toSDate}' : '',
                prefixIcon: AppAssets.event,
                readOnly: true,
                onTap: () async {
                  selectedFromDate = await showCalendarDialog(
                        context,
                        initlaDate: fromInitialDate,
                        firstDate: fromFirstDate,
                        lastDate: fromLastDate,
                        fromDate: true,
                      ) ??
                      '';
                  if (selectedFromDate != null) {
                    fromCubit.selectDate(selectedFromDate!);
                  }
                },
              );
            },
          ),
        ),
        SizedBox(width: 4),
        SvgPicture.asset(AppAssets.arrowNext),
        SizedBox(width: 4),
        Flexible(
          child: BlocBuilder<DateCubit, DateTime?>(
            bloc: toCubit..selectDate(toCubit.date),
            builder: (_, state) {
              return TextInputWidget(
                label: AppStrings.noDate,
                controller: toDateController
                  ..text = (state != null) ? '${state.toSDate}' : '',
                prefixIcon: AppAssets.event,
                readOnly: true,
                onTap: () async {
                  if (selectedFromDate != null) {
                    toInitialDate = selectedFromDate!.add(Duration(days: 1));
                    toFirstDate = toInitialDate;
                    selectedToDate = await showCalendarDialog(
                          context,
                          initlaDate: toInitialDate,
                          firstDate: toFirstDate,
                          lastDate: toLastDate,
                          fromDate: false,
                        ) ??
                        '';
                    if (selectedToDate != null) {
                      toCubit.selectDate(selectedToDate!);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Select From Date'),
                        duration: Duration(milliseconds: 100),
                      ),
                    );
                  }
                },
              );
            },
          ),
        )
      ],
    );
  }
}
