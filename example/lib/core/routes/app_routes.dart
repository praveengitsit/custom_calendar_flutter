import '../../modules/home/screens/home_screen.dart';
import '../../modules/navigating_calendar_with_bloc/pages/navigating_calendar_with_bloc.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static routes() {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      HomeScreen.routeName: (context) => const HomeScreen(),
      NavigatingCalendarWithBlocScreen.routeName: (context) =>
          const NavigatingCalendarWithBlocScreen(),
    };
  }

  static initialRoute() {
    return SplashScreen.routeName;
  }

  static homeRoute() {
    return HomeScreen.routeName;
  }
}
