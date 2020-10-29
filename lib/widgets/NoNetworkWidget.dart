import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoNetworkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        Icon(
          Icons.signal_cellular_null,
          size: 50,
          color: Colors.red,
        ),
        SizedBox(width: 16),
        Text(
          "No Internet Connection",
          style: TextStyle(fontSize: 25),
        )
      ],
    );
  }
}
