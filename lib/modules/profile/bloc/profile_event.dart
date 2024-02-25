abstract class ProfileEvent{}

class GetProfileEvent extends ProfileEvent{

  final String email;
  GetProfileEvent(this.email);

}