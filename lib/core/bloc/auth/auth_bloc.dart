import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:first_project/core/api/auth_api.dart';
import 'package:first_project/core/bloc/auth/auth_event.dart';
import 'package:first_project/core/bloc/auth/auth_state.dart';
import 'package:first_project/helper/shared_pref_helper.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final api = AuthApi();

  AuthBloc() : super(AuthUninitialized());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    
    if (event is Login) {
      yield AuthLoading();
      try {
        final response = await api.login(email: event.email, password: event.password);
        SharedPreferencesHelper.setApiToken(response.token);
        SharedPreferencesHelper.setAuthentication(true);
        yield LoginSuccess(data: response);
      } catch (error) {
        print("ERROR: $error");
        yield AuthFailure(error: error.toString());
      }
    }
    
    if (event is Logout) {
      yield AuthLoading();
      SharedPreferencesHelper.clear();
      yield AuthUnauthenticated();
    }

  }
}