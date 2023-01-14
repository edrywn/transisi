part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

// ignore: must_be_immutable
class AuthError extends AuthState {
  String? err;

  AuthError({this.err});

  @override
  List<Object> get props => [
        {err}
      ];
}
