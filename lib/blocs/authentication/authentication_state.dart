part of 'authentication_bloc.dart';

enum AppStatus { authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  const AuthenticationState({AppUser user = AppUser.empty})
      : this._(
          status: user == AppUser.empty
              ? AppStatus.unauthenticated
              : AppStatus.authenticated,
          user: user,
        );

  const AuthenticationState._(
      {required this.status, this.user = AppUser.empty});

  final AppStatus status;
  final AppUser user;

  @override
  List<Object> get props => [status, user];
}
