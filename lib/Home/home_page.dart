import 'package:big_font/customize_page/customize-screen.dart';
import 'package:flutter/material.dart';
import '../widgets/contianer_design.dart'; // Apna path check kar lein

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  // Aapka font data jo aapne images mein dikhaya tha
  final List<Map<String, dynamic>> fontData = [
    {"percentage": "100%", "isDefault": true, "size": 16.0},
    {"percentage": "110%", "isDefault": false, "size": 18.0},
    {"percentage": "120%", "isDefault": true, "size": 20.0},
    {"percentage": "130%", "isDefault": false, "size": 22.0},
    {"percentage": "140%", "isDefault": false, "size": 24.0},
    {"percentage": "150%", "isDefault": true, "size": 26.0},
    {"percentage": "160%", "isDefault": false, "size": 28.0},
    {"percentage": "170%", "isDefault": true, "size": 30.0},
    {"percentage": "180%", "isDefault": false, "size": 32.0},
    {"percentage": "190%", "isDefault": true, "size": 34.0},
    {"percentage": "200%", "isDefault": false, "size": 36.0},
    {"percentage": "210%", "isDefault": true, "size": 38.0},
    {"percentage": "220%", "isDefault": false, "size": 40.0},
    {"percentage": "230%", "isDefault": true, "size": 42.0},
    {"percentage": "240%", "isDefault": false, "size": 44.0},
    {"percentage": "250%", "isDefault": true, "size": 46.0},
    {"percentage": "260%", "isDefault": true, "size": 48.0},
    {"percentage": "270%", "isDefault": true, "size": 50.0},
    {"percentage": "280%", "isDefault": true, "size": 52.0},
    {"percentage": "290%", "isDefault": true, "size": .54},
    {"percentage": "300%", "isDefault": true, "size": 56.0},
    {"percentage": "310%", "isDefault": true, "size": 58.0},
    {"percentage": "320%", "isDefault": true, "size": 60.0},
    {"percentage": "330%", "isDefault": true, "size": 62.0},
    {"percentage": "340%", "isDefault": true, "size": 64.0},
    {"percentage": "350%", "isDefault": true, "size": 66.0},
    {"percentage": "80%", "isDefault": false, "size": 14.0},
    {"percentage": "70%", "isDefault": false, "size": 13.0},
    {"percentage": "60%", "isDefault": false, "size": 12.0},
    {"percentage": "50%", "isDefault": false, "size": 11.0},
    {"percentage": "40%", "isDefault": false, "size": 10.0},
    {"percentage": "30%", "isDefault": false, "size": 9.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // selectedIndex hamari list ka wo number hai jo abhi selected hai
        // fontData[selectedIndex]['percentage'] se hum uski percentage uthayenge
        title: Text(
          "Present : ${fontData[selectedIndex]['percentage']}",
          style: TextStyle(
            color: Colors.blue.shade800,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_basket, color: Colors.redAccent),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.blueAccent),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          // List ki lambai + 1 (Button ki jagah ke liye)
          itemCount: fontData.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomizeFontPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "CUSTOMIZE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }

            // 2. Data nikalne ke liye index ko adjust karein
            // Kyunke 0 par button hai, isliye fontData[0] uthane ke liye 1-1=0 karna hoga
            int dataIndex = index - 1;

            return FontDesignContainer(
              percentage: fontData[dataIndex]['percentage'],
              isDefault: fontData[dataIndex]['isDefault'],
              // Hum selectedIndex ko dataIndex se check karenge
              isApplied: selectedIndex == dataIndex,
              sampleText: "ABC abc 123",
              fontSize: fontData[dataIndex]['size'],
              onApply: () {
                setState(() {
                  selectedIndex = dataIndex;
                });
                print("Applied Font Size: ${fontData[dataIndex]['size']}");
              },
            );
          },
        ),
      ),
    );
  }
}
