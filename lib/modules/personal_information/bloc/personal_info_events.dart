abstract class PersonalInfoEvent{}

class UpdateName extends PersonalInfoEvent{
  final String name;

  UpdateName({required this.name});
}

class UpdateType extends PersonalInfoEvent{
  final String type;

  UpdateType({required this.type});
}