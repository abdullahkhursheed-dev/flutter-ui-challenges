import 'package:big_font/social_list/social_list_screen.dart';
import 'package:big_font/web/web_view_screen.dart';
import 'package:flutter/material.dart';

class SocialHomeScreen extends StatelessWidget {
  // Social apps ka data
  final List<Map<String, String>> socialApps = [
    {
      'name': 'Facebook',
      'url': 'https://m.facebook.com',
      'icon': 'assets/images/facebook.png',
    },
    {
      'name': 'Messenger',
      'url': 'https://www.messenger.com',
      'icon': 'assets/images/messanger.png',
    },
    {
      'name': 'Instagram',
      'url': 'https://www.instagram.com',
      'icon': 'assets/images/instagram.jpg',
    },
    {
      'name': 'Twitter',
      'url': 'https://mobile.twitter.com',
      'icon': 'assets/images/twiter.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Big Social",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Reading Mode Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reading Mode (Beta)",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Icon(
                  Icons.power_settings_new,
                  size: 40,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),

          // Social Network Grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Social Network",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SocialListScreen(),
                      ),
                    );
                  },
                  child: Text("See all", style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4 icons in one row
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: socialApps.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Yahan se Next Page (WebView) khule ga
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyWebViewScreen(
                          url: socialApps[index]['url']!,
                          title: socialApps[index]['name']!,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      // Icon ki jagah aap apni Images use kar sakte hain
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue[50],
                        child: Icon(Icons.language, color: Colors.blue),
                      ),
                      SizedBox(height: 5),
                      Text(
                        socialApps[index]['name']!,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
    );
  }
}
