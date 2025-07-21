class TestingQuestionAnswersCount {
  TestingQuestionAnswersCount({
    required this.doesTest,
    required this.doesNotTest,
  });

  factory TestingQuestionAnswersCount.fromJson(Map<String, dynamic> json) {
    return TestingQuestionAnswersCount(
      doesTest: json['does_test'] as int,
      doesNotTest: json['does_not_test'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'does_test': doesTest,
      'does_not_test': doesNotTest,
    };
  }

  final int doesTest;
  final int doesNotTest;

  TestingQuestionAnswersCount copyWith({
    int? doesTest,
    int? doesNotTest,
  }) {
    return TestingQuestionAnswersCount(
      doesTest: doesTest ?? this.doesTest,
      doesNotTest: doesNotTest ?? this.doesNotTest,
    );
  }

  @override
  String toString() {
    return 'TestingQuestionAnswersCount(doesTest: $doesTest, '
        'doesNotTest: $doesNotTest)';
  }
}