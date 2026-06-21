import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildProfileCard extends StatelessWidget {
  final String text;
  final VoidCallback fun;
  final IconData icon;
  const BuildProfileCard({
    super.key,
    required this.text,
    required this.fun,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              text,
              style: GoogleFonts.aBeeZee(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
              onPressed: fun,
              icon: Icon(
                icon,
                size: 30,
              ))
        ],
      ),
    );
  }
}
