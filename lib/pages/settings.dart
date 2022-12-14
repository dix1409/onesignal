import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notificationIsWork = false;
  bool wifiOnyIsWork = false;

  void getSettingsData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs != null) {
      notificationIsWork = (await prefs.getBool("notification"))!;
      wifiOnyIsWork = (await prefs.getBool("wifi"))!;
      setState(() {
      });
    }
  }

  @override
  void initState() {
    getSettingsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;


    void saveSettingsData() async {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool("notification", notificationIsWork);
      await prefs.setBool("wifi", wifiOnyIsWork);
      prefs.commit();
    }

    return Column(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          AssetImage("assets/images/header_default_image2.png"),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Settings",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ))
              ],
            ),
          ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Card(
            child: SettingsList(
              sections: [
                SettingsSection(
                  title: Text('Settings'),
                  tiles: <SettingsTile>[
                    SettingsTile.switchTile(
                      onToggle: (value) {
                        setState(() {
                          notificationIsWork = value;
                          saveSettingsData();
                        });
                      },
                      initialValue: notificationIsWork,
                      leading: Icon(Icons.notifications),
                      title: Text('Push Notifications'),
                    ),
                    SettingsTile.switchTile(
                      onToggle: (value) {
                        setState(() {
                          wifiOnyIsWork = value;
                          saveSettingsData();
                        });
                      },
                      initialValue: wifiOnyIsWork,
                      leading: Icon(Icons.wifi),
                      title: Text('Wi-Fİ Only'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 350,
          child: Card(
            child: Column(
              children: [
                Expanded(
                    flex: 15,
                    child: Padding(padding: EdgeInsets.all(10.0),  child : Align(alignment: Alignment.topLeft , child : Text("Sign In to Premium",style: TextStyle(fontSize: 20),)))),
                Expanded(
                  flex: 85,
                  child: WebView(
                      initialUrl: 'https://compareprivateplanes.com/sign-in',
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController) {
                        _controller = webViewController;
                      },
                    ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // <-- Radius
              ),),onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.remove("wifi");
                prefs.remove("notification");
                setState(() {
                  notificationIsWork = false;
                  wifiOnyIsWork = false;

                });
              }, child: Text("Delete All Data",style: TextStyle(color : Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
            ),
          ),
        )
      ],
    );
  }
}
