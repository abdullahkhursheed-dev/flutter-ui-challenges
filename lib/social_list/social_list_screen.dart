import 'package:big_font/social_list/social_app_model_handel.dart';
import 'package:flutter/material.dart';

class SocialListScreen extends StatefulWidget {
  @override
  _SocialListScreenState createState() => _SocialListScreenState();
}

class _SocialListScreenState extends State<SocialListScreen> {
  // Dummy data list
  List<SocialAppModel> apps = [
    SocialAppModel(
      name: 'Facebook',
      iconPath: 'assets/images/facebook.png',
      timesOpened: '0 times open',
      isEnabled: true,
      url: 'https://m.facebook.com',
    ),
    SocialAppModel(
      name: 'Messenger',
      iconPath: 'assets/images/messanger.png',
      timesOpened: '1 times open',
      isEnabled: true,
      url: 'https://www.messenger.com',
    ),
    SocialAppModel(
      name: 'Instagram',
      iconPath: 'assets/images/instagram.jpg',
      timesOpened: '0 times open',
      isEnabled: true,
      url: 'https://www.instagram.com',
    ),
    SocialAppModel(
      name: 'Snapchat',
      iconPath: 'assets/images/twiter.png',
      timesOpened: '0 times open',
      isEnabled: false,
      url: 'https://mobile.twitter.com',
    ),
    // Aap mazeed apps yahan add kar sakte hain
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Network", style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 1,
      ),
      body: ListView.separated(
        itemCount: apps.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1), // Har row ke darmiyan line
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(apps[index].iconPath), // Icon image
            ),
            title: Text(
              apps[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              apps[index].timesOpened,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            trailing: Switch(
              value: apps[index].isEnabled,
              activeColor: Colors.blue,
              onChanged: (bool value) {
                setState(() {
                  apps[index].isEnabled = value;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
