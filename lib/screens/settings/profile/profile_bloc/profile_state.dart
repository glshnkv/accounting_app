part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class LoadedProfileInfoState extends ProfileState {
  final String firstName;
  final String lastName;
  final String gender;

  LoadedProfileInfoState(
      {required this.firstName, required this.lastName, required this.gender});
}
