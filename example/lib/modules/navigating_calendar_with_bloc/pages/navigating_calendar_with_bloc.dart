import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigating_calendar/navigating_calendar.dart';

import '../blocs/navigating_calendar_bloc.dart';

part '../widgets/calendar_field.dart';

class NavigatingCalendarWithBlocScreen extends StatelessWidget {
  static const routeName = 'navigating-calendar-with-bloc';

  const NavigatingCalendarWithBlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigatingCalendarBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Navigating calendar using BLoC'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CalendarField(),
          ],
        ),
      ),
    );
  }
}
