import 'dart:io';

import 'package:flutter/material.dart';

class ImageDisplayCard extends StatelessWidget {
  final File? image;
  final bool isAnalyzing;

  const ImageDisplayCard({super.key, this.image, required this.isAnalyzing});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: image != null
                ? Image.file(
                    image!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Icon(
                      Icons.face_unlock_rounded,
                      size: 64,
                      color: Colors.grey[300],
                    ),
                  ),
          ),
          if (isAnalyzing)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
