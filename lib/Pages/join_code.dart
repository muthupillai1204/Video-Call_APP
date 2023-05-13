import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc_app/Pages/video_call.dart';

class JoinCode extends StatefulWidget {
  const JoinCode({super.key});

  @override
  State<JoinCode> createState() => _JoinCodeState();
}

class _JoinCodeState extends State<JoinCode> {
  final TextEditingController _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                    "assets/images/join.gif",
                    fit: BoxFit.cover,
                    height: 300,
                    width: 350,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Center(
                  child: Text(
                    "Enter meeting code below",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _codeController,
                    decoration: InputDecoration(
                        hintText: "Example: 29ea75c0",
                        filled: true,
                        fillColor: const Color.fromARGB(255, 245, 237, 237),
                        labelText: "CODE",
                        prefixIcon: const Icon(Icons.code),
                        border: myInputBorder(),
                        enabledBorder: myInputBorder(),
                        focusedBorder: myFocusBorder()),
                    validator: (code) {
                      //validation for code
                      if (code!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (code.length <= 7) {
                        return "code length should be atleast 8";
                      } else if (code.length >= 9) {
                        return "code should not be greater than 8 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 40),
                        backgroundColor:
                            const Color.fromARGB(255, 100, 60, 211),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29.0)),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            debugPrint("validated ");
                            Get.to(VideoCall(
                              channelName: _codeController.text.trim(),
                            ));
                          } else {
                            debugPrint("Not validate");
                          }
                        });
                      },
                      child: const Text("Join")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder myInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 3,
    ),
  );
}

OutlineInputBorder myFocusBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
    borderSide: BorderSide(color: Color(0xffCB9999), width: 3),
  );
}
