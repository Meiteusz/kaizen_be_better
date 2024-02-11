import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final List<Item> itemList = [
    Item(title: 'Tarefas', icon: Icons.task),
    Item(title: 'Ideias', icon: Icons.lightbulb),
    Item(title: 'Alertas', icon: Icons.notifications),
    Item(title: 'Sobre', icon: Icons.info),
  ];

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
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
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
      ][_bottomNavIndex],
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
          // add task
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: itemList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive
              ? Colors.blueAccent
              : Colors.white;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                itemList[index].icon,
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  itemList[index].title,
                  maxLines: 1,
                  style: TextStyle(color: color),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        backgroundColor: const Color.fromRGBO(18, 18, 40, 1),
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        hideAnimationController: _hideBottomBarAnimationController,
        shadow: const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 3,
          color: Colors.white,
        ),
      ),
    );
  }
}