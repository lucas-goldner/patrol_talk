import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/slide_with_mesh.dart';

class NativeToolingProblemsSlide extends FlutterDeckSlideWidget {
  const NativeToolingProblemsSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/native-tooling-problems',
            title: 'ネイティブツールの問題',
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
                  'ネイティブツール & Flutter',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  '🔧 ネイティブツール',
                  [
                    'Firebase Test Lab, AWS Device Farm',
                    'Test Runners: AS/Xcode, Marathon, Bluepill',
                    'Reporting: TestRail, TestLink',
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildProblemSection(
                        '❌ 問題点',
                        [
                          'Flutterテストは直接サポートされない',
                          'JUnit/XCTestのみ対応',
                          'Dartテストをネイティブテストでラップする必要',
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildIntegrationTestSection(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildSection(String title, List<String> items) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
            ),
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '• ',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildProblemSection(String title, List<String> problems) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.red[700],
                fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
              ),
            ),
            const SizedBox(height: 12),
            ...problems.map(
              (problem) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '• $problem',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildIntegrationTestSection() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '📦 integration_test の制限',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.orange[700],
                fontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '• 遅い & 非効率的\n'
              '• テスト間の分離なし\n'
              '• シャーディング不可\n'
              '• 100テスト = 100 APK\n'
              '• プリミティブなバンドリング',
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
}