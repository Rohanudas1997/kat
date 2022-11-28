import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kat_game/common/http/response.dart';
import 'package:kat_game/feature/authentication/resource/user_repository.dart';
import 'package:kat_game/feature/authentication/ui/widget/login.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({required this.userRepository})
      : super(AuthenticationInitial());
  final UserRepository userRepository;

  registerWithEmail({
    required String name,
    required String email,
    required String password,
    required String samId,
  }) async {
    emit(AuthenticationLoading());
    final _res = await userRepository.registerWithEmail(
      email: email,
      name: name,
      samId: samId,
      password: password,
    );
    if (_res.data != null && _res.status == Status.Success) {
      emit(AuthenticationRegisterSuccess());
    } else {
      emit(AuthenticationError(message: _res.message!));
    }
  }

  login({required String email, required String password}) async {
    emit(AuthenticationLoading());
    final _res = await userRepository.login(email: email, password: password);
    if (_res.data != null && _res.status == Status.Success) {
      emit(AuthenticationLoginSuccess());
    } else {
      emit(AuthenticationError(message: _res.message!));
    }
  }

  logout() async {
    emit(AuthenticationLoading());
    final _res = await userRepository.logout();
    if (_res == true) {
      emit(AuthenticationLogoutSuccess());
    } else {
      emit(
        const AuthenticationError(message: 'Unable to logout'),
      );
    }
  }
}
