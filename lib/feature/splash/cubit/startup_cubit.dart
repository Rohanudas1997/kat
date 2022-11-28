import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kat_game/common/database/shared_pref.dart';
import 'package:kat_game/feature/authentication/resource/user_repository.dart';

part 'startup_state.dart';

class StartupCubit extends Cubit<StartupState> {
  StartupCubit({required this.userRepository}) : super(StartupInitial());
  final UserRepository userRepository;

  fetchStartUpData() async {
    emit(StartupLoading());
    final _isOpenFirstTime = await SharedPref.getFirstTimeAppOpen();
    await userRepository.initialState();
    final isLoggedIn = userRepository.isLoggedIn.value;
    await Future.delayed(Duration(seconds: 1));
    if (isLoggedIn) {
      emit(
        StartupSuccess(isAppOpenFirstTime: false, isLoggedIn: isLoggedIn),
      );
    } else {
      if (_isOpenFirstTime) {
        emit(StartupSuccess(
            isAppOpenFirstTime: _isOpenFirstTime, isLoggedIn: isLoggedIn));
      }
      emit(
        StartupSuccess(
            isAppOpenFirstTime: _isOpenFirstTime, isLoggedIn: isLoggedIn),
      );
    }
  }
}
