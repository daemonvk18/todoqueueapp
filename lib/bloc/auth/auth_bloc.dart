import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoqueueapp/bloc/auth/auth_events.dart';
import 'package:todoqueueapp/bloc/auth/auth_states.dart';
import '../../data/services/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authService.signIn(event.email, event.password);
        if (user != null) {
          emit(AuthAuthenticated(user.email!));
        } else {
          emit(AuthError('Sign in failed'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authService.signOut();
        emit(AuthUnauthenticated());
      } catch (e) {
        emit(AuthError('Logout failed: ${e.toString()}'));
      }
    });
  }
}
