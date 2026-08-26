import 'package:flutter/material.dart';
import 'package:path_way_flu/app/pages/auth/presentation/pages/direction/ui/direction.dart';
import 'package:path_way_flu/app/pages/auth/presentation/pages/indroduction/intro%20page%20one/intropage_one.dart';
import 'package:path_way_flu/app/pages/auth/presentation/pages/indroduction/intro%20page%20three/intropage_three.dart';
import 'package:path_way_flu/app/pages/auth/presentation/pages/indroduction/intro%20page%20two/intropage_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFEBEFEF),
      body: IntroOne(),
    );
  }
}
