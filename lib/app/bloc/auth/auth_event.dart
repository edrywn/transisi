part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class GetAuth extends AuthEvent {
  String? email;
  String? password;
  GetAuth({
    this.email,
    this.password,
  });
}
