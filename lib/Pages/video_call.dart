// import 'dart:convert';

// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

// import 'package:http/http.dart';

class VideoCall extends StatefulWidget {
  String channelName = "testt";
  VideoCall({super.key, required this.channelName});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  bool _loading = true;

  String tempToken = "";
  // AgoraClient? _client;

  Future<void> getToken() async {
    String link =
        "http://agora-node-tokenserver-3.esakkimuthupill.repl.co/access_token?channelName=testt";

    Response response = await get(Uri.parse(link));
    Map data = jsonDecode(response.body);
    debugPrint(data["token"]);
    setState(() {
      tempToken = data["token"];
    });

    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() => _loading = false));
  }

  final AgoraClient _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: "3ec81c1fdb23443ba1805f93d4c51c03",
          channelName: "testt",
          tokenUrl:
              "http://agora-node-tokenserver-3.esakkimuthupill.repl.co/access_token?channelName=testt"),
      enabledPermission: [Permission.camera, Permission.microphone]);

  @override
  void initState() {
    super.initState();
    getToken();
    initAgora();
  }

  Future<void> initAgora() async {
    await _client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SafeArea(
              child: _loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: [
                        AgoraVideoViewer(
                          client: _client,
                          layoutType: Layout.floating,
                          enableHostControls: true,
                          showAVState: true,
                          showNumberOfUsers: true,
                          floatingLayoutContainerHeight: 200,
                          floatingLayoutContainerWidth: 300,
                          floatingLayoutMainViewPadding:
                              const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          floatingLayoutSubViewPadding:
                              const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          disabledVideoWidget: Container(
                            color: Colors.blueGrey,
                            child: const Center(
                                child: Text(
                              "Disabled screen!",
                              style: TextStyle(fontSize: 17),
                            )),
                          ),
                        ),
                        AgoraVideoButtons(client: _client)
                      ],
                    ))),
    );
  }
}


// https://agora-node-tokenserver-3.esakkimuthupill.repl.co/access_token?channelName=testt