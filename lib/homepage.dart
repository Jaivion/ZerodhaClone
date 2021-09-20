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

  static const headerheight = 450.0;
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: const Color(0xfff9f9f9),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Overview",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700])),
                        IconButton(
                          iconSize: 32,
                          color: Colors.grey[700],
                          icon: const Icon(Icons.close),
                          onPressed: onClick,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "NIFTY 50",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "17426.80",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "+125.35",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "+1.07%",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                ],
                              ),
                              Text(
                                "Charts",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.grey[200]),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "NIFTY BANK",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "371426.80",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "+666.35",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "+1.76%",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                ],
                              ),
                              Text(
                                "Charts",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.grey[200]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "* Charts indicate 52 weeks trend",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Container(
                          height: 1,
                          color: Colors.grey[300],
                          width: size.width * 0.9,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Funds",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Equity",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "11,12,586.70",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
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
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: buttonclicked ? Colors.black45 : Colors.white,
                        offset: const Offset(5.0, 5.0),
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                      ),
                    ],
                  ),
                  //color: Colors.green,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(children: [
                            IconButton(
                                onPressed: onClick,
                                icon: buttonclicked
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
