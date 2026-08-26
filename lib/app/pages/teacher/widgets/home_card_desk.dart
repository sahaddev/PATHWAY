import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_way_flu/app/core/l10n/app_localizations.dart';
import 'package:path_way_flu/app/data/middleware/auth.dart';
import 'package:path_way_flu/app/data/middleware/student.dart';
import 'package:path_way_flu/app/data/model/lession.dart';
import 'package:path_way_flu/app/pages/student/pages/student%20home/bloc/student_home_bloc.dart';
import 'package:path_way_flu/app/pages/teacher/pages/teacher%20home/bloc/teacher_home_bloc.dart';

class BuildHomeBoxDesk extends StatelessWidget {
  final int isSelected;
  final String currentsub;

  const BuildHomeBoxDesk({
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
      height: 400,
      child: FutureBuilder(
        future: StudentApi.getAllLession(currentsub),
        builder: (context, AsyncSnapshot snapshot) {
          List<Lesson> lession = dummyLessons;
          if (snapshot.hasData && snapshot.data != null && (snapshot.data as List).isNotEmpty) {
            lession = List<Lesson>.from(snapshot.data);
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
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
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              color: Theme.of(context).colorScheme.secondary,
                              width: MediaQuery.of(context).size.width * .3,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.network(
                                        "${AuthApi.baseUrlImage}${item.coverImage}",
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            color: const Color(0xFFEFF4FF),
                                            child: const Center(
                                              child: Icon(
                                                Icons.school,
                                                size: 60,
                                                color: Color(0xFF4F46E5),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  maxWidth: 150),
                                              child: Text(
                                                item.title,
                                                style: GoogleFonts.aBeeZee(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                            const Image(
                                              image: AssetImage(
                                                  "asset/icons/icons8-best-seller-94.png"),
                                              height: 30,
                                              errorBuilder: null,
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundColor: const Color(0xFFEFF4FF),
                                              backgroundImage: item.profileImage.isNotEmpty
                                                  ? NetworkImage(
                                                      "${AuthApi.baseUrlImage}${item.profileImage}")
                                                  : null,
                                              child: item.profileImage.isEmpty
                                                  ? const Icon(Icons.person,
                                                      size: 18,
                                                      color: Color(0xFF4F46E5))
                                                  : null,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              item.creatorName,
                                              style: GoogleFonts.quicksand(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${item.watchTime} min",
                                              style: GoogleFonts.aBeeZee(
                                                  fontWeight: FontWeight.bold,
                                                  wordSpacing: 3),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.circle,
                                                  color: Colors.grey,
                                                  size: 10,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "${item.lessonId.length} ${AppLocalizations.of(context).lesson}",
                                                  style: GoogleFonts.aBeeZee(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.bold,
                                                      wordSpacing: 3),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: BlocBuilder<TeacherHomeBloc, TeacherHomeState>(
                            builder: (context, state) {
                              return Visibility(
                                visible: item.lessonId.isEmpty,
                                child: Image.asset(
                                  "asset/icons/coming-soon.png",
                                  height: 45,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const SizedBox.shrink(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
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
