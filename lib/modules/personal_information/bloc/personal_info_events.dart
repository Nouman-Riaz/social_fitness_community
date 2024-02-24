abstract class PersonalInfoEvent{}

class UpdateName extends PersonalInfoEvent{
  final String name;

  UpdateName({required this.name});
}

class UpdateType extends PersonalInfoEvent{
  final String type;

  UpdateType({required this.type});
}

class UpdateAge extends PersonalInfoEvent{
  final int age;

  UpdateAge({required this.age});
}

class UpdateHeight extends PersonalInfoEvent{
  final int height;

  UpdateHeight({required this.height});
}

class UpdateWeight extends PersonalInfoEvent{
  final int weight;

  UpdateWeight({required this.weight});
}

class UpdateGender extends PersonalInfoEvent{
  final String gender;

  UpdateGender({required this.gender});
}