import 'package:equatable/equatable.dart';
import 'package:first_project/core/model/account_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthUninitialized extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final Account data;

  const LoginSuccess({this.data});

  @override
  List<Object> get props => [data];
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure({this.error});

  @override
  List<Object> get props => [error];
}

