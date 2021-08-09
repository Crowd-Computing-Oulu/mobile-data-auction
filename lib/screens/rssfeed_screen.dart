import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

class RssFeedScreen extends StatefulWidget {
  @override
  RssFeedState createState() => RssFeedState();
}

class RssFeedState extends State<RssFeedScreen> {
  static const FEED_URL = "https://hnrss.org/jobs";
  RssFeed _feed;
  String _title;

  GlobalKey<RefreshIndicatorState> _refreshKey;

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      return;
    }
  }

  load() async {
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) return;
      updateFeed(result);
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(FEED_URL);
      return RssFeed.parse(response.body);
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    load();
  }

  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  body() {
    return isFeedEmpty()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            child: list(),
            onRefresh: () => load(),
            key: _refreshKey
        );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('RSS Feed'),
          backgroundColor: Color(0xff000000),
          brightness: Brightness.dark,
        ),
      body: body(),
    );
  }

  list() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
            child: Container(
              child: ListView.separated(
                itemCount: _feed.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _feed.items[index];
                    return Container(
                      child: ListTile(
                        title: title(item.title),
                        subtitle: subtitle(item.pubDate),
                        trailing: rightIcon(),
                        contentPadding: EdgeInsets.all(10.0),
                        onTap: () => openFeed(item.link),
                      ),
                    );
                  },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
        ),
      ],
    );
  }

  title(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  subtitle(subtitle) {
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w300
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.grey,
      size: 30.0,
    );
  }

  // BoxDecoration customBoxDecoration() {
  //   return BoxDecoration(
  //     border: Border.all(
  //       color: Colors.grey,
  //       width: 1.0,
  //     ),
  //   );
  // }

}