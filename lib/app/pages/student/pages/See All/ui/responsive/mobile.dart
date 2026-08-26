import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_way_flu/app/core/l10n/app_localizations.dart';
import 'package:path_way_flu/app/pages/student/pages/See%20All/bloc/see_all_bloc.dart';
import 'package:path_way_flu/app/pages/student/pages/student%20home/ui/responsive/mobile.dart';
import 'package:path_way_flu/app/pages/teacher/widgets/home_card.dart';

class SeeAllMob extends StatelessWidget {
  const SeeAllMob({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SeeAllBloc>().add(const SeeAllEvent.givingInitialValue());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarHome(
                searchController: TextEditingController(),
                onChanged: (value) {
                  context
                      .read<SeeAllBloc>()
                      .add(SeeAllEvent.fulturedValue(typeText: value));
                },
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Calculas',
                    style: GoogleFonts.quicksand(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).lesson,
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(child: BuildHomeBox(isSelected: 1, currentsub: "123"))
            ],
          ),
        ),
      ),
    );
  }
}
