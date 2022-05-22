import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigating_calendar_event.dart';

part 'navigating_calendar_state.dart';

class NavigatingCalendarBloc
    extends Bloc<NavigatingCalendarEvent, NavigatingCalendarState> {
  NavigatingCalendarBloc()
      : super(NavigatingCalendarState(
          selectedDate: DateTime.now(),
        )) {
    on<DateChangedEvent>(_onDateChangedEvent);
  }

  void _onDateChangedEvent(
    DateChangedEvent event,
    Emitter<NavigatingCalendarState> emit,
  ) {
    emit(
      state.copyWith(
        selectedDate: event.newDate,
      ),
    );
  }
}
