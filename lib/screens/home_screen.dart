import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kaizen_be_better/layout/navigation_bar.dart';
import 'package:kaizen_be_better/screens/register_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Item {
  final String title;
  final IconData icon;

  Item({required this.title, required this.icon});
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  final autoSizeGroup = AutoSizeGroup();
  late int _menuIndex = 0;

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
          () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
          () => _borderRadiusAnimationController.forward(),
    );
  }

  void _updateMenuIndex(int index) {
    setState(() {
      _menuIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaizen: Be Better', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(18, 18, 40, 1),
      ),
      backgroundColor: const Color.fromRGBO(25, 25, 40, 1),
      body: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text('Task 1'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Task 2'),
                ),
              )
            ],
          ),),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text('Idea 1'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Idea 2'),
                ),
              )
            ],
          ),),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text('Notification 1'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Notification 2'),
                ),
              )
            ],
          ),),
        const Center(
          child: Text('About', style: TextStyle(color: Colors.white)),
        )
      ][_menuIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(18, 18, 40, 1),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterTaskScreen()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: KaizenNavigationBar(update: _updateMenuIndex)
    );
  }
}