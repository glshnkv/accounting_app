import 'package:accounting_app/services/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileInfoEvent>(_getProfileInfoHandler);
    on<UpdateProfileInfoEvent>(_updateProfileInfoHandler);
  }

  void _getProfileInfoHandler(
      GetProfileInfoEvent event, Emitter<ProfileState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();


    emit(LoadedProfileInfoState(
        firstName: storage.firstName,
        lastName: storage.lastName,
        gender: storage.gender));
  }

  void _updateProfileInfoHandler(
      UpdateProfileInfoEvent event, Emitter<ProfileState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    storage.firstName = event.firstName;
    storage.lastName = event.lastName;
    storage.gender = event.gender;

  }
}
