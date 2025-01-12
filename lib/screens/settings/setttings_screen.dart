
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../env/.env.dart';
import 'about.dart';
import 'donate_data.dart';


class SettingsScreen extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<SettingsScreen> {
  var url = 'https://docs.google.com/forms/d/e/1FAIpQLSfoQPG89pO_YrFOBUXzglEmGKv9AbdtWCdLInW3ZQ1-juLV2g/viewform?usp=pp_url&entry.244517143=';

  String? appId;
  String? oneSignalPlayerId;
  String? time;

  @override
  void initState() {
    super.initState();
    getId();
    getSelectedTime();
  }

  void showSnackBar(BuildContext context, String? value) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text("Notification time updated to $value"),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    ));
  }


  Widget donateData() => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: ListTile(
            title: Text("How to donate your Oura data"),
            subtitle: Text("Contribute your Oura data to our ongoing research. Click here to see how (approx. 1-3 minutes).", style: TextStyle(fontSize: 12.0)),
            // leading: Icon(Icons.arrow_right_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DonateDataScreen()));
            },
          ),
        ),
      ],
    ),
  );





  Widget notificationTime(BuildContext context) => Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: ListTile(
            title: Text("Daily survey reminder time"),
            subtitle: Text("Configure the time to receive your daily survey invitation", style: TextStyle(fontSize: 12.0)),
            // leading: Icon(Icons.language),
            trailing:  DropdownButton<String>(
              value: this.time,
              onChanged: (String? newValue) async {
                setState(() {
                  this.time = newValue;
                });
                saveSelectedTime(newValue!);
                var res = await saveNotificationTimeOnBackend(newValue.substring(0, 2), appId);
                if (res.statusCode == 200) {
                  this.showSnackBar(context, newValue);
                }
              },
              items: <String>['06:00', '07:00', '08:00', '09:00', '10:00', '11:00']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),// Text("Select time"),
          ),
        ),
      ],
    ),
  );

  Widget aboutUs() => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: ListTile(
            title: Text("About this app"),
            subtitle: Text("Get to know what this LBP app is all about", style: TextStyle(fontSize: 12.0)),
            // leading: Icon(Icons.people_rounded),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
            },
          ),
        ),
      ],
    ),
  );

  Widget otherStudies() => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: ListTile(
            title: Text("See our other studies"),
            subtitle: Text("Check out other studies we are running that may interest you", style: TextStyle(fontSize: 12.0)),
            // leading: Icon(Icons.app_registration),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              launch(
                  "https://crowdcomputing.net",
                  forceWebView: true,
                  forceSafariVC: true,
                  enableJavaScript: true
              );
            },
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black,
        // systemOverlayStyle: SystemUiOverlayStyle.dark,
        brightness: Brightness.dark,
      ),
      body: Builder(
        builder: (context) => Card(
          margin: EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                notificationTime(context),
                SizedBox(height: 10),
                aboutUs(),
                SizedBox(height: 10),
                otherStudies()
              ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<http.Response> saveNotificationTimeOnBackend(String time, String? appId)  async {
    var now = DateTime.now();
    var d = DateTime(now.year, now.month, now.day, int.parse(time)).toUtc();
    time = DateFormat("HH").format(d);
    final response = await http.put(
      Uri.parse('${environment['remote_url']}/api/users/$appId/segment'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: time,
    );
    if(!response.statusCode.toString().startsWith("2")) return showDialog(context, time, appId);
    else return response;
  }

  showDialog(BuildContext context, String time, String? appId) {
    showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) =>
            CupertinoAlertDialog(
              title: Text("Could not save new time"),
              content: Text(
                  "There was an error saving your data."),
              actions: [
                CupertinoDialogAction(
                    child: Text("Dismiss"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                CupertinoDialogAction(
                    child: Text("Try again"),
                    onPressed: () {
                      saveNotificationTimeOnBackend(time, appId);
                    }),
              ],
            ));
  }

  void saveSelectedTime(String time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('segment', time);
  }

  getSelectedTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var setTime = prefs.getString('segment');
    if (setTime == null || setTime.isEmpty) {
      setTime = "07:00";
    }
    setState(() {
      time = setTime;
    });
    return setTime;
  }

  Future<String?> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('app_id');
    setState(() {
      appId = id;
    });
    return id;
  }
}

