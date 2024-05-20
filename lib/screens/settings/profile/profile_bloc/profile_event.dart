part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class GetProfileInfoEvent extends ProfileEvent {}

class UpdateProfileInfoEvent extends ProfileEvent {
  final String firstName;
  final String lastName;
  final String gender;

  UpdateProfileInfoEvent(
      {required this.firstName, required this.lastName, required this.gender});
}
