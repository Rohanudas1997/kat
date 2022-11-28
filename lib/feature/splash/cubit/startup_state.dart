part of 'startup_cubit.dart';

abstract class StartupState extends Equatable {
  const StartupState();

  @override
  List<Object> get props => [];
}

class StartupInitial extends StartupState {}

class StartupLoading extends StartupState {}

class StartupSuccess extends StartupState {
  final bool isAppOpenFirstTime;
  final bool isLoggedIn;

  const StartupSuccess({
    required this.isAppOpenFirstTime,
    required this.isLoggedIn,
  });
}
