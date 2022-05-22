part of 'navigating_calendar_bloc.dart';

class NavigatingCalendarState extends Equatable {
  final DateTime selectedDate;

  const NavigatingCalendarState({
    required this.selectedDate,
  });

  NavigatingCalendarState copyWith({
    DateTime? selectedDate,
  }) {
    return NavigatingCalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        selectedDate,
      ];
}
