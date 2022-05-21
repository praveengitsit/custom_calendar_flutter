import 'package:flutter/material.dart';

import '../../../common/widgets/buttons/nc_button.dart';
import '../../../core/routes/app_routes.dart';
import '../../navigating_calendar_with_bloc/pages/navigating_calendar_with_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigating Calendar: Examples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          NcButton(
            child: const Text('Using with BLoC'),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  NavigatingCalendarWithBlocScreen.routeName, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
