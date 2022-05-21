# Navigating Calendar Package

Adds to the Flutter Calendar utility that lets user navigate back and forth in the dates.

## Usage

To use this plugin, add `navigating_calendar` as
a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels)
.

### Examples

Here is a small example that show you how to use the package.

   ``` 
      
    class CalendarField extends StatelessWidget {  
      const CalendarField({Key? key}) : super(key: key);  
      
      @override  
      Widget build(BuildContext context) {  
        return BlocBuilder<NavigatingCalendarBloc, NavigatingCalendarState>(  
          buildWhen: (previous, current) =>  
              previous.currentDate != current.currentDate,  
      builder: (context, state) {  
            return Row(  
              mainAxisAlignment: MainAxisAlignment.center,  
      children: [  
                NavigatingCalendar(  
                  currentValue: state.currentDate,  
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
    } ```
   ```

### SAMPLE DEMO

![Image of Navigating Calendar](https://github.com/praveengitsit/nav_calendar/blob/main/assets/images/nc_still.png)

![Working demo of Navigating Calendar](https://github.com/praveengitsit/nav_calendar/blob/main/assets/images/nc_working.gif)

### NOTE

The UI state of the calendar will only change when the currentValue passed to it changes. This is to
ensure that the state is reflected in the UI, in that order. Might be prone to change in upcoming
versions
