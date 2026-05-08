import 'package:flutter/material.dart';

class FontDesignContainer extends StatelessWidget {
  final String percentage;
  final bool isDefault;
  final bool isApplied; // State handle karne ke liye
  final String sampleText;
  final double fontSize;
  final VoidCallback onApply;

  const FontDesignContainer({
    super.key,
    required this.percentage,
    required this.isDefault,
    required this.isApplied,
    required this.sampleText,
    required this.fontSize,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: isApplied
              ? Colors.green.withOpacity(0.5)
              : Colors.deepPurple.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  percentage,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                if (isDefault) ...[
                  const SizedBox(width: 4),
                  const Text(
                    "(Default)",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 10),
            Text(
              sampleText,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: isApplied
                    ? null
                    : onApply, // Agar apply ho chuka ho to click na ho
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    // Yahan rang change hoga
                    color: isApplied ? Colors.green : Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isApplied ? Icons.done_all : Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isApplied ? "Confirmed" : "Apply", // Text change logic
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
