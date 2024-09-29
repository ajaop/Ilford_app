part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class AuthenticationUserSubscriptionRequested
    extends AuthenticationEvent {
  const AuthenticationUserSubscriptionRequested();
}

final class AuthenticationLogoutPressed extends AuthenticationEvent {
  const AuthenticationLogoutPressed();
}
