import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/features/special-features/service/special_feature_service.dart';
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
      _runRealAnalysis();
    }
  }

  Future<void> _runRealAnalysis() async {
    if (_image == null) return;

    setState(() => _isAnalyzing = true);

    final apiData = await SpecialFeatureService.analyzeSkin(_image!);

    setState(() {
      _results = apiData;
      _isAnalyzing = false;
    });

    if (apiData == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Could not analyze image. Check connection."),
        ),
      );
    }
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
          'AI Skin Analysis - ',
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black87),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
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
                  onReset: () => setState(() {
                    _results = null;
                    _image = null;
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
