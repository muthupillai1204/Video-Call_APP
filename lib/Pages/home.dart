import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:vc_app/Pages/meet.dart';

import 'join_code.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("ALert"),
                content: const Text("Do you want to exit?"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text("No")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text("Yes"))
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 168, 130, 175),
          shadowColor: const Color.fromARGB(255, 55, 0, 255),
          title: const Text("Video Caller"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 48.0,
              ),
              Center(
                child: Image.asset(
                  "assets/images/home.gif",
                  fit: BoxFit.cover,
                  height: 310,
                  width: 360,
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 59),
                  backgroundColor: const Color.fromARGB(255, 188, 60, 211),
                  foregroundColor: Colors.orange,
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.0)),
                ),
                onPressed: () {
                  Get.to(const Meet());
                },
                child: const Text(
                  "+  New meeting",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                      color: Color.fromARGB(255, 188, 60, 211), width: 2.0),
                  foregroundColor: Colors.orange,
                  minimumSize: const Size(250, 59),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.0)),
                ),
                onPressed: () {
                  setState(() {
                    Get.to(const JoinCode());
                  });
                },
                child: const Text(
                  "🔒 Join with a code",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 188, 60, 211),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                "Develop by EMP",
                style: TextStyle(
                    color: Color.fromARGB(255, 109, 108, 108), fontSize: 12.0),
              )
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          backgroundColor: const Color.fromARGB(255, 87, 85, 85),
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              backgroundColor: Colors.greenAccent,
              child: const Icon(Icons.record_voice_over),
              label: "Call recording",
              // onTap: () => Navigator.pushNamed(context, MyRoutes.aLogin),
            ),
            SpeedDialChild(
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.screen_share),
              label: "Screen sharing ",
              // onTap: () => Navigator.pushNamed(context, MyRoutes.help),
            ),
            SpeedDialChild(
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.spatial_audio),
              label: "Audio and video",
              // onTap: () => Navigator.pushNamed(context, MyRoutes.help),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
