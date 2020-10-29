import 'package:flutter/cupertino.dart';
import 'package:youtube_api/youtube_api.dart';

class ListItemWidget extends StatelessWidget {
  final YT_API result;

  @required
  const ListItemWidget({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.0),
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Image.network(
            result.thumbnail['default']['url'],
          ),
          Padding(padding: EdgeInsets.only(right: 20.0)),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text(
                  result.title,
                  softWrap: true,
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(padding: EdgeInsets.only(bottom: 1.5)),
                Text(
                  result.channelTitle,
                  softWrap: true,
                ),
                Padding(padding: EdgeInsets.only(bottom: 3.0)),
                Text(
                  result.url,
                  softWrap: true,
                ),
              ]))
        ],
      ),
    );
  }
}
