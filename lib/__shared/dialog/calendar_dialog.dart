import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realtime_innovations/__shared/assets.dart';
import 'package:realtime_innovations/__shared/strings.dart';

import '../utilities/date_utils.dart';
import '../widgets/button.dart';
import '../extensions/date_ext.dart';
import 'calendar_date_picker2.dart' as cp2;

Future showCalendarDialog(
  BuildContext context, {
  required DateTime initlaDate,
  required DateTime firstDate,
  required DateTime lastDate,
  required bool fromDate,
}) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return CalendarDialog(
          initlaDate: initlaDate,
          firstDate: firstDate,
          lastDate: lastDate,
          fromDate: fromDate,
        );
      });
}

class CalendarDialog extends StatefulWidget {
  final DateTime initlaDate, firstDate, lastDate;
  final bool fromDate;

  const CalendarDialog({
    super.key,
    required this.initlaDate,
    required this.firstDate,
    required this.lastDate,
    required this.fromDate,
  });

  @override
  State<CalendarDialog> createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  late DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initlaDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      widget.fromDate ? fromWidget : toWidget,
                      cp2.CalendarDatePicker(
                        initialDate: selectedDate ?? widget.firstDate,
                        firstDate: widget.firstDate,
                        lastDate: widget.lastDate,
                        onDateChanged: (val) {
                          selectedDate = val;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AppAssets.event),
                          SizedBox(width: 8),
                          Text(
                            selectedDate.toSDate,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppButton.secondary(
                            width: MediaQuery.of(context).size.width / 5,
                            verticalPadding: 8,
                            label: AppStrings.cancel,
                            onTap: () => Navigator.pop(context),
                          ),
                          SizedBox(width: 8),
                          AppButton.primary(
                            width: MediaQuery.of(context).size.width / 5,
                            verticalPadding: 8,
                            label: AppStrings.save,
                            onTap: () => Navigator.pop(context, selectedDate),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get fromWidget {
    bool isToday = selectedDate.compareDate(DateTime.now());
    bool isNextMonday = selectedDate.compareDate(nextMonday(DateTime.now()));
    bool isNextTuesday = selectedDate.compareDate(nextTuesday(DateTime.now()));
    bool isAfterAWeek = selectedDate.compareDate(afterAWeek(DateTime.now()));

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppButtonWrapper(
                label: AppStrings.today,
                primaryButton: isToday,
                onTap: () {
                  selectedDate = DateTime.now();
                  setState(() {});
                },
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: AppButtonWrapper(
                label: AppStrings.nextMonday,
                primaryButton: isNextMonday,
                onTap: () {
                  selectedDate = nextMonday(DateTime.now());
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AppButtonWrapper(
                label: AppStrings.nextTuesday,
                primaryButton: isNextTuesday,
                onTap: () {
                  selectedDate = nextTuesday(DateTime.now());
                  setState(() {});
                },
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: AppButtonWrapper(
                label: AppStrings.afterAWeek,
                primaryButton: isAfterAWeek,
                onTap: () {
                  selectedDate = afterAWeek(DateTime.now());
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get toWidget {
    bool isNoDate = selectedDate == null;
    bool isToday = selectedDate.compareDate(DateTime.now());
    return Row(
      children: [
        Expanded(
          child: AppButtonWrapper(
            label: AppStrings.noDate,
            primaryButton: isNoDate,
            onTap: () {
              selectedDate = null;
              setState(() {});
            },
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: AppButtonWrapper(
            label: AppStrings.today,
            primaryButton: isToday,
            onTap: () {
              selectedDate = DateTime.now();
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
