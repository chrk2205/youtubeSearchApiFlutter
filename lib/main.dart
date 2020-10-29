import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:ytapi/enum/ConnectivityStatus.dart';
import 'package:ytapi/services/connectivityServices.dart';
import 'package:ytapi/widgets/NoNetworkWidget.dart';
import 'package:ytapi/widgets/listItemWidget.dart';
import 'package:ytapi/widgets/loadingWidget.dart';
import 'package:ytapi/widgets/searchbarWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  static String key = "AIzaSyCg6th88G80kXkJWb2ekjTI_yoxAj_iThM";
  bool isLoading = true;
  bool isConnected = true;
  TextEditingController controller;
  ConnectivityServices connectivityServices;

  YoutubeAPI ytApi = YoutubeAPI(key);
  List<YT_API> ytResult = [];

  callAPI(String query) async {
    ytResult = await ytApi.search(query);
    ytResult = await ytApi.nextPage();
    setState(() {
      isLoading = false;
    });
  }

  onTextChanged(String s) {
    int n = s.length;
    if (!s.endsWith(" ") && n > 2) {
      callAPI(s);
    } else if (n < 2) {
      setState(() {
        isLoading = true;
      });
    }
  }

  onNetworkChanged(ConnectivityStatus connectivityStatus) {
    if (connectivityStatus == ConnectivityStatus.Offline && isConnected) {
      setState(() {
        isConnected = false;
      });
    } else if (connectivityStatus == ConnectivityStatus.Online &&
        !isConnected) {
      setState(() {
        isConnected = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    controller = new TextEditingController();
    connectivityServices = new ConnectivityServices(onNetworkChanged);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Column(
        children: [
          SearchBarWidget(controller: controller, onChanged: onTextChanged),
          isConnected
              ? (isLoading
                  ? LoadingWidget()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: ytResult.length,
                        itemBuilder: (_, int index) =>
                            ListItemWidget(result: ytResult[index]),
                      ),
                    ))
              : NoNetworkWidget()
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
