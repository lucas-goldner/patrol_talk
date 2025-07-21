import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class FlutterTeamStanceSlide extends FlutterDeckSlideWidget {
  const FlutterTeamStanceSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-team-stance',
            title: 'Flutterチームのスタンス',
            steps: 6,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => FlutterDeckSlideStepsBuilder(
          builder: (context, stepNumber) => SlideWithMesh(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Flutterチームのスタンス',
                    style: TextStyle(
                      fontSize: 58,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                    ),
                  ),
                  if (stepNumber >= 2) ...[
                    const SizedBox(height: 30),
                    GlassContainer(
                      width: 900,
                      height: 600,
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    AssetImage('assets/images/piinks.jpg'),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'GoogleのPiinksさんからの返信：',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade800,
                                  fontFamily:
                                      GoogleFonts.ibmPlexSansJp().fontFamily,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          AnimatedOpacity(
                            opacity: stepNumber >= 2 ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 600),
                            child: _buildQuoteItem(
                              '現時点ではLiquid Glass開発予定なし',
                            ),
                          ),
                          if (stepNumber >= 3) ...[
                            const SizedBox(height: 15),
                            AnimatedOpacity(
                              opacity: stepNumber >= 3 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 600),
                              child: _buildQuoteItem(
                                'Material 3 Expressiveと同様の方針',
                              ),
                            ),
                          ],
                          if (stepNumber >= 4) ...[
                            const SizedBox(height: 15),
                            AnimatedOpacity(
                              opacity: stepNumber >= 4 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 600),
                              child: _buildQuoteItem(
                                'デザインシステム統合の長期的なアーキテクチャを見直す機会',
                              ),
                            ),
                          ],
                          if (stepNumber >= 5) ...[
                            const SizedBox(height: 15),
                            AnimatedOpacity(
                              opacity: stepNumber >= 5 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 600),
                              child: _buildQuoteItem(
                                'MaterialとCupertinoライブラリを'
                                'コアから分離するアイデアを再検討',
                              ),
                            ),
                          ],
                          if (stepNumber >= 6) ...[
                            const SizedBox(height: 30),
                            AnimatedOpacity(
                              opacity: stepNumber >= 6 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 600),
                              child: Center(
                                child: Text(
                                  '💙 数週間以内に詳細をお知らせしていく予定',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontFamily:
                                        GoogleFonts.ibmPlexSansJp().fontFamily,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildQuoteItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: TextStyle(
            fontSize: 28,
            color: Colors.black87,
            fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 26,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
