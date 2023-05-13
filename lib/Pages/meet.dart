import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:vc_app/Pages/video_call.dart';

class Meet extends StatefulWidget {
  const Meet({super.key});

  @override
  State<Meet> createState() => _MeetState();
}

class _MeetState extends State<Meet> {
  // String  _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _meetingCode = "abcdfgqw";
  @override
  void initState() {
    var uuid = const Uuid();
    _meetingCode = uuid.v1().substring(0, 8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: Get.back,
                    child: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 35,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/meet.gif",
                    // fit: BoxFit.cover,
                    height: 300,
                    width: 350,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Center(
                  child: Text(
                    "Your meeting is ready",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.link),
                      title: SelectableText(
                        enableInteractiveSelection: true,
                        _meetingCode,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      trailing: IconButton(
                        // iconSize: 50,
                        // color: Colors.blue,
                        onPressed: () {
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text('Icon button is pressed')));

                          setState(() {
                            final value = ClipboardData(text: _meetingCode);
                            Clipboard.setData(value);
                          });
                        },
                        icon: const Icon(
                          Icons.copy,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Share.share("Meeting Code: $_meetingCode");
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Share invite",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 50),
                      backgroundColor: const Color.fromARGB(255, 101, 120, 230),
                      foregroundColor: Colors.orange,
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(VideoCall(channelName: _meetingCode.trim()));
                    },
                    icon: const Icon(Icons.video_call, color: Colors.white),
                    label: const Text(
                      "Start Call",
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 120, 230),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 101, 120, 230),
                          width: 2.0),
                      foregroundColor: Colors.orange,
                      minimumSize: const Size(350, 50),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
