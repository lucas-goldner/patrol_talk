import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';
import 'package:patrol_presentation/generated/assets.gen.dart';

class AppleNewsSlide extends FlutterDeckSlideWidget {
  const AppleNewsSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/apple-news',
            title: 'Apple最新ニュース',
            steps: 6,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: FlutterDeckSlideStepsBuilder(
            builder: (context, stepNumber) {
              if (stepNumber == 1) {
                return const SizedBox.expand();
              } else if (stepNumber >= 2 && stepNumber <= 4) {
                return Stack(
                  children: [
                    if (stepNumber >= 2)
                      Positioned(
                        right: 150,
                        top: 100,
                        child: TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 600),
                          tween: Tween(begin: 0, end: 1),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) => Transform.scale(
                            scale: value.clamp(0.0, 1.0),
                            child: Opacity(
                              opacity: value.clamp(0.0, 1.0),
                              child: GlassContainer(
                                width: 500,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Assets
                                      .images.appleNews.appleIntelligence
                                      .image(
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (stepNumber >= 3)
                      Positioned(
                        left: 200,
                        bottom: 150,
                        child: TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 600),
                          tween: Tween(begin: 0, end: 1),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) => Transform.scale(
                            scale: value.clamp(0.0, 1.0),
                            child: Opacity(
                              opacity: value.clamp(0.0, 1.0),
                              child: GlassContainer(
                                width: 500,
                                height: 500,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Assets
                                      .images.appleNews.backgroundsMessages
                                      .image(
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (stepNumber >= 4)
                      Positioned(
                        right: 300,
                        bottom: 200,
                        child: TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 600),
                          tween: Tween(begin: 0, end: 1),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) => Transform.scale(
                            scale: value.clamp(0.0, 1.0),
                            child: Opacity(
                              opacity: value.clamp(0.0, 1.0),
                              child: GlassContainer(
                                width: 300,
                                height: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Assets.images.appleNews.games.image(
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              } else if (stepNumber == 5) {
                return Stack(
                  children: [
                    Positioned(
                      left: -100,
                      top: MediaQuery.of(context).size.height * 0.3,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 1200),
                        tween: Tween(begin: 0, end: 1),
                        curve: Curves.easeOutCubic,
                        builder: (context, value, child) => Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..translate(value * 200)
                            ..rotateZ((1 - value) * -0.5),
                          child: Opacity(
                            opacity: value.clamp(0.0, 1.0),
                            child: Assets.images.iphoneInHand.image(
                              width: 900,
                              height: 900,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Stack(
                  children: [
                    Positioned(
                      left: 100,
                      top: MediaQuery.sizeOf(context).height * 0.3,
                      child: Assets.images.iphoneInHand.image(
                        width: 900,
                        height: 900,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 400),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Apple最新ニュース',
                              style: TextStyle(
                                fontSize: 68,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontFamily:
                                    GoogleFonts.ibmPlexSansJp().fontFamily,
                              ),
                            ),
                            GlassContainer(
                              width: 800,
                              height: 400,
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2週間ほど前、Apple🍎がWWDC 2025で',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Colors.black87,
                                      fontFamily: GoogleFonts.ibmPlexSansJp()
                                          .fontFamily,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'iOS 26と新デザインプラットフォームLiquid Glass🫧を発表',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Colors.black87,
                                      fontFamily: GoogleFonts.ibmPlexSansJp()
                                          .fontFamily,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Glassmorphismが突如としてAppleのメインデザインへ進化',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.black87,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: GoogleFonts.ibmPlexSansJp()
                                          .fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      );
}
