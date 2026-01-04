import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/feature_controls.dart';
import '../widgets/image_display_card.dart';
import '../widgets/recommendation_list.dart';

class SpecialFeaturesPage extends StatefulWidget {
  const SpecialFeaturesPage({super.key});

  @override
  State<SpecialFeaturesPage> createState() => _SpecialFeaturesPageState();
}

class _SpecialFeaturesPageState extends State<SpecialFeaturesPage> {
  File? _image;
  bool _isAnalyzing = false;
  Map<String, dynamic>? _results;
  final ImagePicker _picker = ImagePicker();

  Future<void> _handleImageSelection(ImageSource source) async {
    final XFile? selectedFile = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (selectedFile != null) {
      setState(() {
        _image = File(selectedFile.path);
        _results = null;
      });
      _simulateAnalysis();
    }
  }

  Future<void> _simulateAnalysis() async {
    setState(() => _isAnalyzing = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _results = {
        "age_group": "25-30 Years",
        "score": "94%",
        "recommendations": [
          {"name": "Revitalizing Serum", "price": 29.99, "tag": "Top Pick"},
          {"name": "Hydrating Sunscreen", "price": 18.50, "tag": "Essential"},
          {"name": "Night Repair Cream", "price": 45.00, "tag": "New"},
        ],
      };
      _isAnalyzing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'AI Skin Analysis',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageDisplayCard(image: _image, isAnalyzing: _isAnalyzing),
              const SizedBox(height: 24),
              if (_results == null && !_isAnalyzing)
                FeatureControls(onPickImage: _handleImageSelection),
              if (_results != null)
                RecommendationList(
                  ageGroup: _results!['age_group'],
                  score: _results!['score'],
                  items: _results!['recommendations'],
                  onReset: () => setState(() => _results = null),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
