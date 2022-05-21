part of 'navigating_calendar_bloc.dart';

class NavigatingCalendarState extends Equatable {
  final DateTime currentDate;

  const NavigatingCalendarState({
    required this.currentDate,
  });

  NavigatingCalendarState copyWith({
    DateTime? currentDate,
  }) {
    return NavigatingCalendarState(
      currentDate: currentDate ?? this.currentDate,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        currentDate,
      ];
}
