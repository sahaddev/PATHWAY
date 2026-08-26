import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_way_flu/app/data/middleware/teacher.dart';
import 'package:path_way_flu/app/data/model/lession.dart';
import 'package:path_way_flu/app/data/model/tutoral.dart';
import 'package:path_way_flu/app/pages/student/pages/subcription%20model/bloc/subcription_bloc.dart';
import 'package:path_way_flu/app/pages/student/widgets/buy_botton.dart';

class StudentDeatileWithoutPayMob extends StatelessWidget {
  final Lesson lesson;

  const StudentDeatileWithoutPayMob({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    context
        .read<SubcriptionBloc>()
        .add(const SubcriptionEvent.makeinginstence());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Banner Header with Background Image / Gradient
                Stack(
                  children: [
                    Container(
                      height: 320,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD3E4FE),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                        image: lesson.coverImage.isNotEmpty
                            ? DecorationImage(
                                image: NetworkImage(lesson.coverImage),
                                fit: BoxFit.cover,
                              )
                            : const DecorationImage(
                                image: AssetImage("asset/images/ux_big-removebg-preview.png"),
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.4),
                              Colors.transparent,
                              const Color(0xFFF8F9FF).withValues(alpha: 0.9),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 48,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.3),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.3),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.more_vert_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Course Meta Content Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFB95F),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "BEST SELLER",
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF653E00),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        lesson.title,
                        style: GoogleFonts.manrope(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF0B1C30),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.group_rounded,
                            size: 18,
                            color: Color(0xFF777587),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "18K",
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF464555),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.star_rounded,
                            size: 18,
                            color: Color(0xFFFFB95F),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "4.8",
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF464555),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "\u{20B9}${lesson.price}",
                            style: GoogleFonts.manrope(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF3525CD),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "\u{20B9}299",
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              color: const Color(0xFFC7C4D8),
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Course Content',
                        style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF0B1C30),
                        ),
                      ),
                      const SizedBox(height: 14),
                      FutureBuilder(
                        future: TeacherApi.getTotorial(lesson.id),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<Tutorial> tutoral = [
                            Tutorial(
                              id: 't1',
                              title: 'Adding one',
                              level: 'Basic Addition',
                              videoUrl: '',
                              duration: 15,
                              discription: 'Introduction to single digit addition',
                            ),
                            Tutorial(
                              id: 't2',
                              title: 'Adding two',
                              level: 'Basic Addition',
                              videoUrl: '',
                              duration: 25,
                              discription: 'Two digit addition rules',
                            ),
                            Tutorial(
                              id: 't3',
                              title: 'Adding Three',
                              level: 'Intermediate',
                              videoUrl: '',
                              duration: 30,
                              discription: 'Multi digit addition',
                            ),
                            Tutorial(
                              id: 't4',
                              title: 'Adding',
                              level: 'Advanced',
                              videoUrl: '',
                              duration: 40,
                              discription: 'Advanced problem solving',
                            ),
                          ];
                          if (snapshot.hasData &&
                              snapshot.data != null &&
                              (snapshot.data as List).isNotEmpty) {
                            tutoral = List<Tutorial>.from(snapshot.data!);
                          }

                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 110),
                            itemCount: tutoral.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: const Color(0xFFE2E8F0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.02),
                                      blurRadius: 10,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      index < 9
                                          ? '0${index + 1}'
                                          : '${index + 1}',
                                      style: GoogleFonts.manrope(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: const Color(0xFFC7C4D8),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tutoral[index].level,
                                            style: GoogleFonts.manrope(
                                              fontSize: 12,
                                              color: const Color(0xFF777587),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            tutoral[index].title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.manrope(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF0B1C30),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF4F46E5),
                                      ),
                                      child: const Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BuildBuyBotton(lesson: lesson),
        ],
      ),
    );
  }
}
