import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_way_flu/app/data/middleware/auth.dart';
import 'package:path_way_flu/app/data/middleware/student.dart';
import 'package:path_way_flu/app/data/model/lession.dart';
import 'package:path_way_flu/app/pages/student/pages/student%20home/bloc/student_home_bloc.dart';

class BuildHomeBox extends StatelessWidget {
  final int isSelected;
  final String currentsub;

  const BuildHomeBox({
    super.key,
    required this.isSelected,
    required this.currentsub,
  });

  static final List<Lesson> dummyLessons = [
    Lesson(
      id: "1",
      title: "Flutter & Dart Masterclass",
      creatorName: "Sarah Jenkins",
      subject: "Coding",
      watchTime: 45,
      countOfLesson: 12,
      lessonId: ["1", "2", "3", "4"],
      creatorId: "c1",
    ),
    Lesson(
      id: "2",
      title: "UI/UX Mobile Design",
      creatorName: "David Chen",
      subject: "Design",
      watchTime: 30,
      countOfLesson: 8,
      lessonId: ["1", "2"],
      creatorId: "c2",
    ),
    Lesson(
      id: "3",
      title: "Data Structures & Algo",
      creatorName: "Prof. Alan Smith",
      subject: "Computer Science",
      watchTime: 60,
      countOfLesson: 15,
      lessonId: ["1", "2", "3", "4", "5"],
      creatorId: "c3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: FutureBuilder(
        future: StudentApi.getAllLession(currentsub),
        builder: (context, AsyncSnapshot snapshot) {
          List<Lesson> lession = dummyLessons;
          if (snapshot.hasData &&
              snapshot.data != null &&
              (snapshot.data as List).isNotEmpty) {
            lession = List<Lesson>.from(snapshot.data);
          }

          return ListView.builder(
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: lession.length,
            itemBuilder: (context, index) {
              final item = lession[index];
              return BlocBuilder<StudentHomeBloc, StudentHomeState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<StudentHomeBloc>().add(
                            StudentHomeEvent.deatilePage(
                              context: context,
                              lesson: item,
                            ),
                          );
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.95,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFCDECF8),
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 203, 233, 248),
                            Color.fromARGB(255, 204, 230, 242),
                            Color.fromARGB(255, 217, 235, 243),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Row: Icon / Cover Image + Title & Creator + Bookmark Button
                          Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: item.coverImage.isNotEmpty
                                      ? Image.network(
                                          "${AuthApi.baseUrlImage}${item.coverImage}",
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Center(
                                            child: Text(
                                              item.subject.isNotEmpty
                                                  ? item.subject
                                                      .substring(0, 1)
                                                      .toUpperCase()
                                                  : "M",
                                              style: GoogleFonts.outfit(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: const Color(0xFF0F172A),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Image.asset(
                                          "asset/images/math image.jpg",
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Center(
                                            child: Text(
                                              "MATH",
                                              style: GoogleFonts.outfit(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                                color: const Color(0xFF0F172A),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.outfit(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF0F172A),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      item.creatorName.isNotEmpty
                                          ? item.creatorName
                                          : "Beginner to Advance",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color: const Color(0xFF64748B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.bookmark_outline_rounded,
                                  color: Color(0xFF334155),
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // Middle Row: Tag Pills
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF80D4F6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Online class",
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0F172A),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF80D4F6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "${item.lessonId.length} Class",
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0F172A),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF80D4F6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "${item.watchTime}m",
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0F172A),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Bottom Row: Price & See Details Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$10K - \$12K",
                                    style: GoogleFonts.outfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF0F172A),
                                    ),
                                  ),
                                  Text(
                                    "month",
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      color: const Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF262626),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "See details",
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
