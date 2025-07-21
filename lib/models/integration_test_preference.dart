class IntegrationTestPreference {
  IntegrationTestPreference({
    this.yes = 0,
    this.no = 0,
  });

  factory IntegrationTestPreference.fromJson(Map<String, dynamic> json) {
    return IntegrationTestPreference(
      yes: json['yes'] as int? ?? 0,
      no: json['no'] as int? ?? 0,
    );
  }

  final int yes;
  final int no;

  Map<String, dynamic> toJson() {
    return {
      'yes': yes,
      'no': no,
    };
  }

  IntegrationTestPreference copyWith({
    int? yes,
    int? no,
  }) {
    return IntegrationTestPreference(
      yes: yes ?? this.yes,
      no: no ?? this.no,
    );
  }

  @override
  String toString() {
    return 'IntegrationTestPreference(yes: $yes, no: $no)';
  }
}