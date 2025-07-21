class TestTypes {
  TestTypes({
    this.unitTests = 0,
    this.widgetTests = 0,
    this.integrationTests = 0,
  });

  factory TestTypes.fromJson(Map<String, dynamic> json) {
    return TestTypes(
      unitTests: json['unit_tests'] as int? ?? 0,
      widgetTests: json['widget_tests'] as int? ?? 0,
      integrationTests: json['integration_tests'] as int? ?? 0,
    );
  }

  final int unitTests;
  final int widgetTests;
  final int integrationTests;

  Map<String, dynamic> toJson() {
    return {
      'unit_tests': unitTests,
      'widget_tests': widgetTests,
      'integration_tests': integrationTests,
    };
  }

  TestTypes copyWith({
    int? unitTests,
    int? widgetTests,
    int? integrationTests,
  }) {
    return TestTypes(
      unitTests: unitTests ?? this.unitTests,
      widgetTests: widgetTests ?? this.widgetTests,
      integrationTests: integrationTests ?? this.integrationTests,
    );
  }

  @override
  String toString() {
    return 'TestTypes(unitTests: $unitTests, widgetTests: $widgetTests, '
        'integrationTests: $integrationTests)';
  }
}