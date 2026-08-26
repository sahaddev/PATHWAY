import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_way_flu/app/data/model/lession.dart';
import 'package:path_way_flu/app/pages/student/pages/subcription%20model/bloc/subcription_bloc.dart';
import 'package:path_way_flu/main.dart';

class BuildBuyBotton extends StatelessWidget {
  const BuildBuyBotton({
    super.key,
    required this.lesson,
  });

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.85),
          border: const Border(
            top: BorderSide(color: Color(0xFFDCE9FF)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () async {
                context.read<SubcriptionBloc>().add(
                      SubcriptionEvent.makingsubcription(
                        amount: 99 * 100,
                        mob: '9876543211',
                        subject: lesson.subject,
                        email: 'sahad@gmail.com',
                      ),
                    );
                Future.delayed(const Duration(seconds: 2));
                context.read<SubcriptionBloc>().add(
                      SubcriptionEvent.updataStudentdata(
                        subject: lesson.id,
                        id: userId!,
                        context: context,
                        lesson: lesson,
                      ),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3525CD),
                elevation: 4,
                shadowColor: const Color(0xFF3525CD).withValues(alpha: 0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Buy Now",
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
