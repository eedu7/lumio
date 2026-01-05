import 'package:flutter/material.dart';

class RecommendationList extends StatelessWidget {
  final String ageGroup;
  final String score;
  final List<dynamic> items;
  final VoidCallback onReset;

  const RecommendationList({
    super.key,
    required this.ageGroup,
    required this.score,
    required this.items,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Result Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Analysis Result",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  ageGroup,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Match: $score",
                style: TextStyle(
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        Text(
          items.isEmpty ? "No specific matches found" : "Tailored for You",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Product List
        ...items.map((product) {
          final imageUrl = product['image']?['image_url'];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                // Product Image
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: imageUrl != null
                        ? Image.network(imageUrl, fit: BoxFit.cover)
                        : const Icon(
                            Icons.inventory_2_outlined,
                            color: Colors.grey,
                          ),
                  ),
                ),
                const SizedBox(width: 16),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'] ?? "Unknown Product",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${product['price']?.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey,
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: 16),
        Center(
          child: TextButton.icon(
            onPressed: onReset,
            icon: const Icon(Icons.refresh),
            label: const Text("Retake Analysis"),
          ),
        ),
      ],
    );
  }
}
