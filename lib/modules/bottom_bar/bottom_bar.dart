import 'package:flutter/material.dart';
import 'package:softech/home/activity_feed.dart';
import 'package:softech/modules/events/events_view.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<CustomBottomBar> {

  List<Widget> screens = [ActivityPage(), Text('search'), EventsView(), Text('add'), Text('live'), Text('profile')];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (val){
          setState(() {
            currentIndex = val;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blueGrey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.blueGrey),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.blueGrey),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, color: Colors.blueGrey),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call, color: Colors.blueGrey),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blueGrey),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0xFF1D1A3D),
      ),
      body: SafeArea(
        child: screens[currentIndex],
      )
    );
  }
}
