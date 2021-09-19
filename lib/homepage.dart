import 'package:flutter/material.dart';
import 'package:zerodhakite/pages/apps/apps.dart';
import 'package:zerodhakite/pages/homeLayout/home_layout.dart';
import 'package:zerodhakite/pages/orders/orders.dart';
import 'package:zerodhakite/pages/positions/positions.dart';
import 'package:zerodhakite/pages/profile/profile.dart';
import 'package:zerodhakite/pages/watchlist/watchlist.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
 late AnimationController controller;

  // static const headerheight = 32.0;
  
  // int _currentIndex = 0;
  // final tabs = const [
  //   Watchlist(),
  //   Orders(),
  //   Positions(),
  //   Apps(),
  //   Profile(),
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

bool get isPannelVisible{
  final AnimationStatus status = controller.status;
  return status == AnimationStatus.completed || status == AnimationStatus.forward;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Backdrop"),
        elevation: 0.0,
        leading: IconButton( onPressed: () {controller.fling(velocity: isPannelVisible ? -1.0 : 1.0);}, icon: AnimatedIcon(icon: AnimatedIcons.close_menu,progress: controller.view,)),
      ),
      body: Homelayout(controller: controller),
    );
  }
}
