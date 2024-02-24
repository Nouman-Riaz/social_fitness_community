abstract class EnthusiastEvent{}

class UpdateIndexEvent extends EnthusiastEvent{
  final int index;

  UpdateIndexEvent(this.index);
}

class UpdateActivitiesEvent extends EnthusiastEvent{
  final List<bool> index;

  UpdateActivitiesEvent(this.index);
}