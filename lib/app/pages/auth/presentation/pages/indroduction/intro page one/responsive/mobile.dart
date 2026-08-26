import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_way_flu/app/pages/auth/presentation/pages/direction/ui/direction.dart';

class IntroOneMob extends StatelessWidget {
  const IntroOneMob({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 211, 214, 209),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background image starting from middle of screen
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'asset/onbordingImage/edubloom_bg.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Color.fromARGB(255, 211, 214, 209));
              },
            ),
          ),
          SafeArea(
            child: Stack(
              children: [
                // Header Content (EduBloom logo, header texts)
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      // Logo Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Path',
                            style: GoogleFonts.poppins(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF76C4E0),
                            ),
                          ),
                          Text(
                            'Way',
                            style: GoogleFonts.poppins(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFE899B5),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.school,
                            color: Color(0xFFE899B5),
                            size: 28,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      // Title Text Lines
                      Text(
                        'LEARN SMARTER',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF78C5E7),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'GROW FASTER',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF2C2C2C),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom "Let's Start" Button
                Positioned(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  child: SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (ctx) => const Direction()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B2C2C),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Let's Start",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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
}
