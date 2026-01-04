import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FeatureControls extends StatelessWidget {
  final Function(ImageSource) onPickImage;

  const FeatureControls({super.key, required this.onPickImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Instant Recommendations",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Upload a photo to let our AI identify your skin needs and suggest the best catalog products.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[600], height: 1.5),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: () {
              onPickImage(ImageSource.camera);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            icon: const Icon(Icons.camera_alt_rounded),
            label: const Text(
              "Take a Photo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton.icon(
            onPressed: () => onPickImage(ImageSource.gallery),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey[300]!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: Icon(Icons.image_search_rounded, color: Colors.grey[700]),
            label: Text(
              "Upload from Gallery",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
