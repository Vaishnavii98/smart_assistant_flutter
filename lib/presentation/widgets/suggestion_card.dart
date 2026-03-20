import 'package:flutter/material.dart';

class SuggestionCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SuggestionCard({super.key, 
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        elevation: 3,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Row(
            children: [

              const Icon(
                Icons.lightbulb_outline,
                size: 28,
              ),

              const SizedBox(width: 12),
Row(
  children: [

    const Icon(
      Icons.lightbulb_outline,
      size: 28,
    ),

    const SizedBox(width: 12),

    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            "Tap to ask assistant",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    )
  ],
)
            ],
          ),
        ),
      ),
    );
  }
}