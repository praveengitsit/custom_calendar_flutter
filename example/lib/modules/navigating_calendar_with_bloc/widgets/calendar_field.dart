part of '../pages/navigating_calendar_with_bloc.dart';

class CalendarField extends StatelessWidget {
  const CalendarField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatingCalendarBloc, NavigatingCalendarState>(
      buildWhen: (previous, current) =>
          previous.selectedDate != current.selectedDate,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavCalendar(
              initialValue: state.selectedDate,
              onChanged: (value) {
                context.read<NavigatingCalendarBloc>().add(
                      DateChangedEvent(
                        newDate: value,
                      ),
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
