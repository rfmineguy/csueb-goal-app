class Goal {
  final String goalString;

  const Goal({required this.goalString});

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(goalString: json['goalString'] as String);
  }
}
