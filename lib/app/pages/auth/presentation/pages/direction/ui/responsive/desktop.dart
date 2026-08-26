import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;
import 'package:google_fonts/google_fonts.dart';
import 'package:path_way_flu/app/pages/auth/presentation/pages/direction/bloc/direction_bloc.dart';
import 'package:path_way_flu/app/pages/auth/presentation/pages/sign_in/ui/sign_in.dart';

class DirectionDesk extends StatelessWidget {
  const DirectionDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose Your Role',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF0B1C30),
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select how you’ll be using the platform',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF464555),
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Side by Side Role Cards for Desktop
                  BlocBuilder<DirectionBloc, DirectionState>(
                    builder: (context, state) {
                      final bool isStudentSelected = state.directionValue;
                      return Row(
                        children: [
                          Expanded(
                            child: _buildRoleCard(
                              context: context,
                              title: 'Student',
                              imagePath: 'asset/student(Icon).png',
                              isSelected: isStudentSelected,
                              onTap: () {
                                if (!isStudentSelected) {
                                  context.read<DirectionBloc>().add(
                                        const DirectionEvent.directionSelection(),
                                      );
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _buildRoleCard(
                              context: context,
                              title: 'Teacher',
                              imagePath: 'asset/teacher(Image).png',
                              isSelected: !isStudentSelected,
                              onTap: () {
                                if (isStudentSelected) {
                                  context.read<DirectionBloc>().add(
                                        const DirectionEvent.directionSelection(),
                                      );
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 48),

                  // Bottom Action Button
                  BlocBuilder<DirectionBloc, DirectionState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 56,
                        width: 360,
                        child: ElevatedButton(
                          onPressed: () {
                            getx.Get.to(
                              SignIn(directiontext: state.directionText),
                              transition: getx.Transition.fade,
                              duration: const Duration(seconds: 1),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),
                            foregroundColor: Colors.white,
                            elevation: 4,
                            shadowColor: const Color(0x4D4F46E5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Continue as a ${state.directionText}',
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required BuildContext context,
    required String title,
    required String imagePath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF4F46E5)
                : const Color(0xFFE5EEFF),
            width: isSelected ? 2.5 : 1.5,
          ),
          boxShadow: [
            if (isSelected)
              const BoxShadow(
                color: Color(0x1F4F46E5),
                blurRadius: 20,
                offset: Offset(0, 8),
              )
            else
              const BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF4F46E5)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? null
                      : Border.all(
                          color: const Color(0xFFC7C4D8),
                          width: 2,
                        ),
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 18,
                      )
                    : null,
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEFF4FF),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: ClipOval(
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            title == 'Student'
                                ? Icons.person
                                : Icons.school,
                            size: 50,
                            color: const Color(0xFF4F46E5),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? const Color(0xFF4F46E5)
                          : const Color(0xFF0B1C30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
