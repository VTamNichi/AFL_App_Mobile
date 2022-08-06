import 'dart:ui';

import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/match_detail_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/models/TeamInMatch.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LivestreamScreen extends StatefulWidget {
  final bool isLivestream;

  const LivestreamScreen({Key? key, required this.isLivestream})
      : super(key: key);

  @override
  _LivestreamScreenState createState() => _LivestreamScreenState();
}

class _LivestreamScreenState extends State<LivestreamScreen> {
  final _users = <int>[];
  late RtcEngine _engine;
  bool muted = false;
  bool fullscreen = false;
  int streamId = 0;

  final matchController = Get.put(MatchController());
  final userController = Get.put(UserController());

  final ScrollController _scrollController = ScrollController();
  TextEditingController textCommentLiveController = TextEditingController();

  @override
  void dispose() {
    // clear users
    _users.clear();
    // destroy sdk and leave channel
    _engine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.animateTo(
      0.0,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
    );
    // initialize agora sdk
    initializeAgora();
  }

  Future<void> initializeAgora() async {
    await _initAgoraRtcEngine();
    var strId = await _engine.createDataStream(false, false);
    if (widget.isLivestream) streamId = strId!;

    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        setState(() {
          print('onJoinChannel: $channel, uid: $uid');
        });
      },
      leaveChannel: (stats) {
        setState(() {
          print('onLeaveChannel');
          _users.clear();
        });
      },
      userJoined: (uid, elapsed) {
        setState(() {
          print('userJoined: $uid');

          _users.add(uid);
        });
      },
      userOffline: (uid, elapsed) {
        setState(() {
          print('userOffline: $uid');
          _users.remove(uid);
        });
      },
      streamMessage: (_, __, message) {
        final String info = "here is the message $message";
        print(info);
      },
      streamMessageError: (_, __, error, ___, ____) {
        final String info = "here is the error $error";
        print(info);
      },
    ));

    await _engine.joinChannel(
        matchController.matchDetail.value.tokenLivestream,
        "MATCH_" + matchController.matchDetail.value.id.toString(),
        userController.user.value.username,
        userController.user.value.id!);
  }

  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.createWithConfig(RtcEngineConfig(appId));
    await _engine.enableVideo();

    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    if (widget.isLivestream) {
      await _engine.setClientRole(ClientRole.Broadcaster);
    } else {
      await _engine.setClientRole(ClientRole.Audience);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    TeamInMatchController teamInMatchController =
        Get.put(TeamInMatchController());
    Size size = MediaQuery.of(context).size;
    if (size.height < size.width) {
      fullscreen = true;
    } else {
      fullscreen = false;
    }
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Stack(
              children: <Widget>[
                widget.isLivestream || fullscreen ? Container() : _comment(),
                widget.isLivestream
                    ? _broadcastView()
                    : SizedBox(
                        height: fullscreen ? size.height : size.height * 0.4,
                        child: Stack(
                          children: [
                            _broadcastView(),
                            Obx(() => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container()),
                                    Container(
                                      padding: EdgeInsets.all(kPadding / 6),
                                      decoration: BoxDecoration(
                                        color: kGreenLightColor,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(kPadding),
                                            bottomRight: Radius.circular(kPadding)),
                                      ),
                                      child: Text(
                                        teamInMatchController
                                            .teamInMatchDetail1.value.teamName!,
                                        style: TextStyle(
                                            color: kWhiteComment,
                                            fontSize: kPadding / 3 * 2),
                                      ),
                                    ),
                                    SizedBox(
                                      width: kPadding / 3,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(kPadding / 6),
                                      child: Text(
                                        teamInMatchController
                                            .teamInMatchDetail1.value.teamScore
                                            .toString(),
                                        style: TextStyle(
                                            color: kWhiteComment,
                                            fontSize: kPadding / 3 * 2),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(kPadding / 6),
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                            color: kWhiteComment,
                                            fontSize: kPadding / 3 * 2),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(kPadding / 6),
                                      child: Text(
                                        teamInMatchController
                                            .teamInMatchDetail2.value.teamScore
                                            .toString(),
                                        style: TextStyle(
                                            color: kWhiteComment,
                                            fontSize: kPadding / 3 * 2),
                                      ),
                                    ),
                                    SizedBox(
                                      width: kPadding / 3,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(kPadding / 6),
                                      decoration: BoxDecoration(
                                        color: kGreenLightColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(kPadding),
                                            bottomLeft: Radius.circular(kPadding)),
                                      ),
                                      child: Text(
                                        teamInMatchController
                                            .teamInMatchDetail2.value.teamName!,
                                        style: TextStyle(
                                            color: kWhiteComment,
                                            fontSize: kPadding / 3 * 2),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                ),
                            ),
                          ],
                        ),
                      ),
                widget.isLivestream
                    ? Container()
                    : Positioned(
                        top: fullscreen ? size.height * 0.8 : size.height * 0.33,
                        left: fullscreen ? size.width * 0.9 : size.width * 0.8,
                        child: RawMaterialButton(
                          onPressed: _onToggleFullscreen,
                          child: Icon(
                            fullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                _toolbar(),
              ],
            ),
          ),
        ),
    );
  }

  Widget _toolbar() {
    return widget.isLivestream
        ? Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: _onToggleMute,
                  child: Icon(
                    muted ? Icons.mic_off : Icons.mic,
                    color: muted ? Colors.white : Colors.blueAccent,
                    size: 20.0,
                  ),
                  shape: const CircleBorder(),
                  elevation: 2.0,
                  fillColor: muted ? Colors.blueAccent : Colors.white,
                  padding: const EdgeInsets.all(12.0),
                ),
                RawMaterialButton(
                  onPressed: () => _onCallEnd(context),
                  child: const Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  shape: const CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.redAccent,
                  padding: const EdgeInsets.all(15.0),
                ),
                RawMaterialButton(
                  onPressed: _onSwitchCamera,
                  child: const Icon(
                    Icons.switch_camera,
                    color: Colors.blueAccent,
                    size: 20.0,
                  ),
                  shape: const CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(12.0),
                ),
              ],
            ),
          )
        : Container();
  }

  Widget _comment() {
    Size size = MediaQuery.of(context).size;
    final matchDetailController = Get.put(MatchDetailController());
    return Obx(
      () => SingleChildScrollView(
        child: Container(
          width: size.width,
          margin: EdgeInsets.only(top: size.height * 0.4),
          color: kBlueBlack,
          padding: EdgeInsets.fromLTRB(kPadding / 2, 0, 0, 0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.5,
                child: SingleChildScrollView(
                  reverse: true,
                  controller: _scrollController,
                  child: Column(
                    children: matchDetailController.listCommentLive
                        .map(
                          (comment) => Container(
                            width: double.infinity,
                            height: 100,
                            color: kBlueBlack,
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image(
                                    image: NetworkImage(
                                        comment.avatar!.removeAllWhitespace),
                                    width: 70,
                                    height: 70,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      "assets/images/default_avatar.png",
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: kPadding / 2,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment.username.toString(),
                                        style: TextStyle(
                                          color: kWhiteText,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        comment.room.toString(),
                                        style: TextStyle(
                                          color: kWhiteText,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: size.height * 0.06,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      kPadding / 3, 0, kPadding / 3, kPadding / 3),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: size.width * 0.65,
                        decoration: BoxDecoration(
                          color: kWhiteComment,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: textCommentLiveController,
                          decoration: InputDecoration(
                            hintText: "Viết bình luận",
                            hintStyle: TextStyle(color: kGreyColor),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kGreenLightColor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        width: kPadding / 2,
                      ),
                      Container(
                        height: 45,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (textCommentLiveController.text.isNotEmpty) {
                              await matchDetailController.sendCommentLivestream(
                                  textCommentLiveController.text);
                              textCommentLiveController =
                                  TextEditingController();
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  kGreenLightColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ))),
                          child: Text(
                            "Gửi",
                            style: TextStyle(color: kWhiteText, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    if (widget.isLivestream) {
      list.add(const RtcLocalView.SurfaceView());
    }
    print("userrrrrr: " + _users.length.toString());
    _users.forEach((int uid) {
      if (uid.toString() == matchController.idScreen.value) {
        list.add(RtcRemoteView.SurfaceView(
              uid: uid,
              channelId: "MATCH_" + matchController.matchDetail.value.id.toString(),
            ),
        );
      }
    });

    
    return list;
  }

  /// Video view row wrapper
  Widget _expandedVideoView(List<Widget> views) {
    final wrappedViews = views
        .map<Widget>((view) => Expanded(child: Container(child: view)))
        .toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _broadcastView() {
    final views = _getRenderViews();
    // return Column(
    //       children: <Widget>[
    //         _expandedVideoView([views[0]]),
    //       ],
    //     );
    switch (views.length) {
      case 1:
        return Column(
          children: <Widget>[
            _expandedVideoView([views[0]]),
          ],
        );
      case 2:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView([views[0]]),
            _expandedVideoView([views[1]])
          ],
        ));
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView(views.sublist(0, 2)),
            _expandedVideoView(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView(views.sublist(0, 2)),
            _expandedVideoView(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container(); 
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onToggleFullscreen() {
    setState(() {
      fullscreen = !fullscreen;
    });
    if (fullscreen) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }
}
