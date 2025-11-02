// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:My_App/led.dart';
import 'package:My_App/door.dart';
import 'package:My_App/motion.dart';
import 'package:My_App/temp.dart';
import 'package:My_App/auto.dart';
import 'package:My_App/heat.dart';
import 'package:My_App/camera.dart';
// ######################################## Temperature from FireBase
import 'package:My_App/temp2_firebase.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  // );

  // final platform = Platform.operatingSystem;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // void led(BuildContext context, String title) {
  //   // Navigator.push(context, MaterialPageRoute(builder: (_) {
  //   //   return const Led(title: 'Led Control',);
  //   // }));
  //
  //   Navigator.pushNamed(context, '/led', arguments: {
  //     title: 'Led Control',
  //   });
  // }
  // void door(BuildContext context) {
  //   // Navigator.push(context, MaterialPageRoute(builder: (_) {
  //   //   return const Door();
  //   // }));
  //
  //   Navigator.pushNamed(context, '/door', arguments: {
  //     'title': 'Door Control',
  //   });
  //
  // }
  // void motion(BuildContext context) {
  //   // Navigator.push(context, MaterialPageRoute(builder: (_) {
  //   //   return const Motion();
  //   // }));
  //
  //   Navigator.pushNamed(context, '/motion', arguments: {
  //     'title': 'Motion Control',
  //   });
  // }
  // void temp(BuildContext context) {
  //   // Navigator.push(context, MaterialPageRoute(builder: (_) {
  //   //   return const Temp();
  //   // }));
  //
  //   Navigator.pushNamed(context, '/temp', arguments: {
  //     'title': 'Temperature Control',
  //   });
  // }
  // void auto(BuildContext context) {
  //   // Navigator.push(context, MaterialPageRoute(builder: (_) {
  //   //   return const Auto();
  //   // }));
  //
  //   Navigator.pushNamed(context, '/auto', arguments: {
  //     'title': 'Automation Control',
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KAFOLAT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Home(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    //   routes: {
    //       '/': (context) => const Home(),
    //       '/led': (context) => const Led(title: 'Led Control',),
    //       '/door': (context) => const Door(),
    //       '/motion': (context) => const Motion(),
    //       '/temp': (context) => const Temp(),
    //       '/auto': (context) => const Auto(),
    // },
      routes: {
        Home.routeName: (context) => const Home(),
        Led.routeName: (context) => const Led(title: 'Led Control'),
        Door.routeName: (context) => const Door(),
        Heat.routeName: (context) => const Heat(),
        Motion.routeName: (context) => const Motion(),
        Camera.routeName: (context) => const Camera(),
        Temp.routeName: (context) => const Temp(),
        Auto.routeName: (context) => const Auto(),
        // ######################################## Temperature from FireBase
        Temp2_FireBase.routeName: (context) => const Temp2_FireBase(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  static const String routeName = '/';

  void led(BuildContext context, String title) {
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return const Led(title: 'Led Control',);
    // }));

    Navigator.pushNamed(context, Led.routeName, arguments: {
      title: 'Led Control',
    });
  }
  void door(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return const Door();
    // }));

    Navigator.pushNamed(context, Door.routeName, arguments: {
      'title': 'Door Control',
    });

  }
  void heat(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return const Heat();
    // }));

    Navigator.pushNamed(context, Heat.routeName, arguments: {
      'title': 'Heat Control',
    });

  }
  void motion(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return const Motion();
    // }));

    Navigator.pushNamed(context, Motion.routeName, arguments: {
      'title': 'Motion Control',
    });
  }
  void camera(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return const Camera();
    // }));

    Navigator.pushNamed(context, Camera.routeName, arguments: {
      'title': 'Door Control',
    });

  }
  void temp(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return const Temp();
    // }));

    Navigator.pushNamed(context, Temp.routeName, arguments: {
      'title': 'Temperature Control',
    });
  }
  void auto(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return const Auto();
    // }));

    Navigator.pushNamed(context, Auto.routeName, arguments: {
      'title': 'Automation Control',
    });
  }
  // ######################################## Temperature from FireBase
  void temp2_firebase(BuildContext context) {
  // Navigator.push(context, MaterialPageRoute(builder: (_) {
  //   return const Temp();
  // }));

  Navigator.pushNamed(context, Temp2_FireBase.routeName, arguments: {
  'title': 'Temperature from FireBase',
  });
  }


  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('KAFOLAT'),
      ),
      backgroundColor: Colors.grey,
      // body: isPortrait ? ListView.builder(
      //   itemBuilder: (BuildContext context, int index) {
      body: isPortrait ? ListView(
        children: [
          Column(
              children: [Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'H O M E',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                led(context, 'Led Control');
                              },
                              child: const Text(
                                'light',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                door(context);
                              },
                              child: const Text(
                                'door',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10,),
                            child: ElevatedButton(
                              onPressed: () {
                                heat(context);
                              },
                              child: const Text(
                                'heat',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,),
                            child: ElevatedButton(
                              onPressed: () {
                                motion(context);
                              },
                              child: const Text(
                                'motion',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 26.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              camera(context);
                            },
                            child: const Text(
                              'camera',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            temp(context);
                          },
                          child: const Text(
                            'temperature',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 26.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              auto(context);
                            },
                            child: const Text(
                              'automation',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
                Column(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.37,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 1,
                  ),
                ])
              ]),
    ],) : ListView(
      children:<Widget> [ Column(
            children: <Widget> [
              Row(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 0.5,

                    child: Column(
                          children: <Widget>[
                            const SizedBox(height: 20),
                            const Center(
                              child: Text(
                                'H O M E',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          led(context, 'Led Control');
                                        },
                                        child: const Text(
                                          'light',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          door(context);
                                        },
                                        child: const Text(
                                          'door',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10,),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          heat(context);
                                        },
                                        child: const Text(
                                          'heat',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10,),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          motion(context);
                                        },
                                        child: const Text(
                                          'motion',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 26.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        camera(context);
                                      },
                                      child: const Text(
                                        'camera',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      temp(context);
                                    },
                                    child: const Text(
                                      'temperature',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 26.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        auto(context);
                                      },
                                      child: const Text(
                                        'automation',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // #################### (Temperature from FireBase)
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      temp2_firebase(context);
                                    },
                                    child: const Text(
                                      'temperature',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 26.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              ),
                            ),
                            // ####################

                          ],),
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                      ],),
              // Row(
              //   children: <Widget>[
              //     Container(
              //       color: Colors.grey,
              //       height: MediaQuery.of(context).size.height * 0.42,
              //       width: MediaQuery.of(context).size.width * 1,
              //     ),
              //
              //   ],),

          ],),
    ]),
        );
  }
}
