import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  bool buttonclicked = false;

  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool get isPannelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  //------------------------------------------

  static const headerheight = 500.0;
  Animation<RelativeRect> getPannelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPannelHeight = height - headerheight;
    const frontPannelHeight = -headerheight;
    return RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                0.0, backPannelHeight, 0.0, frontPannelHeight),
            end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
  }

  //mycode-------------
  void onClick() {
    controller.fling(velocity: isPannelVisible ? -1.0 : 1.0);
    setState(() {
      buttonclicked ? (buttonclicked = false) : (buttonclicked = true);
    });
  }

  Widget bothPannels(BuildContext context, BoxConstraints constraints) {
    final ThemeData = Theme.of(context);
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Center(
              child: Container(
                child: Column(
                  children: [
                    const Text("Back Pannel"),
                    ElevatedButton(
                        onPressed: onClick, child: const Icon(Icons.close)),
                  ],
                ),
              ),
            ),
            PositionedTransition(
              rect: getPannelAnimation(constraints),
              child: Material(
                child: Container(
                  height: size.height,
                  width: size.width,
                  color: Colors.green,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(children: [
                            ElevatedButton(
                                onPressed: onClick,
                                child: buttonclicked
                                    ? const Icon(Icons.arrow_upward)
                                    : const Icon(Icons.arrow_downward)),
                            const Text("touch here"),
                          ]),
                        ),
                      ),
                      const Expanded(
                          child: Center(
                        child: Text("Front Pannel"),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//var size = MediaQuery.of(context).size;

    return Scaffold(
      body: LayoutBuilder(builder: bothPannels),
    );
  }
}
