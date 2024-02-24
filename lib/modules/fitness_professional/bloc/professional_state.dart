import 'package:equatable/equatable.dart';

class ProfessionalState extends Equatable {

  const ProfessionalState({
    this.certificates = const [],
    this.speciality = 'personal trainer'
});

  @override
  List<Object?> get props => [certificates, speciality];

  final List<String> certificates;
  final String speciality;

  ProfessionalState copyWith({List<String>? certificates, String? speciality}) {
    return ProfessionalState(
      certificates: certificates ?? this.certificates,
      speciality: speciality ?? this.speciality,
    );
  }

}