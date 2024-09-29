import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilford_app/helpers/custom_colors.dart';
import 'package:ilford_app/ui/dashboard.dart';
import 'package:ilford_app/ui/requests_screen.dart';
import 'package:ilford_app/ui/settings_screen.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashbardScreen(),
    RequestScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 25.0,
              height: 25.0,
              colorFilter: ColorFilter.mode(
                  _selectedIndex == 0
                      ? CustomCOlors.primaryColor
                      : CustomCOlors.greyA3,
                  BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/requests.svg',
              width: 25.0,
              height: 25.0,
              colorFilter: ColorFilter.mode(
                  _selectedIndex == 1
                      ? CustomCOlors.primaryColor
                      : CustomCOlors.greyA3,
                  BlendMode.srcIn),
            ),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
              width: 25.0,
              height: 25.0,
              colorFilter: ColorFilter.mode(
                  _selectedIndex == 2
                      ? CustomCOlors.primaryColor
                      : CustomCOlors.greyA3,
                  BlendMode.srcIn),
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CustomCOlors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
