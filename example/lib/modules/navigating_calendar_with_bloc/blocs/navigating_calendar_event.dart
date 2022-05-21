part of 'navigating_calendar_bloc.dart';

abstract class NavigatingCalendarEvent extends Equatable {
  const NavigatingCalendarEvent();
}

class DateChangedEvent extends NavigatingCalendarEvent {
  final DateTime newDate;

  const DateChangedEvent({
    required this.newDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        newDate,
      ];
}
