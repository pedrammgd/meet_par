import 'package:flutter/material.dart';
import 'package:meet_par/resources/auth_methods.dart';
import 'package:meet_par/screens/help_screen.dart';
import 'package:meet_par/screens/history_meeting_screen.dart';
import 'package:meet_par/screens/meeting_screen.dart';
import 'package:meet_par/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onLogOut() async {
    AuthMethods().signOut();
    Navigator.pushNamed(context, '/login');
  }

  int _Page = 0;
  onPageChanged(int Page) {
    setState(() {
      _Page = Page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    HelpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meetify'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: onLogOut,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Icon(
                  Icons.logout_outlined,
                  color: buttonColor,
                )),
          )
        ],
      ),
      body: pages[_Page],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: buttonColor,
          unselectedItemColor: Colors.white,
          onTap: onPageChanged,
          currentIndex: _Page,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: 'Meetings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              label: 'Help',
            ),
          ]),
    );
  }
}
