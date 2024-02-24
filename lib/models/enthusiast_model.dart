class EnthusiastModel {
  final String name;
  final String type;
  final int age;
  final int height;
  final int weight;
  final String location;
  final List<String> following;
  final String fitnessGoal;
  final List<String> preferredActivities;

  EnthusiastModel({
    required this.name,
    required this.type,
    required this.age,
    required this.height,
    required this.weight,
    required this.location,
    required this.following,
    required this.fitnessGoal,
    required this.preferredActivities,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'age': age,
      'height': height,
      'weight': weight,
      'location': location,
      'following': following,
      'fitnessGoal': fitnessGoal,
      'preferredActivities': preferredActivities,
    };
  }
}
