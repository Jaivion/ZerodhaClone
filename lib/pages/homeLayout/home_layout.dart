import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zerodhakite/homepage.dart';

class Homelayout extends StatefulWidget {
  //const Homelayout({Key? key}) : super(key: key);

  final AnimationController controller;
  const Homelayout({required this.controller});

  @override
  _HomelayoutState createState() => _HomelayoutState();
}

class _HomelayoutState extends State<Homelayout> {
  static const headerheight = 32.0;
  Animation<RelativeRect> getPannelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPannelHeight = height - headerheight;
    const frontPannelHeight = -headerheight;
    return RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                0.0, backPannelHeight, 0.0, frontPannelHeight),
            end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(
            CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }

  Widget bothPannels(BuildContext context, BoxConstraints constraints) {
    final ThemeData = Theme.of(context);

    return Container(
      child: Stack(
        children: [
          Container(
            child: const Center(
              child: Text("Back Pannel"),
            ),
          ),
          PositionedTransition(
            rect: getPannelAnimation(constraints),
            child: Material(
              child: Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Container(
                      height: headerheight,
                      child: Column(children: const [
                        // IconButton(
                        //     onPressed: () {
                        //       Homepage().controller.fling(
                        //           velocity: Homepage.isPannelVisible ? -1.0 : 1.0);
                        //     },
                        //     icon: AnimatedIcon(
                        //       icon: AnimatedIcons.close_menu,
                        //       progress: controller.view,
                        //     )),

                        Text("shop here"),
                        
                      ]),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: bothPannels);
  }
}
