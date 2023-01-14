import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi/data/repository/auth_repository.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final AuthRepository authRepository = AuthRepository();

    on<GetAuth>((event, emit) async {
      try {
        emit(AuthLoading());
        final result = await authRepository.login(event.email, event.password);

        emit(result.token == null ? AuthError(err: "Gagal") : AuthSuccess());
        
      } on AuthError {
        emit(AuthError(err: "Gagal Memasukan Data"));
      }
    });
  }
}
