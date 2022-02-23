import 'package:flutter/material.dart';
import 'package:ride_app/screens/discover_page.dart';
import 'package:ride_app/screens/explore_page.dart';
import 'package:ride_app/screens/location_page.dart';
import 'package:ride_app/screens/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  int _selectedIndex = 0;
  late final AnimationController _animationController = AnimationController(
    vsync: this, 
    duration: const Duration(milliseconds: 300)
    )..repeat();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentWidget(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _currentWidget(){
    switch(_selectedIndex){
      case 0:
        return const DiscoverPage();
      case 1:
        return const LocationPage();
      case 2:
        return const ExplorePage();
      case 3:
        return const SettingsPage();
      default:
        return const Center(child: Text('Error'));
    }
  }

  Widget _bottomNavigationBar() =>
      BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => {_selectedIndex = index}),
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        unselectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_bike_outlined, color: Theme.of(context).colorScheme.secondary,),
          label: 'Discover',
          activeIcon: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            spacing: 5,
            children: [
              Icon(Icons.directions_bike_outlined, color: Theme.of(context).colorScheme.onPrimary),
             Text('Discover', style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.onPrimary))
            ],
            )
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                ),
          label: 'Location',
          activeIcon: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 5,
                  children: [
                    Icon(Icons.location_on_rounded,
                        color: Theme.of(context).colorScheme.onPrimary),
                    Text('Location',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary))
                  ],
                )
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                ),
          label: 'Explore',
          activeIcon: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 5,
                  children: [
                    Icon(Icons.compass_calibration_rounded,
                        color: Theme.of(context).colorScheme.onPrimary),
                    Text('Explore',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary))
                  ],
                )
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                ),
          label: 'Settings',
          activeIcon: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 5,
                  children: [
                    Icon(Icons.settings_rounded,
                        color: Theme.of(context).colorScheme.onPrimary),
                    Text('Settings',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary))
                  ],
                )
        ),
      ]);
}
