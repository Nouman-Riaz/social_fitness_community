import 'package:softech/models/enthusiast_model.dart';

abstract class EnthusiastEvent{}

class UpdateIndexEvent extends EnthusiastEvent{
  final int index;

  UpdateIndexEvent(this.index);
}

class UpdateActivitiesEvent extends EnthusiastEvent{
  final List<bool> index;

  UpdateActivitiesEvent(this.index);
}

class StoreDataEvent extends EnthusiastEvent{
  final EnthusiastModel model;
  StoreDataEvent({required this.model});
}