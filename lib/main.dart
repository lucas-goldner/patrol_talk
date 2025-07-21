import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/backgrounds/mesh_deck_background.dart';
import 'package:patrol_presentation/slides/icebreaker/icebreaker.dart';
import 'package:patrol_presentation/slides/problem/problem.dart';
import 'package:patrol_presentation/slides/current_solutions/current_solutions.dart';
import 'package:patrol_presentation/slides/enter_patrol/enter_patrol.dart';
import 'package:patrol_presentation/slides/patrol_different/patrol_different.dart';
import 'package:patrol_presentation/slides/test_authoring/test_authoring.dart';
import 'package:patrol_presentation/slides/under_the_hood/under_the_hood.dart';
import 'package:patrol_presentation/slides/real_features/real_features.dart';
import 'package:patrol_presentation/slides/summary/summary.dart';
import 'package:patrol_presentation/slides/closing/closing.dart';
import 'package:patrol_presentation/slides/title/title.dart';

void main() => runApp(const FlutterDeckExample());

class FlutterDeckExample extends StatelessWidget {
  const FlutterDeckExample({super.key});

  @override
  Widget build(BuildContext context) => DefaultTextStyle(
        style: GoogleFonts.ibmPlexSansJp(),
        child: FlutterDeckApp(
          lightTheme: FlutterDeckThemeData.fromTheme(
            ThemeData.light()
                .copyWith(textTheme: GoogleFonts.ibmPlexSansJpTextTheme()),
          ),
          darkTheme: FlutterDeckThemeData.fromTheme(
            ThemeData.dark()
                .copyWith(textTheme: GoogleFonts.ibmPlexSansJpTextTheme()),
          ),
          configuration: FlutterDeckConfiguration(
            background: const FlutterDeckBackgroundConfiguration(
              light: FlutterDeckBackground.custom(
                child: MeshDeckBackground(),
              ),
              dark: FlutterDeckBackground.custom(
                child: MeshDeckBackground(),
              ),
            ),
            controls: const FlutterDeckControlsConfiguration(
              shortcuts: FlutterDeckShortcutsConfiguration(
                toggleMarker: SingleActivator(
                  LogicalKeyboardKey.keyM,
                  control: true,
                  meta: true,
                ),
                toggleNavigationDrawer: SingleActivator(
                  LogicalKeyboardKey.period,
                  control: true,
                  meta: true,
                ),
              ),
            ),
            footer: const FlutterDeckFooterConfiguration(
              showSlideNumbers: true,
              widget: FlutterLogo(),
            ),
            marker: const FlutterDeckMarkerConfiguration(
              color: Colors.cyan,
              strokeWidth: 8,
            ),
            progressIndicator: const FlutterDeckProgressIndicator.gradient(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF667eea),
                  Color(0xFF764ba2),
                ],
              ),
              backgroundColor: Colors.black26,
            ),
            slideSize: FlutterDeckSlideSize.fromAspectRatio(
              aspectRatio: const FlutterDeckAspectRatio.ratio16x10(),
              resolution: const FlutterDeckResolution.fromWidth(1440),
            ),
            transition: const FlutterDeckTransition.fade(),
          ),
          slides: const [
            TitleSlide(),
            IcebreakerSlide(),
            ProblemSlide(),
            CurrentSolutionsSlide(),
            EnterPatrolSlide(),
            PatrolDifferentSlide(),
            TestAuthoringSlide(),
            UnderTheHoodSlide(),
            RealFeaturesSlide(),
            SummarySlide(),
            ClosingSlide(),
          ],
        ),
      );
}
