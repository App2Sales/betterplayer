import 'package:better_player/better_player.dart';
import 'package:better_player_example/constants.dart';
import 'package:flutter/material.dart';

class NotificationPlayerPage extends StatefulWidget {
  @override
  _NotificationPlayerPageState createState() => _NotificationPlayerPageState();
}

class _NotificationPlayerPageState extends State<NotificationPlayerPage> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      handleLifecycle: true,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _setupDataSource();
    super.initState();
  }

  void _setupDataSource() async {
    // String imageUrl = await Utils.getFileUrl(Constants.logo);
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      'https://cdn-us1.scaleplay.com.br/8a3ba885-1574-48af-ac30-3a2cf3e5a5c5/e2/5d/f6/video/e25df600-f018-4e10-86cd-bc296b0f9918.m3u8',
      //Constants.elephantDreamVideoUrl,
      notificationConfiguration: BetterPlayerNotificationConfiguration(
        showNotification: true,
        title: "Elephant dream",
        author: "Some author",
        imageUrl: Constants.catImageUrl,
      ),
    );
    _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification player"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Click play on player to show notification in status bar.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
        ],
      ),
    );
  }
}
