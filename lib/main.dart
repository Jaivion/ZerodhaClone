import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zerodhakite/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Homepage())));
  }
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        //'/login': (context) => const LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/homeScreen': (context) => const Homepage(),
        //'/drawerScreen': (context) =>  CustomDrawer(),
      },
      home: Material(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xfff9f9f9),
            // image: DecorationImage(
            //   image: ExactAssetImage('assets/images/splashscreen.png'),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              //Image.asset('assets/images/splashscreen.png', fit: BoxFit.cover),
              Positioned(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey,
                        child: const Text("Logo"),
                      ),
                      // Image.asset(
                      //   'assets/icons/main_logo.png',
                      //   height: 100,
                      //   width: 100,
                        //width: MediaQuery.of(context).size.width,
                        // fit: BoxFit.cover,
                      //),
                     const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Zerodha",
                            style: TextStyle(
                                fontSize: 37.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: null,
                                color: Colors.grey[200]),
                          ),
                          
                        ],
                      ),
                    //  const Text(
                    //     "STYLE THAT FIT IN YOUR LIFE STYLE",
                    //     style: TextStyle(
                    //         fontSize: 12.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white70),
                    //   ),
                      // SizedBox(
                      //   height: 100,
                      // ),
                      // SizedBox(
                      //   height: 100,
                      // ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    5,
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      "-> Zerodha",
                      style: TextStyle(
                          fontSize: 12.0,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                  ),
                ),
              ),
              //child: Image.asset('assets/icons/main_logo.png'),
            ],
          ),
        ),
      ),
    );
    //Image.asset('assets/images/splashscreen.png', fit: BoxFit.cover),
  }
  
}
