library nav_calendar;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// This custom form field widget is used with the traditional calendar provided by Flutter.
///  It lets a user navigate back and forth in the dates
class NavCalendar extends StatelessWidget {
  static const _100_YEARS = Duration(days: 365 * 100);

  final ValueChanged<DateTime> onChanged;
  final DateTime? currentValue;

  const NavCalendar({
    Key? key,
    required this.onChanged,
    required this.currentValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: currentValue,
      builder: (formState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateText(
              context,
              formState,
            ),
          ],
        );
      },
    );
  }

  Widget _buildDateText(
    BuildContext context,
    FormFieldState<DateTime> formState,
  ) {
    double width = MediaQuery.of(context).size.width / 100;
    const kVerticalPadding = 8.0;
    const kBorderColor = Color(0xffC7D9EA);
    const kArrowIconColor = Color(0xFF88aed2);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///**************************************
        ///     CALENDAR LABEL WITH ICON
        ///**************************************
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: kBorderColor,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: width * 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kVerticalPadding,
                    horizontal: 12.0,
                  ),
                  child: Text(
                    _label,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      fontFamily: 'Gotham',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kVerticalPadding,
                  horizontal: 12.0,
                ),
                child: GestureDetector(
                  child: const Icon(
                    Icons.date_range,
                  ),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: currentValue ?? DateTime.now(),
                      firstDate: DateTime.now().subtract(_100_YEARS),
                      lastDate: DateTime.now().add(_100_YEARS),
                    );

                    if (date != null) {
                      onChanged(date);
                      formState.didChange(date);
                    }
                  },
                ),
              ),
            ],
          ),
        ),

        ///**************************************
        ///           LEFT BUTTON
        ///**************************************
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              var date = currentValue;
              if (date != null) {
                date = date.subtract(
                  const Duration(days: 1),
                );
                onChanged(date);
                formState.didChange(date);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: kVerticalPadding,
                horizontal: 12.0,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: kBorderColor),
                  bottom: BorderSide(width: 1, color: kBorderColor),
                  right: BorderSide(width: 1, color: kBorderColor),
                ),
              ),
              child: const Icon(
                Icons.keyboard_arrow_left,
                color: kArrowIconColor,
              ),
            ),
          ),
        ),

        ///**************************************
        ///               RIGHT BUTTON
        ///**************************************
        InkWell(
          onTap: () {
            var date = currentValue;
            if (date != null) {
              date = date.add(
                const Duration(days: 1),
              );
              onChanged(date);
              formState.didChange(date);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: kVerticalPadding,
              horizontal: 12.0,
            ),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: kBorderColor),
                bottom: BorderSide(width: 1, color: kBorderColor),
                right: BorderSide(width: 1, color: kBorderColor),
              ),
            ),
            child: const Icon(
              Icons.keyboard_arrow_right,
              color: kArrowIconColor,
            ),
          ),
        )
      ],
    );
  }

  String get _label {
    if (currentValue == null) return 'No date chosen';

    return DateFormat('yyyy - MM - dd').format(currentValue!);
  }
}
