abstract class ProfessionalEvent {}

class UpdateCertificates extends ProfessionalEvent{
  final List<String> certificates;

  UpdateCertificates(this.certificates);
}

class UpdateSpeciality extends ProfessionalEvent{
  final String speciality;

  UpdateSpeciality(this.speciality);
}