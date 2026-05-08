import 'package:flutter/material.dart';

class CustomizeFontPage extends StatefulWidget {
  const CustomizeFontPage({super.key});

  @override
  State<CustomizeFontPage> createState() => _CustomizeFontPageState();
}

class _CustomizeFontPageState extends State<CustomizeFontPage> {
  double _currentFontSize = 20.0;
  double _percentage = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Soft Dark Background
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        title: const Text(
          "Font Stylist",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // 1. MODERN PREVIEW AREA
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Hello World",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _currentFontSize,
                    color: Colors.indigo.shade900,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),

          // 2. BOTTOM CONTROL PANEL (Premium Look)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                // Size Label with Badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Text Scale",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${_percentage.toInt()}%",
                        style: const TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // 3. CUSTOM SLIDER
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 8,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12,
                    ),
                    overlayColor: Colors.indigo.withOpacity(0.2),
                    activeTrackColor: Colors.indigoAccent,
                    inactiveTrackColor: Colors.indigo.shade50,
                  ),
                  child: Slider(
                    value: _percentage,
                    min: 50.0,
                    max: 400.0,
                    onChanged: (value) {
                      setState(() {
                        _percentage = value;
                        _currentFontSize = (value / 100) * 20;
                      });
                    },
                  ),
                ),

                // Custom Labels
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _labelIcon(Icons.text_fields, 14),
                      _labelIcon(Icons.text_fields, 28),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // 4. NEUMORPHIC APPLY BUTTON
                GestureDetector(
                  onTap: () => Navigator.pop(context, _percentage),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.indigoAccent, Colors.indigo],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "SET AS DEFAULT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _labelIcon(IconData icon, double size) {
    return Icon(icon, size: size, color: Colors.grey.shade400);
  }
}
