part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationRegisterSuccess extends AuthenticationState {}

class AuthenticationLoginSuccess extends AuthenticationState {}

class AuthenticationLogoutSuccess extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String message;
  const AuthenticationError({required this.message});
}
