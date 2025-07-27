import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class AppiumProblemsSlide extends FlutterDeckSlideWidget {
  const AppiumProblemsSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/appium-problems',
            title: 'Appium の問題',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.custom(
        builder: (context) => SlideWithMesh(
          child: GlassContainer(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Appium テストフレームワーク',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 40),
                _buildAppiumSection(),
                const SizedBox(height: 32),
                _buildAppiumProblemsSection(),
              ],
            ),
          ),
        ),
      );

  Widget _buildAppiumSection() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📱 Appium',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.blue[700],
                fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '• 最も人気のUIテストフレームワーク\n'
              '• ブラックボックステスト（コードを知らない）\n'
              '• Flutter公式サポートなし\n'
              '• Flutter Driver使用 → 開発停止',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                height: 1.5,
                fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
              ),
            ),
          ],
        ),
      );

  Widget _buildAppiumProblemsSection() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '⚠️ Appium Flutter Driverの問題',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.red[700],
                fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProblemItem('メンテナー1人のみ'),
                _buildProblemItem('全てのFinderが公開されていない'),
                _buildProblemItem('弱い型付け（文字列だらけ）'),
                _buildProblemItem('スクロール、テキスト検索などが正しく動作しない'),
                _buildProblemItem('Firebase Test Lab非対応'),
              ],
            ),
          ],
        ),
      );

  Widget _buildProblemItem(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '• ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                ),
              ),
            ),
          ],
        ),
      );
}
