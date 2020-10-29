import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ytapi/youtubeicon_icons.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        Icon(
          Youtubeicon.youtube,
          size: 50,
          color: Colors.red,
        ),
        SizedBox(width: 16),
        Text(
          "Type To Search Youtube",
          style: TextStyle(fontSize: 25),
        )
      ],
    );
  }
}
